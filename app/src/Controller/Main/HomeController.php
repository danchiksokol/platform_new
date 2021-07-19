<?php


namespace App\Controller\Main;

use App\Entity\ChatRoom;
use App\Repository\ChatRoomRepository;
use App\Repository\MessageRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends BaseController
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
     * HomeController constructor.
     * @param UserRepository $userRepository
     * @param EntityManagerInterface $entityManager
     * @param ChatRoomRepository $chatRoomRepository
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

    #[Route('/', 'home')]
    public function indexAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Главная страница';

        $chatRoom = $this->chatRoomRepository->getOne(ChatRoom::MEGA_CHAT);
        if (is_null($chatRoom)) {
            throw new \Exception('Такого чата нет!');
        }
        $messages = $this->messageRepository->findAllMessagesByChatRoomId(ChatRoom::MEGA_CHAT);
        array_map(
            function ($message) {
                $message->setMine(
                    $message->getParticipant()->getUser()->getId() === $this->getUser()->getId()
                        ? true : false
                );
            },
            $messages
        );

        $forRender['messages'] = $messages;
        $forRender['user'] = $this->getUser()->getId();
        $forRender['chatid'] = ChatRoom::MEGA_CHAT;

        return $this->render('main/index.html.twig', $forRender);
    }

    #[Route('/programms', 'programms')]
    public function programmsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Программы';
        return $this->render('main/programms/index.html.twig', $forRender);
    }

    #[Route('/sponsors', 'sponsors')]
    public function sponsorsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Страница виртуальной выставки';
        return $this->render('main/sponsors/index.html.twig', $forRender);
    }

    #[Route('/broadcast', 'broadcast')]
    public function broadcastAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Трансляция сессии';
        return $this->render('main/broadcast/index.html.twig', $forRender);
    }

    #[Route('/help', 'help')]
    public function helpAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Поддержка';
        return $this->render('main/help/index.html.twig', $forRender);
    }

}