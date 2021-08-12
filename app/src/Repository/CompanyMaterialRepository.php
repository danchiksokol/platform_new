<?php

namespace App\Repository;

use App\Entity\CompanyMaterial;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method CompanyMaterial|null find($id, $lockMode = null, $lockVersion = null)
 * @method CompanyMaterial|null findOneBy(array $criteria, array $orderBy = null)
 * @method CompanyMaterial[]    findAll()
 * @method CompanyMaterial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CompanyMaterialRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, CompanyMaterial::class);
        $this->entityManager = $entityManager;
    }


    /**
     * @param int $id
     * @return companyMaterial
     */
    public function getOne(int $id): companyMaterial
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
     * @param CompanyMaterial $companyMaterial
     * @throws Exception
     */
    public function setCreate(CompanyMaterial $companyMaterial)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($companyMaterial);

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
     * @param companyMaterial $companyMaterial
     * @throws Exception
     */
    public function setDelete(companyMaterial $companyMaterial)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($companyMaterial);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }
}
