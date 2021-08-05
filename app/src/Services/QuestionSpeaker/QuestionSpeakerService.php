<?php


namespace App\Services\QuestionSpeaker;


use App\Entity\QuestionSpeaker;
use App\Repository\ChatRoomRepository;
use App\Repository\QuestionSpeakerRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use DateTime;
use Exception;
use Symfony\Component\Form\Form;

class QuestionSpeakerService
{
    /**
     * @var QuestionSpeakerRepository
     */
    private QuestionSpeakerRepository $questionSpeakerRepository;
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
     * @param array $options
     * @return $this
     * @throws Exception
     */
    public function handleCreate(QuestionSpeaker $questionSpeaker, Form $form, array $options): object
    {
        $user = $this->userRepository->getOne($options['user']);
        $chatRoom = $this->chatRoomRepository->getOne($options['chatRoom']);
        $speaker = $this->speakerRepository->getOne($form->get('speaker')->getData());
        $questionSpeaker->setContent($form->get('content')->getData());
        $questionSpeaker->setUser($user);
        $questionSpeaker->setSpeaker($speaker);
        $questionSpeaker->setChatroom($chatRoom);
        $questionSpeaker->setIsShow(0);
        $questionSpeaker->setCreatedAt(new DateTime());
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
     * @throws Exception
     */
    public function handleDelete(QuestionSpeaker $questionSpeaker): void
    {
        $this->questionSpeakerRepository->setDelete($questionSpeaker);
    }


    //TODO вынести в репозиторий
    /**
     * @param int $chatRoomId
     * @return array
     */
    public function getQuestionSpeakerForRender(int $chatRoomId): array
    {
        $result = [];
        $questions = $this->questionSpeakerRepository->getAllByChatRoomForUser($chatRoomId);
        foreach ($questions as $question) {
            $id = $question->getId();
            $fio = $question->getUser()->getSurname() . ' ' . $question->getUser()->getName();
            $content = $question->getContent();
            $result[$id] = ['fio' => $fio, 'content' => $content];
        }
        return $result;
    }

    public function getQuestionSpeakerForRenderAdmin(int $chatRoomId): array
    {
        $result = [];
        $questions = $this->questionSpeakerRepository->getAllByChatRoomForAdmin($chatRoomId);
        foreach ($questions as $question) {
            $id = $question->getId();
            $user = $question->getUser()->getSurname() . ' ' . $question->getUser()->getName();
            $speaker = $question->getSpeaker()->getUser()->getSurname() . ' ' . $question->getSpeaker()->getUser(
                )->getName();
            $content = $question->getContent();
            $chat = $question->getChatroom()->getName();
            $result[$id] = [
                'id' => $id,
                'user' => $user,
                'speaker' => $speaker,
                'content' => $content,
                'chat' => $chat
            ];
        }

        return $result;
    }
}