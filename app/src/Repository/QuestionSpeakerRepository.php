<?php

namespace App\Repository;

use App\Entity\QuestionSpeaker;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @method QuestionSpeaker|null find($id, $lockMode = null, $lockVersion = null)
 * @method QuestionSpeaker|null findOneBy(array $criteria, array $orderBy = null)
 * @method QuestionSpeaker[]    findAll()
 * @method QuestionSpeaker[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class QuestionSpeakerRepository extends ServiceEntityRepository
{
    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;

    /**
     * QuestionSpeakerRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, QuestionSpeaker::class);
        $this->entityManager = $entityManager;
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     * @throws Exception
     */
    public function setCreate(QuestionSpeaker $questionSpeaker)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($questionSpeaker);
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
     * @param QuestionSpeaker $questionSpeaker
     * @throws Exception
     */
    public function setDelete(QuestionSpeaker $questionSpeaker)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($questionSpeaker);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     */
    public function setHide(QuestionSpeaker $questionSpeaker)
    {
        $questionSpeaker->setIsShow(0);
        $this->entityManager->persist($questionSpeaker);
        $this->setSave();
    }

    /**
     * @param QuestionSpeaker $questionSpeaker
     */
    public function setShow(QuestionSpeaker $questionSpeaker)
    {
        $questionSpeaker->setIsShow(1);
        $this->entityManager->persist($questionSpeaker);
        $this->setSave();
    }

    public function setPosterToSession()
    {
        
    }

    /**
     * @param int $questionSpeakerId
     * @return object
     */
    public function getOne(int $questionSpeakerId): object
    {
        return $this->find($questionSpeakerId);
    }

    /**
     * @return QuestionSpeaker[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param int $chatRoomId
     * @return QuestionSpeaker[]
     */
    public function getAllByChatRoomForAdmin(int $chatRoomId): array
    {
        return $this->findBy(['chatroom' => $chatRoomId, 'is_show' => 0], ['id' => 'DESC']);
    }

    public function getAllByChatRoomForUser(int $chatRoomId): array
    {
        return $this->findBy(['chatroom' => $chatRoomId, 'is_show' => 1], ['id' => 'DESC']);
    }

}
