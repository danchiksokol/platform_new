<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @ORM\Table(name="`user`")
 * @UniqueEntity(fields={"email"}, message="Аккаунт с таким email уже существует")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $surname;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $patronymic;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $specialization;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $job;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $position;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $country;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $city;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isVerified = false;

    /**
     * @ORM\OneToMany(targetEntity=Vote::class, mappedBy="User", cascade={"persist"})
     */
    private $votes;

    /**
     * @ORM\OneToMany(targetEntity=Participant::class, mappedBy="user")
     */
    private $participants;

    /**
     * @ORM\OneToMany(targetEntity=Answer::class, mappedBy="user")
     */
    private $answers;

    /**
     * @ORM\Column(type="guid")
     */
    private $secret;

    /**
     * @ORM\OneToMany(targetEntity=Speaker::class, mappedBy="user")
     */
    private $speakers;

    /**
     * @ORM\OneToMany(targetEntity=QuestionSpeaker::class, mappedBy="user")
     */
    private $questionSpeakers;

    /**
     * @ORM\OneToMany(targetEntity=AnswerSpeaker::class, mappedBy="user")
     */
    private $answerSpeakers;

    /**
     * @ORM\OneToMany(targetEntity=UserStatistics::class, mappedBy="user")
     */
    private $userStatistics;

    /**
     * @ORM\OneToMany(targetEntity=VisitControl::class, mappedBy="User")
     */
    private $visitControls;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_attend;



    public function __construct()
    {
        $this->votes = new ArrayCollection();
        $this->participants = new ArrayCollection();
        $this->answers = new ArrayCollection();
        $this->speakers = new ArrayCollection();
        $this->questionSpeakers = new ArrayCollection();
        $this->answerSpeakers = new ArrayCollection();
        $this->visitControls = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getSurname(): ?string
    {
        return $this->surname;
    }

    public function setSurname(?string $surname): self
    {
        $this->surname = $surname;

        return $this;
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

    public function getPatronymic(): ?string
    {
        return $this->patronymic;
    }

    public function setPatronymic(?string $patronymic): self
    {
        $this->patronymic = $patronymic;

        return $this;
    }

    public function getSpecialization(): ?string
    {
        return $this->specialization;
    }

    public function setSpecialization(?string $specialization): self
    {
        $this->specialization = $specialization;

        return $this;
    }

    public function getJob(): ?string
    {
        return $this->job;
    }

    public function setJob(?string $job): self
    {
        $this->job = $job;

        return $this;
    }

    public function getPosition(): ?string
    {
        return $this->position;
    }

    public function setPosition(?string $position): self
    {
        $this->position = $position;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getCountry(): ?string
    {
        return $this->country;
    }

    public function setCountry(?string $country): self
    {
        $this->country = $country;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(?string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function isVerified(): bool
    {
        return $this->isVerified;
    }

    public function setIsVerified(bool $isVerified): self
    {
        $this->isVerified = $isVerified;

        return $this;
    }

    /**
     * @return Collection|Vote[]
     */
    public function getVotes(): Collection
    {
        return $this->votes;
    }

    public function addVote(Vote $vote): self
    {
        if (!$this->votes->contains($vote)) {
            $this->votes[] = $vote;
            $vote->setUser($this);
        }

        return $this;
    }

    public function removeVote(Vote $vote): self
    {
        if ($this->votes->removeElement($vote)) {
            // set the owning side to null (unless already changed)
            if ($vote->getUser() === $this) {
                $vote->setUser(null);
            }
        }

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
            $participant->setUser($this);
        }

        return $this;
    }

    public function removeParticipant(Participant $participant): self
    {
        if ($this->participants->removeElement($participant)) {
            // set the owning side to null (unless already changed)
            if ($participant->getUser() === $this) {
                $participant->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Answer[]
     */
    public function getAnswers(): Collection
    {
        return $this->answers;
    }

    public function addAnswer(Answer $answer): self
    {
        if (!$this->answers->contains($answer)) {
            $this->answers[] = $answer;
            $answer->setUser($this);
        }

        return $this;
    }

    public function removeAnswer(Answer $answer): self
    {
        if ($this->answers->removeElement($answer)) {
            // set the owning side to null (unless already changed)
            if ($answer->getUser() === $this) {
                $answer->setUser(null);
            }
        }

        return $this;
    }

    public function getSecret(): ?string
    {
        return $this->secret;
    }

    public function setSecret(string $secret): self
    {
        $this->secret = $secret;

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
            $speaker->setUser($this);
        }

        return $this;
    }

    public function removeSpeaker(Speaker $speaker): self
    {
        if ($this->speakers->removeElement($speaker)) {
            // set the owning side to null (unless already changed)
            if ($speaker->getUser() === $this) {
                $speaker->setUser(null);
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
            $questionSpeaker->setUser($this);
        }

        return $this;
    }

    public function removeQuestionSpeaker(QuestionSpeaker $questionSpeaker): self
    {
        if ($this->questionSpeakers->removeElement($questionSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($questionSpeaker->getUser() === $this) {
                $questionSpeaker->setUser(null);
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
            $answerSpeaker->setUser($this);
        }

        return $this;
    }

    public function removeAnswerSpeaker(AnswerSpeaker $answerSpeaker): self
    {
        if ($this->answerSpeakers->removeElement($answerSpeaker)) {
            // set the owning side to null (unless already changed)
            if ($answerSpeaker->getUser() === $this) {
                $answerSpeaker->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|AnswerSpeaker[]
     */
    public function getUserStatistics(): Collection
    {
        return $this->userStatistics;
    }

    public function addUserStatistics(UserStatistics $userStatistics): self
    {
        if (!$this->userStatistics->contains($userStatistics)) {
            $this->userStatistics[] = $userStatistics;
            $userStatistics->setUser($this);
        }

        return $this;
    }

    public function removeUserStatistics(UserStatistics $userStatistics): self
    {
        if ($this->$userStatistics->removeElement($userStatistics)) {
            // set the owning side to null (unless already changed)
            if ($userStatistics->getUser() === $this) {
                $userStatistics->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|VisitControl[]
     */
    public function getVisitControls(): Collection
    {
        return $this->visitControls;
    }

    public function addVisitControl(VisitControl $visitControl): self
    {
        if (!$this->visitControls->contains($visitControl)) {
            $this->visitControls[] = $visitControl;
            $visitControl->setUser($this);
        }

        return $this;
    }

    public function removeVisitControl(VisitControl $visitControl): self
    {
        if ($this->visitControls->removeElement($visitControl)) {
            // set the owning side to null (unless already changed)
            if ($visitControl->getUser() === $this) {
                $visitControl->setUser(null);
            }
        }

        return $this;
    }

    public function getIsAttend(): ?bool
    {
        return $this->is_attend;
    }

    public function setIsAttend(?bool $is_attend): self
    {
        $this->is_attend = $is_attend;

        return $this;
    }
    
}
