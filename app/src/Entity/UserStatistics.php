<?php

namespace App\Entity;

use App\Repository\UserStatisticsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=UserStatisticsRepository::class)
 */
class UserStatistics
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="userStatistics")
     */
    private $user;

    /**
     * @ORM\ManyToOne(targetEntity=Company::class, inversedBy="userStatistics")
     */
    private $company;

    /**
     * @ORM\ManyToOne(targetEntity=CompanyMaterial::class, inversedBy="userStatistics")
     */
    private $companyMaterial;

    /**
     * @ORM\ManyToOne(targetEntity=CompanyVideo::class, inversedBy="userStatistics")
     */
    private $companyVideo;

    /**
     * @ORM\ManyToOne(targetEntity=ChatRoom::class, inversedBy="userStatistics")
     */
    private $broadcast;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_sponsors;

    public function __construct()
    {
        $this->user = new ArrayCollection();
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

    public function getCompany(): ?Company
    {
        return $this->company;
    }

    public function setCompany(?Company $company): self
    {
        $this->company = $company;

        return $this;
    }

    public function getCompanyMaterial(): ?CompanyMaterial
    {
        return $this->companyMaterial;
    }

    public function setCompanyMaterial(?CompanyMaterial $companyMaterial): self
    {
        $this->companyMaterial = $companyMaterial;

        return $this;
    }

    public function getCompanyVideo(): ?CompanyVideo
    {
        return $this->companyVideo;
    }

    public function setCompanyVideo(?CompanyVideo $companyVideo): self
    {
        $this->companyVideo = $companyVideo;

        return $this;
    }

    public function getBroadcast(): ?ChatRoom
    {
        return $this->broadcast;
    }

    public function setBroadcast(?ChatRoom $broadcast): self
    {
        $this->broadcast = $broadcast;

        return $this;
    }

    public function getIsSponsors(): ?bool
    {
        return $this->is_sponsors;
    }

    public function setIsSponsors(?bool $is_sponsors): self
    {
        $this->is_sponsors = $is_sponsors;

        return $this;
    }
}
