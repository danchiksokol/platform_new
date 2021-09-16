<?php

namespace App\Controller\Main;

use App\Entity\QuestionSpeaker;
use App\Form\QuestionSpeakerFormType;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use App\Services\QuestionSpeaker\QuestionSpeakerService;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/broadcast', name: 'app_')]
class ChatRoomController extends BaseController
{
    /**
     * @var UserRepository
     */
    private UserRepository $userRepository;
    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;
    /**
     * @var ChatRoomRepository
     */
    private ChatRoomRepository $chatRoomRepository;
    /**
     * @var MessageRepository
     */
    private MessageRepository $messageRepository;
    private QuestionSpeakerService $questionSpeakerService;
    private SpeakerRepository $speakerRepository;

    /**
     * ChatRoomController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param MessageRepository $messageRepository
     * @param QuestionSpeakerService $questionSpeakerService
     * @param SpeakerRepository $speakerRepository
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        MessageRepository $messageRepository,
        QuestionSpeakerService $questionSpeakerService,
        SpeakerRepository $speakerRepository
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->messageRepository = $messageRepository;
        $this->questionSpeakerService = $questionSpeakerService;
        $this->speakerRepository = $speakerRepository;
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/{chatid}', name: 'broadcast', defaults: ['chatid' => 1])]
    public function indexAction(
        Request $request
    ): Response {
        $chatRoomId = $request->get('chatid');
        $chatRoom = $this->chatRoomRepository->getOne($chatRoomId);
        $userId = $this->getUser()->getId();
        if (is_null($chatRoom)) {
            throw new Exception('Такого чата нет!');
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

        $speakers = $this->speakerRepository->getSpeakerByChatRoomForForm($chatRoomId);
        $question = new QuestionSpeaker();
        $form = $this->createForm(
            QuestionSpeakerFormType::class,
            $question,
            [
                'speakers' => $speakers,
            ]
        );
        $options = [
            'user' => $userId,
            'chatRoom' => $chatRoomId
        ];
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $this->questionSpeakerService->handleCreate($question, $form, $options);
            $this->addFlash('Success', 'Отправлен успешно');

            return $this->redirectToRoute('app_broadcast', ['chatid' => $chatRoomId]);
        }

        $questions = $this->questionSpeakerService->getQuestionSpeakerForRender($chatRoomId);

        $userRoles = $this->getUser()->getRoles();
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Трансляция сессии';
        $forRender['user'] = $userId;
        $forRender['delete'] = in_array("ROLE_ADMIN", $userRoles);
        $forRender['messages'] = $messages;
        $forRender['chatid'] = $chatRoomId;
        $forRender['speakers'] = $speakers;
        $forRender['questions'] = $questions;
        $forRender['broadcast'] = $chatRoom->getBroadcast();
        $forRender['questionForm'] = $form->createView();

        return $this->render(
            'main/broadcast/index.html.twig',
            $forRender
        );
    }

}
