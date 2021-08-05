<?php

namespace App\Repository;

use App\Entity\Theses;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Theses|null find($id, $lockMode = null, $lockVersion = null)
 * @method Theses|null findOneBy(array $criteria, array $orderBy = null)
 * @method Theses[]    findAll()
 * @method Theses[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ThesesRepository extends ServiceEntityRepository
{
    /**
     * @var ManagerRegistry
     */
    private $registry;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    /**
     * ThesesRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Theses::class);
        $this->registry = $registry;
        $this->entityManager = $entityManager;
    }

    /**
     * @param Theses $theses
     * @throws Exception
     */
    public function setCreate(Theses $theses)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($theses);
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

}
