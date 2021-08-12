<?php

namespace App\Repository;

use App\Entity\CompanyVideo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method CompanyVideo|null find($id, $lockMode = null, $lockVersion = null)
 * @method CompanyVideo|null findOneBy(array $criteria, array $orderBy = null)
 * @method CompanyVideo[]    findAll()
 * @method CompanyVideo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CompanyVideoRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, CompanyVideo::class);
        $this->entityManager = $entityManager;
    }


    /**
     * @param int $id
     * @return CompanyVideo
     */
    public function getOne(int $id): CompanyVideo
    {
        return $this->find($id);
    }

    /**
     * @return array
     */
    public function getAll(): array
    {
        return $this->getAll();
    }


    /**
     * @param CompanyVideo $companyVideo
     * @throws Exception
     */
    public function setCreate(CompanyVideo $companyVideo)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($companyVideo);

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
     * @param CompanyVideo $companyVideo
     * @throws Exception
     */
    public function setDelete(CompanyVideo $companyVideo)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($companyVideo);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

}
