<?php

namespace App\Entity;

use App\Repository\ChatRoomRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ChatRoomRepository::class)
 */
class ChatRoom
{
    public const MEGA_CHAT = 1;
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity=Participant::class, mappedBy="chatroom")
     * @ORM\JoinColumn(name="participant_id", referencedColumnName="id")
     */
    private $participants;

    /**
     * @ORM\OneToMany(targetEntity=Speaker::class, mappedBy="chatroom")
     */
    private $speakers;

    /**
     * @ORM\OneToMany(targetEntity=QuestionSpeaker::class, mappedBy="chatroom")
     */
    private $questionSpeakers;

    /**
     * @ORM\OneToMany(targetEntity=AnswerSpeaker::class, mappedBy="chatroom")
     */
    private $answerSpeakers;

    /**
     * @ORM\OneToMany(targetEntity=UserStatistics::class, mappedBy="broadcast")
     */
    private $userStatistics;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $broadcast;

    public function __construct()
    {
        $this->participants = new ArrayCollection();
        $this->speakers = new ArrayCollection();
        $this->questionSpeakers = new ArrayCollection();
        $this->answerSpeakers = new ArrayCollection();
        $this->userStatistics = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|Participant[]
     */
    public function getParticipants(): Collection
    {
        return $this->participants;
    }

    public function addParticipant(Participant $participant): self
    {
        if (!$this->participants->contains($participant)) {
            $this->participants[] = $participant;
            $participant->setChatroom($this);
        }

        return $this;
    }

    public function removeParticipant(Participant $participant): self
    {
        if ($this->participants->removeElement($participant)) {
            // set the owning side to null (unless already changed)
            if ($participant->getChatroom() === $this) {
                $participant->setChatroom(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Speaker[]
     */
    public function getSpeakers(): Collection
    {
        return $this->speakers;
    }

    public function addSpeaker(Speaker $speaker): self
    {
        if (!$this->speakers->contains($speaker)) {
            $this->speakers[] = $speaker;
            $speaker->setChatroom($this);
        }

        return $this;
    }

    public function removeSpeaker(Speaker $speaker): self
    {
        if ($this->speakers->removeElement($speaker)) {
            // set the owning side to null (unless already changed)
            if ($speaker->getChatroom() === $this) {
                $speaker->setChatroom(null);
            }
        }

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
            $questionSpeaker->setChatroom($this);
        }

        return $this;
    }

    public function removeQuestionSpeaker(QuestionSpeaker $questionSpeaker): self
    {
        if ($this->questionSpeakers->removeElement($questionSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($questionSpeaker->getChatroom() === $this) {
                $questionSpeaker->setChatroom(null);
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
            $answerSpeaker->setChatroom($this);
        }

        return $this;
    }

    public function removeAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if ($this->answerSpeakers->removeElement($answerSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($answerSpeaker->getChatroom() === $this) {
                $answerSpeaker->setChatroom(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|UserStatistics[]
     */
    public function getUserStatistics(): Collection
    {
        return $this->userStatistics;
    }

    public function addUserStatistic(UserStatistics $userStatistic): self
    {
        if (!$this->userStatistics->contains($userStatistic)) {
            $this->userStatistics[] = $userStatistic;
            $userStatistic->setBroadcast($this);
        }

        return $this;
    }

    public function removeUserStatistic(UserStatistics $userStatistic): self
    {
        if ($this->userStatistics->removeElement($userStatistic)) {
            // set the owning side to null (unless already changed)
            if ($userStatistic->getBroadcast() === $this) {
                $userStatistic->setBroadcast(null);
            }
        }

        return $this;
    }

    public function getBroadcast(): ?string
    {
        return $this->broadcast;
    }

    public function setBroadcast(?string $broadcast): self
    {
        $this->broadcast = $broadcast;

        return $this;
    }
}
