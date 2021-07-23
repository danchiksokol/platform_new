<?php

namespace App\Repository;

use App\Entity\CompanyVideo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CompanyVideo|null find($id, $lockMode = null, $lockVersion = null)
 * @method CompanyVideo|null findOneBy(array $criteria, array $orderBy = null)
 * @method CompanyVideo[]    findAll()
 * @method CompanyVideo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CompanyVideoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CompanyVideo::class);
    }

    // /**
    //  * @return CompanyVideo[] Returns an array of CompanyVideo objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CompanyVideo
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
