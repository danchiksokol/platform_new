<?php


namespace App\Services\Poster;


use App\Entity\Poster;
use App\Entity\User;
use App\Repository\PosterRepository;
use Exception;
use Symfony\Component\HttpFoundation\Request;

class PosterService
{
    /**
     * @var PosterRepository
     */
    private PosterRepository $posterRepository;

    /**
     * PosterService constructor.
     * @param PosterRepository $posterRepository
     */
    public function __construct(PosterRepository $posterRepository)
    {
        $this->posterRepository = $posterRepository;
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
     * @return mixed
     * @throws Exception
     */
    public function handleDeleteVotePosterFromSession(Request $request, User $user, int $posterId): mixed
    {
        try {
            $userId = $user->getId();
            $session = $request->getSession();
            if ($session->has("vote_$userId")) {
                $votePosterSession = $session->get("vote_$userId");
                if ($this->hasVotePosterSession($posterId, $votePosterSession)) {
                    $session->remove("vote_$userId");
                    $votePosterSession = $this->deleteVotePosterFromArray($posterId, $votePosterSession);
                    $session->set("vote_$userId", $votePosterSession);
                }
            }

            return $session->get("vote_$userId");
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
            $voteId = $vote['id'];
            if ($voteId == $posterId) {
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


}