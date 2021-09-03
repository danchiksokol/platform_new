<?php

namespace App\Controller\Admin;

use App\Entity\Speaker;
use App\Form\SpeakerFormType;
use App\Repository\ChatRoomRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use App\Services\Speaker\SpeakerService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/speaker', name: 'app_admin_')]
class AdminSpeakerController extends AdminBaseController
{
    private SpeakerRepository $speakerRepository;
    private SpeakerService $speakerService;
    private UserRepository $userRepository;
    private ChatRoomRepository $chatRoomRepository;

    /**
     * @param SpeakerRepository $speakerRepository
     * @param SpeakerService $speakerService
     * @param UserRepository $userRepository
     * @param ChatRoomRepository $chatRoomRepository
     */
    public function __construct(
        SpeakerRepository $speakerRepository,
        SpeakerService $speakerService,
        UserRepository $userRepository,
        ChatRoomRepository $chatRoomRepository
    ) {
        $this->speakerRepository = $speakerRepository;
        $this->speakerService = $speakerService;
        $this->userRepository = $userRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }

    /**
     * @return Response
     */
    #[Route('/', name: 'speaker')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Спикеры';
        $forRender['speakers'] = $this->speakerRepository->getAll();
        return $this->render(
            'admin/speaker/index.html.twig',
            $forRender
        );
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/create', name: 'speaker_create')]
    public function createAction(Request $request): Response
    {
        $speaker = new Speaker();
        $users = $this->userRepository->getAllForChoiceType();
        $chatRooms = $this->chatRoomRepository->getAllForChoiceType();
        $options = [
            'users' => $users,
            'chatRooms' => $chatRooms

        ];
        $form = $this->createForm(SpeakerFormType::class, $speaker, $options);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->speakerService->handleCreate($speaker, $form);
            $this->addFlash('Success', 'Спикер добавлен успешно');

            return $this->redirectToRoute('app_admin_speaker');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Добавление спикеров';
        $forRender['speakerForm'] = $form->createView();

        return $this->render('admin/speaker/form.html.twig', $forRender);
    }

    #[Route('/update/{id}', name: 'speaker_update')]
    public function updateAction(Request $request, int $id):Response
    {
        $speaker = $this->speakerRepository->getOne($id);
        $userId = $speaker->getUser()->getId();
        $speaker->setUser($userId);
        $chatRoomId = $speaker->getChatRoom()->getId();
        $speaker->setChatRoom($chatRoomId);
        $users = $this->userRepository->getAllForChoiceType();
        $chatRooms = $this->chatRoomRepository->getAllForChoiceType();
        $options = [
            'users' => $users,
            'chatRooms' => $chatRooms

        ];
        $form = $this->createForm(SpeakerFormType::class, $speaker, $options);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->speakerService->handleUpdate($speaker, $form);
            $this->addFlash('Success', 'Спикер отредактирован успешно');

            return $this->redirectToRoute('app_admin_speaker');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Добавление спикеров';
        $forRender['speakerForm'] = $form->createView();

        return $this->render('admin/speaker/form.html.twig', $forRender);
    }

    /**
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/delete/{id}', name: 'speaker_delete')]
    public function deleteAction(int $id):Response
    {
        $speaker = $this->speakerRepository->getOne($id);
        $this->speakerService->handleDelete($speaker);

        return $this->redirectToRoute('app_admin_speaker');
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/show/{id}', name: 'speaker_show')]
    public function showAction(int $id): Response
    {
        $speaker = $this->speakerRepository->getOne($id);
        $this->speakerService->handleShow($speaker);

        return $this->redirectToRoute('app_admin_speaker');
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/hide/{id}', name: 'speaker_hide')]
    public function hideAction(int $id): Response
    {
        $speaker = $this->speakerRepository->getOne($id);
        $this->speakerService->handleHide($speaker);

        return $this->redirectToRoute('app_admin_speaker');
    }


}
