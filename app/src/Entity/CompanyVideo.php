<?php

namespace App\Entity;

use App\Repository\CompanyVideoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CompanyVideoRepository::class)
 */
class CompanyVideo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private ?int $id;

    /**
     * @ORM\Column(type="text")
     */
    private ?string $video;

    /**
     * @ORM\ManyToOne(targetEntity=Company::class, inversedBy="companyVideos")
     */
    private int|Company $company;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_show;

    /**
     * @ORM\OneToMany(targetEntity=UserStatistics::class, mappedBy="companyVideo")
     */
    private $userStatistics;

    public function __construct()
    {
        $this->userStatistics = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getVideo(): ?string
    {
        return $this->video;
    }

    public function setVideo(string $video): self
    {
        $this->video = $video;

        return $this;
    }

    public function getCompany(): int|Company
    {
        return $this->company;
    }

    public function setCompany(int|Company $company): self
    {
        $this->company = $company;

        return $this;
    }

    public function getIsShow(): ?bool
    {
        return $this->is_show;
    }

    public function setIsShow(?bool $is_show): self
    {
        $this->is_show = $is_show;

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
            $userStatistic->setCompanyVideo($this);
        }

        return $this;
    }

    public function removeUserStatistic(UserStatistics $userStatistic): self
    {
        if ($this->userStatistics->removeElement($userStatistic)) {
            // set the owning side to null (unless already changed)
            if ($userStatistic->getCompanyVideo() === $this) {
                $userStatistic->setCompanyVideo(null);
            }
        }

        return $this;
    }
}
