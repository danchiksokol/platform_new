<?php

namespace App\Controller\Main;

use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/chatroom', name: 'app_')]
class ChatRoomController extends BaseController
{
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;
    /**
     * @var ChatRoomRepository
     */
    private $chatRoomRepository;
    /**
     * @var MessageRepository
     */
    private $messageRepository;

    /**
     * ChatRoomController constructor.
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
        MessageRepository $messageRepository
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->messageRepository = $messageRepository;
    }

    /**
     * @param Request $request
     * @return Response
     * @throws \Exception
     */
    #[Route('/{chatid}', name: 'chatroom')]
    public function indexAction(
        Request $request
    ): Response {
        $chatRoomId = $request->get('chatid');
        $chatRoom = $this->chatRoomRepository->find($chatRoomId);

        if (is_null($chatRoom)) {
            throw new \Exception('Такого чата нет!');
        }

        $messages = $this->messageRepository->findAllMessagesByChatRoomId($chatRoomId);

        array_map(
            function ($message) {
                $message->setMine(
                    $message->getParticipant()->getUser()->getId() === $this->getUser()->getId()
                        ? true : false
                );
            },
            $messages
        );

//        dd($messages);

        return $this->render(
            'chatroom/index.html.twig',
            [
                'user' => $this->getUser()->getId(),
                'messages' => $messages,
                'chatid' => $chatRoomId
            ]
        );

    }

}
