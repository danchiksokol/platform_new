<?php

namespace App\Controller\Main;


use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;
use App\Services\Message\MessageService;
use App\Services\Participant\ParticipantService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mercure\HubInterface;
use Symfony\Component\Mercure\Update;
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
    private ParticipantService $participantService;

    /**
     * MessageController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param ParticipantRepository $participantRepository
     * @param MessageRepository $messageRepository
     * @param MessageService $messageService
     * @param ParticipantService $participantService
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        ParticipantRepository $participantRepository,
        MessageRepository $messageRepository,
        MessageService $messageService,
        ParticipantService $participantService
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->participantRepository = $participantRepository;
        $this->messageRepository = $messageRepository;
        $this->messageService = $messageService;
        $this->participantService = $participantService;
    }


    #[Route('/messages/{chatid}', name: 'app_messages', methods: ['POST'])]
    public function getMessagesAction(Request $request): Response
    {
        $chatRoomId = $request->get('chatid');
        $userRoles = $this->getUser()->getRoles();
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

        $forRender = parent::renderDefault();
        $forRender['messages'] = $messages;
        $forRender['chatid'] = $chatRoomId;
        $forRender['delete'] = in_array("ROLE_ADMIN", $userRoles);

        $renderMessages = $this->renderView(
            'main/chatroom/index.html.twig',
            $forRender
        );

        return new Response($renderMessages);
    }


    /**
     * @param Request $request
     * @return Response
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    #[Route('message/send/ajax', name: 'app_message_send_ajax')]
    public function sendMessageAjaxAction(Request $request, HubInterface $hub): Response
    {
        if ($request->isXMLHttpRequest() && $request->get('chatId') && $request->get('content')) {
            $userId = $this->getUser()->getId();
            $user = $this->userRepository->getOne($userId);
            $userName = $user->getSurname() . ' ' . $user->getName() . ' ' . $user->getPatronymic();
            $chatRoomId = $request->get('chatId');
            $content = $request->get('content');
            $update = new Update(
                "/broadcast/{$chatRoomId}",
                json_encode([
                                'message' => $content,
                                'userId' => $userId,
                                'username' => $userName
                            ]),
                false
            );

            $mercure = $hub->publish($update);
            $participant = $this->participantService->handleCreate($chatRoomId, $userId);
            $this->messageService->handleCreate($participant, $content, $mercure);

            return new Response('success');
        }

        return new Response('This is not ajax!', 400);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    #[Route('message/ajax/delete', name: 'app_message_ajax_delete')]
    public function deleteAction(Request $request): Response
    {
        if ($request->isXMLHttpRequest() && $request->get('messageId')) {
            $messageId = (int)$request->get('messageId');
            $message = $this->messageRepository->getOne($messageId);
            $success = $this->messageService->handleDelete($message);
            return new JsonResponse(array('output' => $success));
        }

        return new Response('This is not ajax!', 400);
    }


}
