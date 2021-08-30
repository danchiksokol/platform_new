<?php

namespace App\Repository;

use App\Entity\Speaker;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Speaker|null find($id, $lockMode = null, $lockVersion = null)
 * @method Speaker|null findOneBy(array $criteria, array $orderBy = null)
 * @method Speaker[]    findAll()
 * @method Speaker[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SpeakerRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Speaker::class);
    }

    /**
     * @param int $speakerId
     * @return object
     */
    public function getOne(int $speakerId): object
    {
        return $this->find($speakerId);
    }

    /**
     * @return Speaker[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param int $chatRoomId
     * @return Speaker[]
     */
    public function getSpeakerByChatRoom(int $chatRoomId): array
    {
        return $this->findBy(['chatroom' => $chatRoomId], ['id' => 'ASC']);
    }

    /**
     * @param int $chatRoomId
     * @return array
     */
    public function getSpeakerByChatRoomForForm(int $chatRoomId): array
    {
        $speakers = $this->findBy(['chatroom' => $chatRoomId], ['id' => 'ASC']);
        $result = [];
        foreach ($speakers as $speaker) {
            $id = $speaker->getId();
            $fio = $speaker->getUser()->getSurname() . ' '
                . substr($speaker->getUser()->getName(),0,1  ) . '. '
                . substr($speaker->getUser()->getPatronymic(), 0, 1) . '.';;
            $result[$fio] = $id;
        }

        return $result;
    }
}
