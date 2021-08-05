<?php

namespace App\Repository;

use App\Entity\PosterCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PosterCategory|null find($id, $lockMode = null, $lockVersion = null)
 * @method PosterCategory|null findOneBy(array $criteria, array $orderBy = null)
 * @method PosterCategory[]    findAll()
 * @method PosterCategory[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PosterCategoryRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, PosterCategory::class);
        $this->entityManager = $entityManager;
    }


    /**
     * @return PosterCategory[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param int $id
     * @return PosterCategory
     */
    public function getOne(int $id): PosterCategory
    {
        return $this->find($id);
    }

    /**
     * @return array
     */
    public function getAllForRender(): array
    {
        $categories = $this->findAll();
        $result = [];
        foreach ($categories as $category) {
            $result[$category->getName()] = $category->getId();
        }

        return $result;
    }

}
