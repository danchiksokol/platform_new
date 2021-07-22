<?php

namespace App\Entity;

use App\Repository\PosterCategoryRepository;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use JetBrains\PhpStorm\Pure;

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
    private ?int $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private ?string $name;

    /**
     * @ORM\Column(type="datetime")
     */
    private ?DateTimeInterface $created_at;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private ?DateTimeInterface $updated_at;

    /**
     * @ORM\OneToMany(targetEntity=Poster::class, mappedBy="posterCategory")
     */
    private ArrayCollection $poster;

    #[Pure]
    public function __construct()
    {
        $this->poster = new ArrayCollection();
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
    public function getName(): ?string
    {
        return $this->name;
    }

    /**
     * @param string $name
     * @return $this
     */
    public function setName(string $name): self
    {
        $this->name = $name;

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

    /**
     * @return Collection
     */
    public function getPoster(): Collection
    {
        return $this->poster;
    }

    /**
     * @param Poster $poster
     * @return $this
     */
    public function addPoster(Poster $poster): self
    {
        if (!$this->poster->contains($poster)) {
            $this->poster[] = $poster;
            $poster->setPosterCategory($this);
        }

        return $this;
    }

    /**
     * @param Poster $poster
     * @return $this
     */
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
