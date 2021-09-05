<?php

namespace App\Repository;

use App\Entity\VisitControl;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method VisitControl|null find($id, $lockMode = null, $lockVersion = null)
 * @method VisitControl|null findOneBy(array $criteria, array $orderBy = null)
 * @method VisitControl[]    findAll()
 * @method VisitControl[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VisitControlRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, VisitControl::class);
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
     * @return VisitControl[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param VisitControl $visitControl
     * @throws Exception
     */
    public function setCreate(VisitControl $visitControl)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($visitControl);

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
     * @param VisitControl $visitControl
     * @throws Exception
     */
    public function setDelete(VisitControl $visitControl)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($visitControl);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

}
