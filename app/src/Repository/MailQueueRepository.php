<?php

namespace App\Repository;

use App\Entity\MailQueue;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method MailQueue|null find($id, $lockMode = null, $lockVersion = null)
 * @method MailQueue|null findOneBy(array $criteria, array $orderBy = null)
 * @method MailQueue[]    findAll()
 * @method MailQueue[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MailQueueRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, MailQueue::class);
        $this->entityManager = $entityManager;
    }


    /**
     * @param $limit
     * @return MailQueue[]
     */
    public function getMailLimit($limit): array
    {
        return $this->findBy(['is_send' => 0], ['id' => 'ASC'], $limit);
    }


    /**
     * @param MailQueue $mail
     * @throws Exception
     */
    public function setCreate(MailQueue $mail)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($mail);

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
     * @param MailQueue $mail
     * @throws Exception
     */
    public function setDelete(MailQueue $mail)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($mail);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }


}
