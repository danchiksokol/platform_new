<?php

namespace App\Entity;

use App\Repository\ParticipantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ParticipantRepository::class)
 */
class Participant
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_block;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="participants")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="participants")
     * @ORM\JoinColumn(name="chatroom_id", referencedColumnName="id")
     */
    private $chatroom;

    /**
     * @ORM\OneToMany(targetEntity=Message::class, mappedBy="participant")
     * @ORM\JoinColumn(name="message_id", referencedColumnName="id")
     */
    private $messages;

    public function __construct()
    {
        $this->messages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIsBlock(): ?bool
    {
        return $this->is_block;
    }

    public function setIsBlock(?bool $is_block): self
    {
        $this->is_block = $is_block;

        return $this;
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

    public function getChatroom(): ?ChatRoom
    {
        return $this->chatroom;
    }

    public function setChatroom(?ChatRoom $chatroom): self
    {
        $this->chatroom = $chatroom;

        return $this;
    }

    /**
     * @return Collection|Message[]
     */
    public function getMessages(): Collection
    {
        return $this->messages;
    }

    public function addMessage(Message $message): self
    {
        if (!$this->messages->contains($message)) {
            $this->messages[] = $message;
            $message->setParticipant($this);
        }

        return $this;
    }

    public function removeMessage(Message $message): self
    {
        if ($this->messages->removeElement($message)) {
            // set the owning side to null (unless already changed)
            if ($message->getParticipant() === $this) {
                $message->setParticipant(null);
            }
        }

        return $this;
    }
}
