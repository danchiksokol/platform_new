<?php

namespace App\Entity;

use App\Repository\QuestionSpeakerRepository;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use JetBrains\PhpStorm\Pure;

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
    private ?int $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="questionSpeakers")
     */
    private ?User $user;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private ?string $content;

    /**
     * @ORM\ManyToOne(targetEntity=Speaker::class, inversedBy="questionSpeakers")
     */
    private ?Speaker $speaker;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="questionSpeakers")
     */
    private ?ChatRoom $chatroom;

    /**
     * @ORM\Column(type="datetime")
     */
    private ?DateTimeInterface $created_at;

    /**
     * @ORM\Column(type="boolean")
     */
    private ?bool $is_show;

    /**
     * @ORM\OneToMany(targetEntity=AnswerSpeaker::class, mappedBy="questionSpeaker")
     */
    private $answerSpeakers;

    #[Pure]
    public function __construct()
    {
        $this->answerSpeakers = new ArrayCollection();
    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return User|null
     */
    public function getUser(): ?User
    {
        return $this->user;
    }

    /**
     * @param User|null $user
     * @return $this
     */
    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getContent(): ?string
    {
        return $this->content;
    }

    /**
     * @param string|null $content
     * @return $this
     */
    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    /**
     * @return Speaker|null
     */
    public function getSpeaker(): ?Speaker
    {
        return $this->speaker;
    }

    /**
     * @param int|Speaker $speaker
     * @return $this
     */
    public function setSpeaker(int|Speaker $speaker): self
    {
        $this->speaker = $speaker;

        return $this;
    }

    /**
     * @return ChatRoom|null
     */
    public function getChatroom(): ?ChatRoom
    {
        return $this->chatroom;
    }

    /**
     * @param ChatRoom|null $chatroom
     * @return $this
     */
    public function setChatroom(?ChatRoom $chatroom): self
    {
        $this->chatroom = $chatroom;

        return $this;
    }

    /**
     * @return DateTimeInterface|null
     */
    public function getCreatedAt(): ?DateTimeInterface
    {
        return $this->created_at;
    }

    /**
     * @param DateTimeInterface $created_at
     * @return $this
     */
    public function setCreatedAt(DateTimeInterface $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    /**
     * @return bool|null
     */
    public function getIsShow(): ?bool
    {
        return $this->is_show;
    }

    /**
     * @param bool $is_show
     * @return $this
     */
    public function setIsShow(bool $is_show): self
    {
        $this->is_show = $is_show;

        return $this;
    }

    /**
     * @return Collection
     */
    public function getAnswerSpeakers(): Collection
    {
        return $this->answerSpeakers;
    }

    /**
     * @param AnswerSpeaker $answerSpeaker
     * @return $this
     */
    public function addAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if (!$this->answerSpeakers->contains($answerSpeaker)) {
            $this->answerSpeakers[] = $answerSpeaker;
            $answerSpeaker->setQuestionSpeaker($this);
        }

        return $this;
    }

    /**
     * @param AnswerSpeaker $answerSpeaker
     * @return $this
     */
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
