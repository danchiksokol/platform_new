<?php

namespace App\Repository;

use App\Entity\Poster;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Poster|null find($id, $lockMode = null, $lockVersion = null)
 * @method Poster|null findOneBy(array $criteria, array $orderBy = null)
 * @method Poster[]    findAll()
 * @method Poster[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PosterRepository extends ServiceEntityRepository
{
    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;

    /**
     * PosterRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Poster::class);
        $this->entityManager = $entityManager;
    }

    /**
     * @param Poster $poster
     * @throws Exception
     */
    public function setCreate(Poster $poster)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($poster);

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
     * @param Poster $poster
     * @throws Exception
     */
    public function setDelete(Poster $poster)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($poster);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param int $posterId
     * @return Poster
     */
    public function getOne(int $posterId): Poster
    {
        return $this->find($posterId);
    }

    /**
     * @return Poster[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param int $categoryId
     * @return Poster[]
     */
    public function getAllByCategory(int $categoryId): array
    {
        return $this->findBy(['poster_category' => $categoryId], ['id' => 'ASC']);
    }
}
