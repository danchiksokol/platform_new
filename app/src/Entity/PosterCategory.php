<?php

namespace App\Entity;

use App\Repository\PosterCategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PosterCategoryRepository::class)
 */
class PosterCategory
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_create;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $date_update;

    /**
     * @ORM\OneToMany(targetEntity=Poster::class, mappedBy="posterCategory")
     */
    private $poster;

    public function __construct()
    {
        $this->poster = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDateCreate(): ?\DateTimeInterface
    {
        return $this->date_create;
    }

    public function setDateCreate(\DateTimeInterface $date_create): self
    {
        $this->date_create = $date_create;

        return $this;
    }

    public function getDateUpdate(): ?\DateTimeInterface
    {
        return $this->date_update;
    }

    public function setDateUpdate(?\DateTimeInterface $date_update): self
    {
        $this->date_update = $date_update;

        return $this;
    }

    /**
     * @return Collection|Poster[]
     */
    public function getPoster(): Collection
    {
        return $this->poster;
    }

    public function addPoster(Poster $poster): self
    {
        if (!$this->poster->contains($poster)) {
            $this->poster[] = $poster;
            $poster->setPosterCategory($this);
        }

        return $this;
    }

    public function removePoster(Poster $poster): self
    {
        if ($this->poster->removeElement($poster)) {
            // set the owning side to null (unless already changed)
            if ($poster->getPosterCategory() === $this) {
                $poster->setPosterCategory(null);
            }
        }

        return $this;
    }
}
