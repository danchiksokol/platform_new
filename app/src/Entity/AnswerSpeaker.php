<?php

namespace App\Entity;

use App\Repository\AnswerSpeakerRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=AnswerSpeakerRepository::class)
 */
class AnswerSpeaker
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="answerSpeakers")
     */
    private $user;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity=Speaker::class, inversedBy="answerSpeakers")
     */
    private $speaker;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="answerSpeakers")
     */
    private $chatroom;

    /**
     * @ORM\ManyToOne(targetEntity=QuestionSpeaker::class, inversedBy="answerSpeakers")
     */
    private $questionSpeaker;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created_at;

    /**
     * @ORM\Column(type="boolean")
     */
    private $is_show;

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

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getSpeaker(): ?Speaker
    {
        return $this->speaker;
    }

    public function setSpeaker(?Speaker $speaker): self
    {
        $this->speaker = $speaker;

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

    public function getQuestionSpeaker(): ?QuestionSpeaker
    {
        return $this->questionSpeaker;
    }

    public function setQuestionSpeaker(?QuestionSpeaker $questionSpeaker): self
    {
        $this->questionSpeaker = $questionSpeaker;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getIsShow(): ?bool
    {
        return $this->is_show;
    }

    public function setIsShow(bool $is_show): self
    {
        $this->is_show = $is_show;

        return $this;
    }
}
