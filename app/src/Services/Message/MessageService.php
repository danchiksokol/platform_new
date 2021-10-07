<?php


namespace App\Services\Message;


use App\Entity\Message;
use App\Entity\Participant;
use App\Repository\MessageRepository;
use DateTime;
use DateTimeImmutable;

class MessageService
{
    /**
     * @var MessageRepository
     */
    private MessageRepository $messageRepository;

    /**
     * MessageService constructor.
     * @param MessageRepository $messageRepository
     */
    public function __construct(MessageRepository $messageRepository)
    {
        $this->messageRepository = $messageRepository;
    }


    /**
     * @param Participant $participant
     * @param string $content
     * @return $this
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function handleCreate(Participant $participant, string $content):static
    {
        $message = new Message();
        $message->setContent($content);
        $message->setCreatedAt(new DateTimeImmutable());
        $message->setIsShow(1);
        $message->setParticipant($participant);
        $this->messageRepository->setCreate($message);

        return $this;
    }


    /**
     * @param Message $message
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     * @throws \Doctrine\Persistence\Mapping\MappingException
     */
    public function handleDelete(Message $message)
    {
        $this->messageRepository->setDelete($message);
        $this->messageRepository->setSave();
    }

    /**
     * @param Message $message
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     * @throws \Doctrine\Persistence\Mapping\MappingException
     */
    public function handleHide(Message $message)
    {
        $this->messageRepository->setHide($message);
    }

}