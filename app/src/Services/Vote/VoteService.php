<?php


namespace App\Services\Vote;


use App\Entity\User;
use App\Entity\Vote;
use App\Repository\PosterRepository;
use App\Repository\UserRepository;
use App\Repository\VoteRepository;
use DateTime;
use Exception;
use Symfony\Component\HttpFoundation\Request;

class VoteService
{
    private UserRepository $userRepository;
    private VoteRepository $voteRepository;
    private PosterRepository $posterRepository;

    /**
     * VoteService constructor.
     * @param VoteRepository $voteRepository
     * @param UserRepository $userRepository
     * @param PosterRepository $posterRepository
     */
    public function __construct(
        VoteRepository $voteRepository,
        UserRepository $userRepository,
        PosterRepository $posterRepository
    ) {
        $this->userRepository = $userRepository;
        $this->voteRepository = $voteRepository;
        $this->posterRepository = $posterRepository;
    }

    /**
     * @param Request $request
     * @param User $user
     * @return $this
     * @throws Exception
     */
    public function handleCreate(Request $request, User $user): static
    {
        $userId = $user->getId();
        $session = $request->getSession();
        if ($session->has("vote_$userId")) {
            $votePosterSession = $session->get("vote_$userId");
            foreach ($votePosterSession as $id) {
                $vote = new Vote();
                $poster = $this->posterRepository->getOne($id);
                $vote->setUser($user);
                $vote->setPoster($poster);
                $vote->setCreatedAt(new DateTime());
                $this->voteRepository->setCreate($vote);
            }
            $this->voteRepository->setSave();
            $session->remove("vote_$userId");
            $session->set("vote_$userId", ['is_vote' => true]);
        }

        return $this;
    }

    /**
     * @param Request $request
     * @param User $user
     * @return bool
     */
    public function isVoteSession(Request $request, User $user): bool
    {
        $userId = $user->getId();
        $session = $request->getSession();
        $votePosterSession = $session->get("vote_$userId");
        if (is_null($votePosterSession)) {
            return false;
        }

        return reset($votePosterSession);
    }

    /**
     * @param User $user
     * @return bool
     */
    public function isVote(User $user): bool
    {
        $vote = $this->voteRepository->getOneByUser($user);
        if (is_null($vote)) {
            return false;
        }

        return true;
    }
}