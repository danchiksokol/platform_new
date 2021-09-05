<?php

namespace App\Services\VisitControl;

use App\Entity\User;
use App\Entity\VisitControl;
use App\Repository\UserRepository;
use App\Repository\VisitControlRepository;
use DateTimeImmutable;
use Exception;
use Symfony\Component\HttpFoundation\Request;

class VisitControlService
{
    private UserRepository $userRepository;
    private VisitControlRepository $visitControlRepository;

    /**
     * @param UserRepository $userRepository
     * @param VisitControlRepository $visitControlRepository
     */
    public function __construct(UserRepository $userRepository, VisitControlRepository $visitControlRepository)
    {
        $this->userRepository = $userRepository;
        $this->visitControlRepository = $visitControlRepository;
    }

    /**
     * @param Request $request
     * @param User $user
     * @return $this
     * @throws Exception
     */
    public function handleCreate(Request $request, User $user):static
    {
        $visitControl =new VisitControl();
        $user = $this->userRepository->getOne($user->getId());
        $visitControl->setUser($user);
        $visitControl->setCreatedAt(new DateTimeImmutable());

        $this->visitControlRepository->setCreate();
        $this->visitControlRepository->setSave();

        return $this;
    }
}