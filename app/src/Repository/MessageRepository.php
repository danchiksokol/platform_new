<?php

namespace App\Repository;

use App\Entity\Message;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

use function Doctrine\ORM\QueryBuilder;

/**
 * @method Message|null find($id, $lockMode = null, $lockVersion = null)
 * @method Message|null findOneBy(array $criteria, array $orderBy = null)
 * @method Message[]    findAll()
 * @method Message[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MessageRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Message::class);
    }

    /**
     * @param int $chatRoomId
     * @return int|mixed|string
     */
    public function findAllMessagesByChatRoomId(int $chatRoomId)
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


}
