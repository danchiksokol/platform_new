<?php

namespace App\Controller\Admin;

use App\Entity\ChatRoom;
use App\Form\ChatRoomFormType;
use App\Repository\ChatRoomRepository;
use App\Services\ChatRoom\ChatRoomService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/chat_rooms', name: 'app_admin_')]
class AdminChatRoomController extends AdminBaseController
{
    private ChatRoomRepository $chatRoomRepository;
    private ChatRoomService $chatRoomService;

    /**
     * @param ChatRoomRepository $chatRoomRepository
     * @param ChatRoomService $chatRoomService
     */
    public function __construct(ChatRoomRepository $chatRoomRepository, ChatRoomService $chatRoomService)
    {
        $this->chatRoomRepository = $chatRoomRepository;
        $this->chatRoomService = $chatRoomService;
    }

    #[Route('/', name: 'chat_rooms')]
    public function indexAction(): Response
    {
        $chatRooms = $this->chatRoomRepository->getAll();
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Трансляции';
        $forRender['chatRooms'] = $chatRooms;

        return $this->render(
            'admin/chat_room/index.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @param int $id
     * @return Response
     */
    #[Route('/create', name: 'chat_rooms_create')]
    public function createAction(Request $request): Response
    {
        $chatRoom = new ChatRoom();
        $form = $this->createForm(ChatRoomFormType::class, $chatRoom);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->chatRoomService->handleCreate($chatRoom, $form);
            $this->addFlash('Success', 'Трансляция создана успешно');

            return $this->redirectToRoute('app_admin_chat_rooms');
        }


        $forRender = parent::renderDefault();
        $forRender['title'] = 'Создание трансляции';
        $forRender['chatRoomForm'] = $form->createView();

        return $this->render(
            'admin/chat_room/form.html.twig',
            $forRender
        );
    }


    /**
     * @param Request $request
     * @param int $id
     * @return Response
     */
    #[Route('/update/{id}', name: 'chat_rooms_update')]
    public function updateAction(Request $request, int $id): Response
    {
        $chatRoom = $this->chatRoomRepository->getOne($id);
        $form = $this->createForm(ChatRoomFormType::class, $chatRoom);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->chatRoomService->handleUpdate($chatRoom, $form);
            $this->addFlash('Success', 'Изменена успешно');

            return $this->redirectToRoute('app_admin_chat_rooms');
        }


        $forRender = parent::renderDefault();
        $forRender['title'] = 'Редактирование трансляции';
        $forRender['chatRoomForm'] = $form->createView();

        return $this->render(
            'admin/chat_room/form.html.twig',
            $forRender
        );
    }

    /**
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/delete/{id}', name: 'chat_rooms_delete')]
    public function deleteAction(int $id):Response
    {
        $chatRoom = $this->chatRoomRepository->getOne($id);
        $this->chatRoomService->handleDelete($chatRoom);
        $this->addFlash('success', 'Трансляция удалена');

        return $this->redirectToRoute('app_admin_chat_rooms');
    }
}