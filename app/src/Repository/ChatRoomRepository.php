<?php

namespace App\Repository;

use App\Entity\ChatRoom;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method ChatRoom|null find($id, $lockMode = null, $lockVersion = null)
 * @method ChatRoom|null findOneBy(array $criteria, array $orderBy = null)
 * @method ChatRoom[]    findAll()
 * @method ChatRoom[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ChatRoomRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, ChatRoom::class);
        $this->entityManager = $entityManager;
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
     * @param ChatRoom $chatRoom
     * @throws Exception
     */
    public function setCreate(ChatRoom $chatRoom)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($chatRoom);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    public function setSave()
    {
        $this->entityManager->flush();
        $this->entityManager->clear();
    }


    /**
     * @param ChatRoom $chatRoom
     * @throws Exception
     */
    public function setDelete(ChatRoom $chatRoom)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($chatRoom);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
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
