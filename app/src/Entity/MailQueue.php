<?php

namespace App\Entity;

use App\Repository\MailQueueRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MailQueueRepository::class)
 */
class MailQueue
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="mailQueues")
     */
    private $user;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_send;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getIsSend(): ?bool
    {
        return $this->is_send;
    }

    public function setIsSend(?bool $is_send): self
    {
        $this->is_send = $is_send;

        return $this;
    }
}
