<?php

namespace App\Entity;

use App\Repository\CompanyVideoRepository;
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

    public function getCompany(): ?Company
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
}
