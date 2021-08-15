<?php

namespace App\Repository;

use App\Entity\Company;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Company|null find($id, $lockMode = null, $lockVersion = null)
 * @method Company|null findOneBy(array $criteria, array $orderBy = null)
 * @method Company[]    findAll()
 * @method Company[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CompanyRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Company::class);
        $this->entityManager = $entityManager;
    }


    /**
     * @param int $id
     * @return Company
     */
    public function getOne(int $id): Company
    {
        return $this->find($id);
    }

    /**
     * @return array
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @return array
     */
    public function getAllForRender(): array
    {
        $companies = $this->findAll();
        $result = [];
        foreach ($companies as $company) {
            $result[$company->getTitle()] = $company->getId();
        }

        return $result;
    }

    /**
     * @param Company $company
     * @throws Exception
     */
    public function setCreate(Company $company)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($company);
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
     * @param Company $company
     * @throws Exception
     */
    public function setUpdate(Company $company)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($company);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param Company $company
     * @throws Exception
     */
    public function setDelete(Company $company)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($company);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

}
