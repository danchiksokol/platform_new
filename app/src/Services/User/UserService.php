<?php


namespace App\Services\User;


use App\Entity\User;
use App\Repository\UserRepository;
use Exception;
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
     * @throws Exception
     */
    public function handleCreate(User $user, Form $form):static
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

    /**
     * TODO::Провести рефакторинг метода
     * @param User $user
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreateUser(User $user, Form $form):static
    {
        $user->setPassword(
            $this->passwordEncoder->encodePassword($user, $form->get('password')->getData())
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


    /**
     * @param User $user
     * @param Form $form
     * @return $this
     */
    public function handleUpdate(User $user, Form $form):static
    {
        $user->setIsAttend($form->get('is_attend')->getData());
        $user->setEmail($form->get('email')->getData());
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

    /**
     * @param User $user
     * @throws Exception
     */
    public function handleAttend(User $user)
    {
        $user->setIsAttend(1);
        $this->userRepository->setSave();
    }

    /**
     * @param User $user
     * @throws Exception
     */
    public function handleDelete(User $user)
    {
        $this->userRepository->setDelete($user);
    }
}