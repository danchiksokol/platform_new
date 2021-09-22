<?php

namespace App\Services\ChatRoom;

use App\Entity\ChatRoom;
use App\Repository\ChatRoomRepository;
use Exception;
use Symfony\Component\Form\Form;

class ChatRoomService
{
    private ChatRoomRepository $chatRoomRepository;

    /**
     * @param ChatRoomRepository $chatRoomRepository
     */
    public function __construct(ChatRoomRepository $chatRoomRepository)
    {
        $this->chatRoomRepository = $chatRoomRepository;
    }


    /**
     * @param ChatRoom $chatRoom
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreate(ChatRoom $chatRoom, Form $form): static
    {
        $chatRoom->setName($form->get('name')->getData());
        $chatRoom->setBroadcast($form->get('broadcast')->getData());
        $this->chatRoomRepository->setCreate($chatRoom);
        $this->chatRoomRepository->setSave();

        return $this;
    }

    /**
     * @param ChatRoom $chatRoom
     * @param Form $form
     * @return $this
     */
    public function handleUpdate(ChatRoom $chatRoom, Form $form): static
    {
        $chatRoom->setName($form->get('name')->getData());
        $chatRoom->setBroadcast($form->get('broadcast')->getData());
        $this->chatRoomRepository->setSave();

        return $this;
    }

    /**
     * @param ChatRoom $chatRoom
     * @throws Exception
     */
    public function handleDelete(ChatRoom $chatRoom)
    {
        $this->chatRoomRepository->setDelete($chatRoom);
        $this->chatRoomRepository->setSave();
    }

}