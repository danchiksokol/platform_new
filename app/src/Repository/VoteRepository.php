<?php

namespace App\Repository;

use App\Entity\User;
use App\Entity\Vote;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Vote|null find($id, $lockMode = null, $lockVersion = null)
 * @method Vote|null findOneBy(array $criteria, array $orderBy = null)
 * @method Vote[]    findAll()
 * @method Vote[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VoteRepository extends ServiceEntityRepository
{
    private ManagerRegistry $registry;
    private EntityManagerInterface $entityManager;

    /**
     * VoteRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Vote::class);
        $this->registry = $registry;
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
     * @return Vote[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param Vote $vote
     * @throws Exception
     */
    public function setCreate(Vote $vote)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($vote);

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
     * @param Vote $vote
     * @throws Exception
     */
    public function setDelete(Vote $vote)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($vote);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param User $user
     * @return Vote|null
     */
    public function getOneByUser(User $user): ?Vote
    {
        return $this->findOneBy(['user' => $user]);
    }

}
