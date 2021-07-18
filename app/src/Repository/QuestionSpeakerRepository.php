<?php

namespace App\Repository;

use App\Entity\QuestionSpeaker;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method QuestionSpeaker|null find($id, $lockMode = null, $lockVersion = null)
 * @method QuestionSpeaker|null findOneBy(array $criteria, array $orderBy = null)
 * @method QuestionSpeaker[]    findAll()
 * @method QuestionSpeaker[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class QuestionSpeakerRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, QuestionSpeaker::class);
    }

    // /**
    //  * @return QuestionSpeaker[] Returns an array of QuestionSpeaker objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('q')
            ->andWhere('q.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('q.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?QuestionSpeaker
    {
        return $this->createQueryBuilder('q')
            ->andWhere('q.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
