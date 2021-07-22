<?php


namespace App\Services\Poster;


use App\Repository\PosterRepository;
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

    public function handleSession(Request $request, int $posterId)
    {
        $poster = $this->posterRepository->getOne($posterId);
        $session = $request->getSession();
        $session->set('posters_vote', $poster);
        $test = $session->get('posters_vote');
        //TODO разобраться как добавлять и вынимать несколько значений из сессии
    }

}