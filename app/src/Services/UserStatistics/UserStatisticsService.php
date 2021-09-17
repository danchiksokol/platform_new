<?php

namespace App\Services\UserStatistics;

use App\Entity\User;
use App\Entity\UserStatistics;
use App\Repository\ChatRoomRepository;
use App\Repository\CompanyMaterialRepository;
use App\Repository\CompanyRepository;
use App\Repository\CompanyVideoRepository;
use App\Repository\UserRepository;
use App\Repository\UserStatisticsRepository;
use Symfony\Component\HttpFoundation\Request;

class UserStatisticsService
{
    private UserStatisticsRepository $statisticsRepository;
    private UserRepository $userRepository;
    private CompanyMaterialRepository $companyMaterialRepository;
    private CompanyVideoRepository $companyVideoRepository;
    private CompanyRepository $companyRepository;
    private ChatRoomRepository $chatRoomRepository;

    /**
     * @param UserStatisticsRepository $statisticsRepository
     * @param UserRepository $userRepository
     * @param CompanyMaterialRepository $companyMaterialRepository
     * @param CompanyVideoRepository $companyVideoRepository
     * @param CompanyRepository $companyRepository
     * @param ChatRoomRepository $chatRoomRepository
     */
    public function __construct(
        UserStatisticsRepository $statisticsRepository,
        UserRepository $userRepository,
        CompanyMaterialRepository $companyMaterialRepository,
        CompanyVideoRepository $companyVideoRepository,
        CompanyRepository $companyRepository,
        ChatRoomRepository $chatRoomRepository
    ) {
        $this->statisticsRepository = $statisticsRepository;
        $this->userRepository = $userRepository;
        $this->companyMaterialRepository = $companyMaterialRepository;
        $this->companyVideoRepository = $companyVideoRepository;
        $this->companyRepository = $companyRepository;
        $this->chatRoomRepository = $chatRoomRepository;
    }


    public function handleCreate(Request $request, User $user): static
    {
        $userStatistics = new UserStatistics();
        $user = $this->userRepository->getOne($user->getId());
        $isSponsors = (bool)$request->get('sponsors');
        $data = $request->get('data');
        if (!empty($data)) {
            $key = array_key_first($data);
            $id = reset($data);
            if('company'== $key) {
                $company = $this->companyRepository->getOne($id);
                $userStatistics->setCompany($company);
            }
            if ('material' == $key) {
                $companyMaterial = $this->companyMaterialRepository->getOne($id);
                $userStatistics->setCompanyMaterial($companyMaterial);
            }
            if ('video' == $key) {
                $companyVideo = $this->companyVideoRepository->getOne($id);
                $userStatistics->setCompanyVideo($companyVideo);
            }
            if ('broadcast' == $key) {
                $broadcast = $this->chatRoomRepository->getOne($id);
                $userStatistics->setBroadcast($broadcast);
            }
        }


        $userStatistics->setUser($user);
        $userStatistics->setIsSponsors($isSponsors);
        $this->statisticsRepository->setCreate($userStatistics);
        $this->statisticsRepository->setSave();

        return $this;
    }

}