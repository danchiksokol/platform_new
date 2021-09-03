<?php

namespace App\Repository;

use App\Entity\Speaker;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Exception;

/**
 * @method Speaker|null find($id, $lockMode = null, $lockVersion = null)
 * @method Speaker|null findOneBy(array $criteria, array $orderBy = null)
 * @method Speaker[]    findAll()
 * @method Speaker[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SpeakerRepository extends ServiceEntityRepository
{
    private EntityManagerInterface $entityManager;

    /**
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Speaker::class);
        $this->entityManager = $entityManager;
    }

    /**
     * @param int $speakerId
     * @return object
     */
    public function getOne(int $speakerId): object
    {
        return $this->find($speakerId);
    }

    /**
     * @return Speaker[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param int $chatRoomId
     * @return Speaker[]
     */
    public function getSpeakerByChatRoom(int $chatRoomId): array
    {
        return $this->findBy(['chatroom' => $chatRoomId], ['id' => 'ASC']);
    }


    /**
     * @param Speaker $speaker
     * @throws Exception
     */
    public function setCreate(Speaker $speaker)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($speaker);

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
     * @param Speaker $speaker
     * @throws Exception
     */
    public function setDelete(Speaker $speaker)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($speaker);

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param Speaker $speakers
     * @return array
     */
    public function setSpeakersForChoiceType(Speaker $speakers): array
    {
        $result = [];
        foreach ($speakers as $speaker) {
            $id = $speaker->getId();
            $fio = $speaker->getUser()->getSurname() . ' '
                . mb_substr($speaker->getUser()->getName(), 0, 1) . '. '
                . mb_substr($speaker->getUser()->getPatronymic(), 0, 1) . '.';;
            $result[$fio] = $id;
        }

        return $result;
    }

    /**
     * @return array
     */
    public function getSpeakersForFrom(): array
    {
        $speakers = $this->getAll();
        return $this->setSpeakersForChoiceType($speakers);
    }

    /**
     * @param int $chatRoomId
     * @return array
     */
    public function getSpeakerByChatRoomForForm(int $chatRoomId): array
    {
        $speakers = $this->findBy(['chatroom' => $chatRoomId], ['id' => 'ASC']);
        return $this->setSpeakersForChoiceType($speakers);
    }
}
