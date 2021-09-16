<?php

namespace App\Repository;

use Exception;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;
use Symfony\Component\Security\Core\User\UserInterface;

use function get_class;

/**
 * @method User|null find($id, $lockMode = null, $lockVersion = null)
 * @method User|null findOneBy(array $criteria, array $orderBy = null)
 * @method User[]    findAll()
 * @method User[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{

    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;

    /**
     * UserRepository constructor.
     * @param ManagerRegistry $registry
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, User::class);
        $this->entityManager = $entityManager;
    }

    /**
     * @param User $user
     */
    public function setVerification(User $user)
    {
        $user->setIsVerified(1);
        $this->entityManager->persist($user);
        $this->setSave();
    }

    /**
     * @param User $user
     * @throws Exception
     */
    public function setCreate(User $user)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($user);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    public function setSave()
    {
        $this->entityManager->flush();
        $this->entityManager->clear();
    }

    /**
     * @param User $user
     * @throws Exception
     */
    public function setDelete(User $user)
    {
        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->remove($user);
            $this->entityManager->flush();

            $this->entityManager->commit();
        } catch (Exception $exception) {
            $this->entityManager->rollback();
            throw $exception;
        }
    }

    /**
     * @param UserInterface $user
     * @param string $newEncodedPassword
     */
    public function upgradePassword(UserInterface $user, string $newEncodedPassword): void
    {
        if (!$user instanceof User) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', get_class($user)));
        }

        $user->setPassword($newEncodedPassword);
        $this->entityManager->persist($user);
        $this->entityManager->flush();
    }

    /**
     * @param int $id
     * @return object
     */
    public function getOne(int $id): object
    {
        return $this->find($id);
    }

    /**
     * @return User[]
     */
    public function getAll(): array
    {
        return $this->findAll();
    }

    /**
     * @param string $secret
     * @return object|null
     */
    public function getOneBySecret(string $secret): ?object
    {
        return $this->findOneBy(['secret' => $secret]);
    }

    /**
     * @return array
     */
    public function getAllForChoiceType(): array
    {
        $users = $this->getAll();
        $result = [];
        foreach ($users as $user) {
            $id = $user->getId();
            $fio = $user->getSurname() . ' '
                . $user->getName() . ' '
                . $user->getPatronymic();;
            $result[$fio] = $id;
        }

        return $result;
    }

    /**
     * @param string $search
     * @return array
     */
    public function findByAllFields(string $search):array
    {
        $qb = $this->createQueryBuilder('u');
        $qb->where("u.surname like :query")
            ->orWhere("u.name like :query")
            ->orWhere("u.patronymic like :query")
            ->orWhere("u.specialization like :query")
            ->orWhere("u.job like :query")
            ->orWhere("u.position like :query")
            ->orWhere("u.phone like :query")
            ->orWhere("u.email like :query")
            ->orWhere("u.city like :query")
            ->orWhere("u.country like :query")
            ->orderBy('u.id', "ASC")
            ->setParameter('query', '%' . $search . '%');

        return $qb->getQuery()->getResult();
    }

}
