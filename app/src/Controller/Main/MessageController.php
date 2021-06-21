<?php

namespace App\Controller\Main;

use App\Entity\Message;
use App\Entity\Participant;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MessageController extends BaseController
{
    const ATRIBUTES_TO_SERIALIZE = ['id', 'content', 'created_at'];

    /**
     * @var MessageRepository
     */
    private $messageRepository;

    /**
     * MessageController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param ParticipantRepository $participantRepository
     * @param MessageRepository $messageRepository
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        ParticipantRepository $participantRepository,
        MessageRepository $messageRepository
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->participantRepository = $participantRepository;
        $this->messageRepository = $messageRepository;
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
     * @param Participant $participant
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     * @throws \Exception
     */
    #[Route('/newmessage/{chatid}', name: 'newMessage', methods: ['POST'])]
    public function sendAction(Request $request)
    {
        $chatRoomId = $request->get('chatid');
        $chatRoom = $this->chatRoomRepository->find($chatRoomId);
        $user = $this->getUser();
        $content = $request->get('content');

        //TODO:: Сделать отправку сообщений через сервис для вопросов лектору
        return $this->redirectToRoute('app_chatroom', ['chatid' => $chatRoomId]);
    }

}
