<?php

namespace App\Entity;

use App\Repository\CompanyMaterialRepository;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CompanyMaterialRepository::class)
 */
class CompanyMaterial
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private ?int $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private ?string $file;

    /**
     * @ORM\ManyToOne(targetEntity=Company::class, inversedBy="companyMaterials")
     */
    private int|Company $company;

    /**
     * @ORM\Column(type="datetime")
     */
    private ?DateTimeInterface $created_at;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private ?DateTimeInterface $updated_at;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $thumbnail;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $is_show;

    /**
     * @ORM\OneToMany(targetEntity=UserStatistics::class, mappedBy="companyMaterial")
     */
    private $userStatistics;

    public function __construct()
    {
        $this->userStatistics = new ArrayCollection();
    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return string|null
     */
    public function getFile(): ?string
    {
        return $this->file;
    }

    /**
     * @param string $file
     * @return $this
     */
    public function setFile(string $file): self
    {
        $this->file = $file;

        return $this;
    }

    /**
     * @return Company|int
     */
    public function getCompany(): int|Company
    {
        return $this->company;
    }


    /**
     * @param int|Company $company
     * @return $this
     */
    public function setCompany(int|Company $company): self
    {
        $this->company = $company;

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
     * @return DateTimeInterface|null
     */
    public function getUpdatedAt(): ?DateTimeInterface
    {
        return $this->updated_at;
    }

    /**
     * @param DateTimeInterface|null $updated_at
     * @return $this
     */
    public function setUpdatedAt(?DateTimeInterface $updated_at): self
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    public function getThumbnail(): ?string
    {
        return $this->thumbnail;
    }

    public function setThumbnail(?string $thumbnail): self
    {
        $this->thumbnail = $thumbnail;

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
            $userStatistic->setCompanyMaterial($this);
        }

        return $this;
    }

    public function removeUserStatistic(UserStatistics $userStatistic): self
    {
        if ($this->userStatistics->removeElement($userStatistic)) {
            // set the owning side to null (unless already changed)
            if ($userStatistic->getCompanyMaterial() === $this) {
                $userStatistic->setCompanyMaterial(null);
            }
        }

        return $this;
    }
}
