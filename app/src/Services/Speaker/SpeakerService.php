<?php

namespace App\Services\Speaker;

use App\Entity\Speaker;
use App\Repository\ChatRoomRepository;
use App\Repository\SpeakerRepository;
use App\Repository\UserRepository;
use DateTimeImmutable;
use Exception;
use Symfony\Component\Form\Form;


class SpeakerService
{
    private SpeakerRepository $speakerRepository;
    private UserRepository $userRepository;
    private ChatRoomRepository $chatRoomRepository;

    /**
     * @param SpeakerRepository $speakerRepository
     * @param UserRepository $userRepository
     * @param ChatRoomRepository $chatRoomRepository
     */
    public function __construct(
        SpeakerRepository $speakerRepository,
        UserRepository $userRepository,
        ChatRoomRepository $chatRoomRepository
    ) {
        $this->speakerRepository = $speakerRepository;
        $this->userRepository = $userRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }

    /**
     * @param Speaker $speaker
     * @param Form $form
     * @return SpeakerService
     * @throws Exception
     */
    public function handleCreate(Speaker $speaker, Form $form): static
    {
        $user = $this->userRepository->getOne($form->get('user')->getData());
        $chatRoom = $this->chatRoomRepository->getOne($form->get('chatroom')->getData());
        $speaker->setIsShow($form->get('is_show')->getData());
        $speaker->setUser($user);
        $speaker->setChatroom($chatRoom);
        $speaker->setCreatedAt(new DateTimeImmutable());

        $this->speakerRepository->setCreate($speaker);
        $this->speakerRepository->setSave();

        return $this;
    }

    /**
     * @param Speaker $speaker
     * @param Form $form
     * @return $this
     */
    public function handleUpdate(Speaker $speaker, Form $form): static
    {
        $user = $this->userRepository->getOne($form->get('user')->getData());
        $chatRoom = $this->chatRoomRepository->getOne($form->get('chatroom')->getData());
        $speaker->setUser($user);
        $speaker->setChatroom($chatRoom);
        $speaker->setCreatedAt(new DateTimeImmutable());
        $this->speakerRepository->setSave();

        return $this;
    }

    /**
     * @param Speaker $speaker
     * @throws Exception
     */
    public function handleDelete(Speaker $speaker): void
    {
        $this->speakerRepository->setDelete($speaker);
        $this->speakerRepository->setSave();
    }

    /**
     * @param Speaker $speaker
     */
    public function handleShow(Speaker $speaker): void
    {
        $speaker->setIsShow(1);
        $this->speakerRepository->setSave();
    }

    /**
     * @param Speaker $speaker
     */
    public function handleHide(Speaker $speaker): void
    {
        $speaker->setIsShow(0);
        $this->speakerRepository->setSave();
    }

}