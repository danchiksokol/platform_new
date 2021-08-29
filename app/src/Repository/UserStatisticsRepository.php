<?php

namespace App\Repository;

use App\Entity\UserStatistics;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method UserStatistics|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserStatistics|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserStatistics[]    findAll()
 * @method UserStatistics[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserStatisticsRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, UserStatistics::class);
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
     * @return UserStatistics[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param UserStatistics $statistics
     */
    public function setCreate(UserStatistics $statistics)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($statistics);

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
     * @param UserStatistics $statistics
     */
    public function setDelete(UserStatistics $statistics)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($statistics);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

}
