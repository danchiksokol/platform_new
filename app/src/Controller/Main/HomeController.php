<?php


namespace App\Controller\Main;

use App\Entity\ChatRoom;
use App\Form\RegistrationHelpFormType;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\NewsRepository;
use App\Repository\UserRepository;
use App\Services\Mailer\MailerService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends BaseController
{
    private UserRepository $userRepository;
    private EntityManagerInterface $entityManager;
    private ChatRoomRepository $chatRoomRepository;
    private MessageRepository $messageRepository;
    private NewsRepository $newsRepository;
    private MailerService $mailerService;


    /**
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
     * @param MessageRepository $messageRepository
     * @param NewsRepository $newsRepository
     * @param MailerService $mailerService
     */
    public function __construct(
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        ChatRoomRepository $chatRoomRepository,
        MessageRepository $messageRepository,
        NewsRepository $newsRepository,
        MailerService $mailerService
    ) {
        $this->userRepository = $userRepository;
        $this->entityManager = $entityManager;
        $this->chatRoomRepository = $chatRoomRepository;
        $this->messageRepository = $messageRepository;
        $this->newsRepository = $newsRepository;
        $this->mailerService = $mailerService;
    }

    #[Route('/', 'app_main_home_index')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Главная страница';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/index.html.twig', $forRender);
    }

    #[Route('/start', 'app_main_home_start')]
    public function startAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Старт';
        return $this->render('main/start/index.html.twig', $forRender);
    }

    #[Route('/programms/17', 'app_main_home_programms17')]
    public function programms17Action(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Программы';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/programms/index17.html.twig', $forRender);
    }

    #[Route('/programms/18', 'app_main_home_programms18')]
    public function programms18Action(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Программы';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/programms/index18.html.twig', $forRender);
    }

    #[Route('/symposium/17', 'app_main_home_symposium17')]
    public function symposium17Action(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Симпозиумы';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/simposium/index17.html.twig', $forRender);
    }

    #[Route('/symposium/18', 'app_main_home_symposium18')]
    public function symposium18Action(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Симпозиумы';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/simposium/index18.html.twig', $forRender);
    }

    #[Route('/nmo', 'app_main_home_nmo')]
    public function nmoAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'НМО';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/nmo/index.html.twig', $forRender);
    }

    #[Route('/sponsors', 'app_main_home_sponsors')]
    public function sponsorsAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Спонсоры';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/sponsors/index.html.twig', $forRender);
    }

    #[Route('/exhibition', 'app_main_home_exhibition')]
    public function exhibitionAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Страница виртуальной выставки';
        return $this->render('main/exhibition/index.html.twig', $forRender);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws TransportExceptionInterface
     */
    #[Route('/help', 'app_main_home_help')]
    public function helpAction(Request $request): Response
    {
        $helpFrom = $this->createForm(RegistrationHelpFormType::class);
        $helpFrom->handleRequest($request);
        if ($helpFrom->get('helpButton')->isClicked() && $helpFrom->isSubmitted()) {
            $title = 'Вопрос из технической поддержки Лимфорум';
            $this->mailerService->handleSendRegistrationHelpEmail($helpFrom, $title);
            $this->addFlash('successHelpSend', 'Ваше обращение отправлено');
            return $this->redirectToRoute('app_main_home_help');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Поддержка';
        $forRender['helpForm'] = $helpFrom->createView();
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/help/index.html.twig', $forRender);
    }

}