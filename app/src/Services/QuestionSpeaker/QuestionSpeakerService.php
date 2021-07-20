<?php


namespace App\Services\QuestionSpeaker;


use App\Entity\QuestionSpeaker;
use App\Repository\ChatRoomRepository;
use App\Repository\QuestionSpeakerRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use Symfony\Component\Form\Form;

class QuestionSpeakerService
{
    /**
     * @var QuestionSpeakerRepository
     */
    private $questionSpeakerRepository;
    private UserRepository $userRepository;
    private SpeakerRepository $speakerRepository;
    private ChatRoomRepository $chatRoomRepository;

    /**
     * QuestionSpeakerService constructor.
     * @param QuestionSpeakerRepository $questionSpeakerRepository
     * @param UserRepository $userRepository
     * @param SpeakerRepository $speakerRepository
     * @param ChatRoomRepository $chatRoomRepository
     */
    public function __construct(
        QuestionSpeakerRepository $questionSpeakerRepository,
        UserRepository $userRepository,
        SpeakerRepository $speakerRepository,
        ChatRoomRepository $chatRoomRepository
    ) {
        $this->questionSpeakerRepository = $questionSpeakerRepository;
        $this->userRepository = $userRepository;
        $this->speakerRepository = $speakerRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     * @param Form $form
     * @return $this
     */
    public function handleCreate(QuestionSpeaker $questionSpeaker, Form $form, array $options)
    {
        $user = $this->userRepository->getOne($options['user']);
        $chatRoom = $this->chatRoomRepository->getOne($options['chatRoom']);
        $speaker = $this->speakerRepository->getOne($form->get('speaker')->getData());
        $questionSpeaker->setContent($form->get('content')->getData());
        $questionSpeaker->setUser($user);
        $questionSpeaker->setSpeaker($speaker);
        $questionSpeaker->setChatroom($chatRoom);
        $questionSpeaker->setIsShow(0);
        $questionSpeaker->setCreatedAt(new \DateTime());
        $this->questionSpeakerRepository->setCreate($questionSpeaker);

        return $this;
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     */
    public function handleHide(QuestionSpeaker $questionSpeaker): void
    {
        $this->questionSpeakerRepository->setHide($questionSpeaker);
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     */
    public function handleShow(QuestionSpeaker $questionSpeaker): void
    {
        $this->questionSpeakerRepository->setShow($questionSpeaker);
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     * @throws \Exception
     */
    public function handleDelete(QuestionSpeaker $questionSpeaker): void
    {
        $this->questionSpeakerRepository->setDelete($questionSpeaker);
    }
}