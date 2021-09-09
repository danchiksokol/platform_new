<?php

namespace App\Repository;

use App\Entity\Participant;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Participant|null find($id, $lockMode = null, $lockVersion = null)
 * @method Participant|null findOneBy(array $criteria, array $orderBy = null)
 * @method Participant[]    findAll()
 * @method Participant[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ParticipantRepository extends ServiceEntityRepository
{
    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;
    /**
     * @var ManagerRegistry
     */
    private ManagerRegistry $registry;

    /**
     * ParticipantRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Participant::class);
        $this->entityManager = $entityManager;
        $this->registry = $registry;
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
     * @return Participant[]
     */
    public function getAll(): array
    {
        return $this->getAll();
    }

    /**
     * @param int $chatRoomId
     * @param int $userId
     * @return bool|null
     */
    public function isParticipantBlock(int $chatRoomId, int $userId): ?bool
    {
        $participant = $this->findOneBy(['chatroom_id' => $chatRoomId, 'user_id' => $userId]);

        if ($participant) {
            return $participant->getIsBlock();
        }

        return false;
    }


    /**
     * @param int $chatRoomId
     * @param int $userId
     * @return Participant|false
     */
    public function isParticipantExist(int $chatRoomId, int $userId): bool|Participant
    {
        $participant = $this->findOneBy(['chatroom' => $chatRoomId, 'user' => $userId]);
        if ($participant) {
            return $participant;
        }

        return false;
    }


    /**
     * @param Participant $participant
     * @throws Exception
     */
    public function setCreate(Participant $participant)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($participant);
            $this->entityManager->flush();

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
     * @param Participant $participant
     * @throws Exception
     */
    public function setDelete(Participant $participant)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($participant);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }
}
