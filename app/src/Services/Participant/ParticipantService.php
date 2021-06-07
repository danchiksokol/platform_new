<?php


namespace App\Services\Participant;


use App\Entity\Participant;
use App\Repository\ChatRoomRepository;
use App\Repository\ParticipantRepository;
use App\Repository\UserRepository;

class ParticipantService
{
    /**
     * @var ParticipantRepository
     */
    private $participantRepository;
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var ChatRoomRepository
     */
    private $chatRoomRepository;

    /**
     * ParticipantService constructor.
     * @param ParticipantRepository $participantRepository
     * @param ChatRoomRepository $chatRoomRepository
     * @param UserRepository $userRepository
     */
    public function __construct(ParticipantRepository $participantRepository, ChatRoomRepository $chatRoomRepository, UserRepository $userRepository)
    {
        $this->participantRepository = $participantRepository;
        $this->userRepository = $userRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }

    /**
     * @param int $chatRoomId
     * @param int $userId
     * @return $this
     */
    public function createParticipant(int $chatRoomId, int $userId)
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

        return $participant;
    }

}