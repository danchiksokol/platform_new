<?php

namespace App\Entity;

use App\Repository\CompanyRepository;
use DateTimeImmutable;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use JetBrains\PhpStorm\Pure;

/**
 * @ORM\Entity(repositoryClass=CompanyRepository::class)
 */
class Company
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private ?int $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private ?string $logo;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $title;

    /**
     * @ORM\OneToMany(targetEntity=CompanyMaterial::class, mappedBy="company")
     */
    private $companyMaterials;

    /**
     * @ORM\OneToMany(targetEntity=CompanyVideo::class, mappedBy="company")
     */
    private $companyVideos;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $created_at;

    /**
     * @ORM\Column(type="datetime_immutable", nullable=true)
     */
    private $updated_at;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $content;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_show;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $href;

    /**
     * @ORM\OneToMany(targetEntity=UserStatistics::class, mappedBy="company")
     */
    private $userStatistics;


    #[Pure]
    public function __construct()
    {
        $this->companyMaterials = new ArrayCollection();
        $this->companyVideos = new ArrayCollection();
        $this->userStatistics = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLogo(): ?string
    {
        return $this->logo;
    }

    public function setLogo(?string $logo): self
    {
        $this->logo = $logo;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(?string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * @return Collection
     */
    public function getCompanyMaterials(): Collection
    {
        return $this->companyMaterials;
    }

    public function addCompanyMaterial(CompanyMaterial $companyMaterial): self
    {
        if (!$this->companyMaterials->contains($companyMaterial)) {
            $this->companyMaterials[] = $companyMaterial;
            $companyMaterial->setCompany($this);
        }

        return $this;
    }

    /**
     * @param CompanyMaterial $companyMaterial
     * @return $this
     */
    public function removeCompanyMaterial(CompanyMaterial $companyMaterial): self
    {
        if ($this->companyMaterials->removeElement($companyMaterial)) {
            // set the owning side to null (unless already changed)
            if ($companyMaterial->getCompany() === $this) {
                $companyMaterial->setCompany(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection
     */
    public function getCompanyVideos(): Collection
    {
        return $this->companyVideos;
    }

    /**
     * @param CompanyVideo $companyVideo
     * @return $this
     */
    public function addCompanyVideo(CompanyVideo $companyVideo): self
    {
        if (!$this->companyVideos->contains($companyVideo)) {
            $this->companyVideos[] = $companyVideo;
            $companyVideo->setCompany($this);
        }

        return $this;
    }

    /**
     * @param CompanyVideo $companyVideo
     * @return $this
     */
    public function removeCompanyVideo(CompanyVideo $companyVideo): self
    {
        if ($this->companyVideos->removeElement($companyVideo)) {
            // set the owning side to null (unless already changed)
            if ($companyVideo->getCompany() === $this) {
                $companyVideo->setCompany(null);
            }
        }

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updated_at): self
    {
        $this->updated_at = $updated_at;

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

    public function getIsShow(): ?bool
    {
        return $this->is_show;
    }

    public function setIsShow(?bool $is_show): self
    {
        $this->is_show = $is_show;

        return $this;
    }

    public function getHref(): ?string
    {
        return $this->href;
    }

    public function setHref(?string $href): self
    {
        $this->href = $href;

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
            $userStatistic->setCompany($this);
        }

        return $this;
    }

    public function removeUserStatistic(UserStatistics $userStatistic): self
    {
        if ($this->userStatistics->removeElement($userStatistic)) {
            // set the owning side to null (unless already changed)
            if ($userStatistic->getCompany() === $this) {
                $userStatistic->setCompany(null);
            }
        }

        return $this;
    }
}
