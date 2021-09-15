<?php

namespace App\Controller\Main;

use App\Entity\Message;
use App\Entity\Participant;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;
use App\Services\Message\MessageService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MessageController extends BaseController
{
    /**
     * @var MessageRepository
     */
    private MessageRepository $messageRepository;
    private UserRepository $userRepository;
    private EntityManagerInterface $entityManager;
    private ChatRoomRepository $chatRoomRepository;
    private ParticipantRepository $participantRepository;
    private MessageService $messageService;

    /**
     * MessageController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param ParticipantRepository $participantRepository
     * @param MessageRepository $messageRepository
     * @param MessageService $messageService
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        ParticipantRepository $participantRepository,
        MessageRepository $messageRepository,
        MessageService $messageService
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->participantRepository = $participantRepository;
        $this->messageRepository = $messageRepository;
        $this->messageService = $messageService;
    }


    #[Route('/message', name: 'message')]
    public function indexAction(): Response
    {
        return $this->render('message/index.html.twig', [
            'controller_name' => 'MessageController',
        ]);
    }


    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/newmessage/{chatid}', name: 'newMessage', methods: ['POST'])]
    public function sendAction(Request $request): Response
    {
        $chatRoomId = $request->get('chatid');
        $chatRoom = $this->chatRoomRepository->find($chatRoomId);
        $user = $this->getUser();
        $content = $request->get('content');

        return $this->redirectToRoute('app_chatroom', ['chatid' => $chatRoomId]);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    #[Route('message/ajax/delete', name: 'app_message_ajax_delete')]
    public function deleteAction(Request $request):Response
    {
        if ($request->isXMLHttpRequest() && $request->get('messageId')) {
            $messageId = (int)$request->get('messageId');
            $message=$this->messageRepository->getOne($messageId);
            $success = $this->messageService->handleDelete($message);
            return new JsonResponse(array('output' => $success));
        }

        return new Response('This is not ajax!', 400);
    }

}
