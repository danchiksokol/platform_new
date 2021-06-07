<?php


namespace App\Services\Message;


use App\Entity\Message;
use App\Entity\Participant;
use App\Repository\MessageRepository;

class MessageService
{
    /**
     * @var MessageRepository
     */
    private $messageRepository;

    /**
     * MessageService constructor.
     * @param MessageRepository $messageRepository
     */
    public function __construct(MessageRepository $messageRepository)
    {
        $this->messageRepository = $messageRepository;
    }

    /**
     * @param string $content
     * @param string $file
     * @return $this
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function saveMessage(Participant $participant, string $content)
    {
        $message = new Message();
        $message->setContent($content);
        $message->setCreatedAt(new \DateTime('NOW'));
        $message->setIsShow(1);
        $message->setParticipant($participant);
        $this->messageRepository->setCreate($message);

        return $message;
    }

}