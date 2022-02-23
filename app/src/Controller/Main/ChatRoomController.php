<?php

namespace App\Controller\Main;

use App\Entity\QuestionSpeaker;
use App\Form\QuestionSpeakerFormType;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use App\Services\QuestionSpeaker\QuestionSpeakerService;
use App\Services\Token\TokenService;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\WebLink\Link;

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
    private TokenService $tokenService;

    /**
     * ChatRoomController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param MessageRepository $messageRepository
     * @param QuestionSpeakerService $questionSpeakerService
     * @param SpeakerRepository $speakerRepository
     * @param TokenService $tokenService
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        MessageRepository $messageRepository,
        QuestionSpeakerService $questionSpeakerService,
        SpeakerRepository $speakerRepository,
        TokenService $tokenService
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->messageRepository = $messageRepository;
        $this->questionSpeakerService = $questionSpeakerService;
        $this->speakerRepository = $speakerRepository;
        $this->tokenService = $tokenService;
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/{chatid}', name: 'broadcast', defaults: ['chatid' => 1])]
    public function indexAction(Request $request): Response
    {
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
        $forRender['userId'] = $userId;
        $forRender['delete'] = in_array("ROLE_ADMIN", $userRoles);
        $forRender['messages'] = $messages;
        $forRender['chatid'] = $chatRoomId;
        $forRender['speakers'] = $speakers;
        $forRender['questions'] = $questions;
        $forRender['broadcast'] = $chatRoom->getBroadcast();
        $forRender['questionForm'] = $form->createView();

        $responce = $this->render(
            'main/broadcast/index.html.twig',
            $forRender
        );

        $hubUrl = $this->getParameter('mercure.default_hub');
        $this->addLink($request, new Link('mercure', $hubUrl));
        $token = $this->tokenService->createToken($chatRoomId);
        $responce->headers->setCookie(
            new Cookie(
                'mercureAuthorization',
                $token,
                (new \DateTime())->add(new \DateInterval('PT2H')),
                '/.well-known/mercure',
                null,
                false,
                true,
                false,
                'strict'
            )
        );

        return $responce;
    }


    #[Route('reload/ajax', name: 'broadcast_reload_ajax')]
    public function reloadPageAction(Request $request): Response
    {
        if ($request->isXMLHttpRequest() && $request->get('chatId')) {
            $chatRoomId = $request->get('chatId');
            $chatRoom = $this->chatRoomRepository->getOne($chatRoomId);
            $isReload = $chatRoom->getIsReloadPage();

            return new JsonResponse(array('reload' => $isReload));
        }

        return new Response('This is not ajax!', 400);
    }

}
