<?php


namespace App\Services\Participant;


use App\Entity\Participant;
use App\Repository\ChatRoomRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;
use Exception;

class ParticipantService
{
    /**
     * @var UserRepository
     */
    private UserRepository $userRepository;
    /**
     * @var ChatRoomRepository
     */
    private ChatRoomRepository $chatRoomRepository;

    /**
     * ParticipantService constructor.
     * @param ParticipantRepository $participantRepository
     * @param ChatRoomRepository $chatRoomRepository
     * @param UserRepository $userRepository
     */
    public function __construct(
        private ParticipantRepository $participantRepository,
        ChatRoomRepository $chatRoomRepository,
        UserRepository $userRepository
    ) {
        $this->userRepository = $userRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }

    /**
     * @param int $chatRoomId
     * @param int $userId
     * @return ParticipantService
     * @throws Exception
     */
    public function handleCreate(int $chatRoomId, int $userId): ParticipantService
    {
        $participant = $this->participantRepository->isParticipantExist($chatRoomId, $userId);
        if ($participant) {
            return $participant;
        }

        $chatRoom = $this->chatRoomRepository->getOne($chatRoomId);
        $user = $this->userRepository->getOne($userId);

        $participant = new Participant();
        $participant->setUser($user);
        $participant->setIsBlock(0);
        $participant->setChatroom($chatRoom);
        $this->participantRepository->setCreate($participant);

        return $this;
    }

    /**
     * @param Participant $participant
     * @throws Exception
     */
    public function handleDelete(Participant $participant)
    {
        $this->participantRepository->setDelete($participant);
    }

}