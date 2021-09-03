<?php

namespace App\Entity;

use App\Repository\SpeakerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=SpeakerRepository::class)
 */
class Speaker
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="speakers")
     */
    private $user;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="speakers")
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
     * @ORM\OneToMany(targetEntity=QuestionSpeaker::class, mappedBy="speaker")
     */
    private $questionSpeakers;

    /**
     * @ORM\OneToMany(targetEntity=AnswerSpeaker::class, mappedBy="speaker")
     */
    private $answerSpeakers;

    public function __construct()
    {
        $this->questionSpeakers = new ArrayCollection();
        $this->answerSpeakers = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUser(): null|int|User
    {
        return $this->user;
    }

    public function setUser(null|int|User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getChatroom(): null|int|ChatRoom
    {
        return $this->chatroom;
    }

    public function setChatroom(int|ChatRoom $chatroom): self
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
     * @return Collection|QuestionSpeaker[]
     */
    public function getQuestionSpeakers(): Collection
    {
        return $this->questionSpeakers;
    }

    public function addQuestionSpeaker(QuestionSpeaker $questionSpeaker): self
    {
        if (!$this->questionSpeakers->contains($questionSpeaker)) {
            $this->questionSpeakers[] = $questionSpeaker;
            $questionSpeaker->setSpeaker($this);
        }

        return $this;
    }

    public function removeQuestionSpeaker(QuestionSpeaker $questionSpeaker): self
    {
        if ($this->questionSpeakers->removeElement($questionSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($questionSpeaker->getSpeaker() === $this) {
                $questionSpeaker->setSpeaker(null);
            }
        }

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
            $answerSpeaker->setSpeaker($this);
        }

        return $this;
    }

    public function removeAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if ($this->answerSpeakers->removeElement($answerSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($answerSpeaker->getSpeaker() === $this) {
                $answerSpeaker->setSpeaker(null);
            }
        }

        return $this;
    }
}
