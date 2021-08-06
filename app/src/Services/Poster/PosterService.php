<?php


namespace App\Services\Poster;


use App\Entity\Poster;
use App\Entity\User;
use App\Repository\PosterCategoryRepository;
use App\Repository\PosterRepository;
use App\Services\FileService\FileManagerServiceInterface;
use DateTime;
use Exception;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;

class PosterService
{
    /**
     * @var PosterRepository
     */
    private PosterRepository $posterRepository;
    private FileManagerServiceInterface $fileManagerService;
    private PosterCategoryRepository $posterCategoryRepository;

    /**
     * PosterService constructor.
     * @param PosterRepository $posterRepository
     * @param FileManagerServiceInterface $fileManagerService
     * @param PosterCategoryRepository $posterCategoryRepository
     */
    public function __construct(
        PosterRepository $posterRepository,
        FileManagerServiceInterface $fileManagerService,
        PosterCategoryRepository $posterCategoryRepository
    ) {
        $this->posterRepository = $posterRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('poster');
        $this->posterCategoryRepository = $posterCategoryRepository;
    }

    /**
     * @param Poster $poster
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreate(Poster $poster, Form $form): static
    {
        $poster->setTitle($form->get('title')->getData());
        $poster->setContent($form->get('content')->getData());
        $file = $form->get('file')->getData();
        if ($file) {
            $this->fileManagerService->setFileUploadDirectory('pdf');
            $fileName = $this->fileManagerService->uploadFile($file);
            $poster->setFile($fileName);
        }
        $poster->setCreatedAt(new DateTime());
        $category = $this->posterCategoryRepository->getOne($form->get('posterCategory')->getData());
        $poster->setPosterCategory($category);
        $thumbnail = $form->get('thumbnail')->getData();
        if ($thumbnail) {
            $this->fileManagerService->setFileUploadDirectory('thumbnail');
            $thumbnailName = $this->fileManagerService->uploadFile($thumbnail);
            $poster->setThumbnail($thumbnailName);
        }

        $this->posterRepository->setCreate($poster);
        $this->posterRepository->setSave();

        return $this;
    }

    /**
     * @param Request $request
     * @param User $user
     * @param int $posterId
     * @return array
     * @throws Exception
     */
    public function handleCreateVotePosterInSession(Request $request, User $user, int $posterId): array
    {
        try {
            $userId = $user->getId();
            $votePosterSession = [$posterId];
            $session = $request->getSession();
            if ($session->has("vote_$userId")) {
                $votePosterSession = $session->get("vote_$userId");
                $votePosterSession = $this->setVotePosterToArray($posterId, $votePosterSession);
            }
            $session->set("vote_$userId", $votePosterSession);

            return $session->get("vote_$userId");
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }


    /**
     * @param Request $request
     * @param User $user
     * @param int $posterId
     * @return array
     * @throws Exception
     */
    public function handleDeleteVotePosterFromSession(Request $request, User $user, int $posterId): array
    {
        try {
            $userId = $user->getId();
            $session = $request->getSession();
            $votePosterSession = $session->get("vote_$userId");
            if ($this->hasVotePosterSession($posterId, $votePosterSession)) {
                $session->remove("vote_$userId");
                $votePosterSession = $this->deleteVotePosterFromArray($posterId, $votePosterSession);
                $session->set("vote_$userId", $votePosterSession);
            }

            return $votePosterSession;
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

    /**
     * @param int $posterId
     * @param array $votePosterSession
     * @return array
     */
    public function deleteVotePosterFromArray(int $posterId, array $votePosterSession): array
    {
        foreach ($votePosterSession as $key => $vote) {
            if ($vote == $posterId) {
                unset($votePosterSession[$key]);
            }
        }

        return $votePosterSession;
    }


    /**
     * @param int $posterId
     * @param array $votePosterSession
     * @return bool
     */
    public function hasVotePosterSession(int $posterId, array $votePosterSession): bool
    {
        if (count($votePosterSession)) {
            foreach ($votePosterSession as $vote) {
                if ($vote == $posterId) {
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * @param int $posterId
     * @param array $votePosterSession
     * @return array
     */
    public function setVotePosterToArray(int $posterId, array $votePosterSession): array
    {
        if (!$this->hasVotePosterSession($posterId, $votePosterSession)) {
            array_push($votePosterSession, $posterId);
        }

        return $votePosterSession;
    }

    /**
     * @param Request $request
     * @param User $user
     * @return int
     */
    public function countVotePoster(Request $request, User $user): int
    {
        $userId = $user->getId();
        $session = $request->getSession();
        $votePosterSession = $session->get("vote_$userId");
        if (is_null($votePosterSession)) {
            return 0;
        }

        return count($votePosterSession);
    }

    /**
     * @param Request $request
     * @param User $user
     * @return array
     * @throws Exception
     */
    public function getPostersFromSession(Request $request, User $user): array
    {
        try {
            $result = [];
            $userId = $user->getId();
            $session = $request->getSession();
            if ($session->has("vote_$userId")) {
                $votePosterSession = $session->get("vote_$userId");
                foreach ($votePosterSession as $vote) {
                    $voteObject = $this->posterRepository->getOne((int)$vote);
                    $result[] = [
                        'id' => $voteObject->getId(),
                        'title' => $voteObject->getTitle(),
                        'file' => $voteObject->getFile(),
                        'thumbnail' => $voteObject->getThumbnail()
                    ];
                }
            }

            return $result;
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

}