<?php


namespace App\Services\User;


use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\Form\Form;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserService
{
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;

    /**
     * UserService constructor.
     * @param UserRepository $userRepository
     * @param UserPasswordEncoderInterface $passwordEncoder
     */
    public function __construct(UserRepository $userRepository, UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->userRepository = $userRepository;
        $this->passwordEncoder = $passwordEncoder;
    }

    /**
     * @param User $user
     * @param Form $form
     * @return $this
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function handleCreate(User $user, Form $form)
    {
        $user->setPassword(
            $this->passwordEncoder->encodePassword($user, $form->get('plainPassword')->getData())
        );
        $user->setSurname($form->get('surname')->getData());
        $user->setName($form->get('name')->getData());
        $user->setPatronymic($form->get('patronymic')->getData());
        $user->setSpecialization($form->get('specialization')->getData());
        $user->setJob($form->get('job')->getData());
        $user->setPosition($form->get('position')->getData());
        $user->setPhone($form->get('phone')->getData());
        $user->setCountry($form->get('country')->getData());
        $user->setCity($form->get('city')->getData());
        $user->setRoles(['ROLE_USER']);
        $user->setSecret(md5(uniqid()));
        $this->userRepository->setCreate($user);

        return $this;
    }

    public function handleUpdate(User $user, Form $form)
    {
        $user->setPassword(
            $this->passwordEncoder->encodePassword($user, $form->get('plainPassword')->getData())
        );
        $user->setSurname($form->get('surname')->getData());
        $user->setName($form->get('name')->getData());
        $user->setPatronymic($form->get('patronymic')->getData());
        $user->setSpecialization($form->get('specialization')->getData());
        $user->setJob($form->get('job')->getData());
        $user->setPosition($form->get('position')->getData());
        $user->setPhone($form->get('phone')->getData());
        $user->setCountry($form->get('country')->getData());
        $user->setCity($form->get('city')->getData());

        $this->userRepository->setSave($user);
        return $this;
    }
}