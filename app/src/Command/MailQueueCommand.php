<?php

namespace App\Command;

use App\Repository\MailQueueRepository;
use App\Repository\UserRepository;
use App\Services\Mailer\MailerService;
use Exception;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class MailQueueCommand extends Command
{
    public const EMAIL_LIMIT = 20;
    /**
     * @var MailQueueRepository
     */
    private MailQueueRepository $mailQueueRepository;
    /**
     * @var MailerService
     */
    private MailerService $mailerService;
    private UserRepository $userRepository;

    /**
     * @param MailQueueRepository $mailQueueRepository
     * @param MailerService $mailerService
     * @param UserRepository $userRepository
     */
    public function __construct(
        string $name = null,
        MailQueueRepository $mailQueueRepository,
        MailerService $mailerService,
        UserRepository $userRepository
    ) {
        parent::__construct($name);
        $this->mailQueueRepository = $mailQueueRepository;
        $this->mailerService = $mailerService;
        $this->userRepository = $userRepository;
    }

    protected function configure()
    {
        $this->setName('mail:sendmail')
            // the short description shown while running "php bin/console list"
            ->setHelp("send mail")
            // the full command description shown when running the command with
            ->setDescription('Send mail from queue');
    }


    /**
     * @throws Exception
     */
    public function execute(InputInterface $input, OutputInterface $output): int
    {
        $output->writeln(
            [
                'Send Mail'
            ]
        );
        $mailUsers = $this->mailQueueRepository->getMailLimit(self::EMAIL_LIMIT);
        foreach ($mailUsers as $mailUser) {
            $user = $this->userRepository->getOne($mailUser->getUser()->getId());
            $this->mailerService->handleSendTemplateEmail($user);
            $this->mailQueueRepository->setDelete($mailUser);
            $this->mailQueueRepository->setSave();
        }

        return Command::SUCCESS;
    }

}