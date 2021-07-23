<?php


namespace App\Services\Poster;


use App\Entity\Poster;
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
     * @param int $userId
     * @param int $posterId
     * @return array
     * @throws Exception
     */
    public function handleSession(Request $request, int $userId, int $posterId): array
    {
        try {
            $poster = $this->posterRepository->getOne($posterId);
            $votePosterSession = [$poster];
            $session = $request->getSession();
            if ($session->has("vote_$userId")) {
                $votePosterSession = $session->get("vote_$userId");
                $votePosterSession = $this->setVotePosterToArray($poster, $votePosterSession);
            }
            $session->set("vote_$userId", $votePosterSession);

            return $session->get("vote_$userId");
        } catch (Exception $exception) {
            return throw new Exception($exception->getMessage());
        }
    }

    /**
     * @param Poster $poster
     * @param array $votePosterSession
     * @return bool
     */
    public function hasVotePosterSession(Poster $poster, array $votePosterSession): bool
    {
        if (count($votePosterSession)) {
            foreach ($votePosterSession as $vote) {
                $voteId = $vote->getId();
                $posterId = $poster->getId();
                if ($voteId == $posterId) {
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * @param Poster $poster
     * @param array $votePosterSession
     * @return array
     */
    public function setVotePosterToArray(Poster $poster, array $votePosterSession): array
    {
        if (!$this->hasVotePosterSession($poster, $votePosterSession)) {
            array_push($votePosterSession, $poster);
        }

        return $votePosterSession;
    }

}