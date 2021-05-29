<?php

namespace App\Repository;

use App\Entity\PosterCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PosterCategory|null find($id, $lockMode = null, $lockVersion = null)
 * @method PosterCategory|null findOneBy(array $criteria, array $orderBy = null)
 * @method PosterCategory[]    findAll()
 * @method PosterCategory[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PosterCategoryRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PosterCategory::class);
    }

    // /**
    //  * @return PosterCategory[] Returns an array of PosterCategory objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?PosterCategory
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
