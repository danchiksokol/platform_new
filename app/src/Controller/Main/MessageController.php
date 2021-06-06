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
    public function index(): Response
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
    #[Route('/{chatid}', name: 'newMessage', methods: ['POST'])]
    public function send(Request $request)
    {
        $chatRoomId = $request->get('chatid');
        $chatRoom = $this->chatRoomRepository->find($chatRoomId);
        $user = $this->getUser();
        $content = $request->get('content');

        $message = new Message();
        $message->setContent($content);
        $message->setCreatedAt(new \DateTime('NOW'));
        $message->setIsShow(1);

        $participant = new Participant();
        $participant->addMessage($message);
        $participant->setUser($user);
        $participant->setIsBlock(0);
        $participant->setChatroom($chatRoom);

        $this->entityManager->beginTransaction();
        try{
            $this->entityManager->persist($message);
            $this->entityManager->persist($participant);
            $this->entityManager->flush();

            $this->entityManager->commit();
        }catch (\Exception $exception){
            $this->entityManager->rollback();
            throw $exception;
        }

        return $this->redirectToRoute('app_chatroom', ['chatid' => $chatRoomId]);
//        return $this->json($message, Response::HTTP_CREATED, [], [
//            'attributes' => self::ATRIBUTES_TO_SERIALIZE
//        ]);
    }

}
