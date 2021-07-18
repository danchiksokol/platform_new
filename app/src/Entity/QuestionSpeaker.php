<?php

namespace App\Entity;

use App\Repository\QuestionSpeakerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=QuestionSpeakerRepository::class)
 */
class QuestionSpeaker
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="questionSpeakers")
     */
    private $user;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity=Speaker::class, inversedBy="questionSpeakers")
     */
    private $speaker;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="questionSpeakers")
     */
    private $chatroom;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created_at;

    /**
     * @ORM\Column(type="boolean")
     */
    private $is_show;

    /**
     * @ORM\OneToMany(targetEntity=AnswerSpeaker::class, mappedBy="questionSpeaker")
     */
    private $answerSpeakers;

    public function __construct()
    {
        $this->answerSpeakers = new ArrayCollection();
    }

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

    /**
     * @return Collection|AnswerSpeaker[]
     */
    public function getAnswerSpeakers(): Collection
    {
        return $this->answerSpeakers;
    }

    public function addAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if (!$this->answerSpeakers->contains($answerSpeaker)) {
            $this->answerSpeakers[] = $answerSpeaker;
            $answerSpeaker->setQuestionSpeaker($this);
        }

        return $this;
    }

    public function removeAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if ($this->answerSpeakers->removeElement($answerSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($answerSpeaker->getQuestionSpeaker() === $this) {
                $answerSpeaker->setQuestionSpeaker(null);
            }
        }

        return $this;
    }
}
