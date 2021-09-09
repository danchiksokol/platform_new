<?php

namespace App\Repository;

use App\Entity\Message;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

use Exception;

use function Doctrine\ORM\QueryBuilder;

/**
 * @method Message|null find($id, $lockMode = null, $lockVersion = null)
 * @method Message|null findOneBy(array $criteria, array $orderBy = null)
 * @method Message[]    findAll()
 * @method Message[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MessageRepository extends ServiceEntityRepository
{
    /**
     * @var ManagerRegistry
     */
    private $registry;
    /**
     * @var EntityManager
     */
    private $entityManager;

    /**
     * MessageRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManager $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Message::class);
        $this->registry = $registry;
        $this->entityManager = $entityManager;
    }

    /**
     * @param int $chatRoomId
     * @return Message[]
     */
    public function findAllMessagesByChatRoomId(int $chatRoomId): array
    {
        $qb = $this->createQueryBuilder('m');
        $qb->select()
            ->innerJoin('m.participant', 'p')
            ->innerJoin('p.chatroom', 'c')
            ->where($qb->expr()->eq('p.chatroom', ':chatid'))
            ->andWhere('p.is_block = 0')
            ->andWhere('m.is_show = 1')
            ->setParameter('chatid', $chatRoomId)
            ->orderBy('m.created_at', 'ASC');

        return $qb->getQuery()->getResult();
    }


    /**
     * @param int $id
     * @return object
     */
    public function getOne(int $id): object
    {
        return $this->find($id);
    }

    /**
     * @return Message[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param Message $message
     * @throws ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function setCreate(Message $message)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($message);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @throws ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     * @throws \Doctrine\Persistence\Mapping\MappingException
     */
    public function setSave()
    {
        $this->entityManager->flush();
        $this->entityManager->clear();
    }


    /**
     * @param Message $message
     * @throws ORMException
     */
    public function setDelete(Message $message)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($message);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

}
