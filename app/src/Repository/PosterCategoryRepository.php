<?php

namespace App\Repository;

use App\Entity\Poster;
use App\Entity\PosterCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

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
     * @param PosterCategory $posterCategory
     * @throws Exception
     */
    public function setCreate(PosterCategory $posterCategory)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($posterCategory);

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

    public function getAllIsShow(): array
    {
        return $this->entityManager
            ->createQueryBuilder()
            ->select('DISTINCT pc.id, pc.name')
            ->from(PosterCategory::class, 'pc')
            ->innerJoin(Poster::class, 'p', 'with', 'pc.id = p.posterCategory')
            ->where('p.is_show = 1')
            ->getQuery()
            ->getResult();
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
