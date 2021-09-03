<?php

namespace App\Repository;

use App\Entity\ChatRoom;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ChatRoom|null find($id, $lockMode = null, $lockVersion = null)
 * @method ChatRoom|null findOneBy(array $criteria, array $orderBy = null)
 * @method ChatRoom[]    findAll()
 * @method ChatRoom[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ChatRoomRepository extends ServiceEntityRepository
{

    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ChatRoom::class);
    }

    /**
     * @param int $id
     * @return object
     */
    public function getOne(int $id): object
    {
        return $this->find($id);
    }

    /**
     * @return ChatRoom[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @return array
     */
    public function getAllForChoiceType(): array
    {
        $chatRooms = $this->getAll();
        $result = [];
        foreach ($chatRooms as $chatRoom) {
            $id = $chatRoom->getId();
            $name = $chatRoom->getName();;
            $result[$name] = $id;
        }

        return $result;
    }

}
