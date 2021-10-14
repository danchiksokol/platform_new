<?php
// myapplication/src/sandboxBundle/Command/SocketCommand.php
// Change the namespace according to your bundle
namespace App\Command;

use App\Services\Message\MessageService;
use App\Services\Participant\ParticipantService;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

// Include ratchet libs
use Ratchet\Server\IoServer;
use Ratchet\Http\HttpServer;
use Ratchet\WebSocket\WsServer;

// Change the namespace according to your bundle
use App\Sockets\Chat;

class SocketCommand extends Command
{
    /**
     * @var string|null
     */
    private $name;
    /**
     * @var ParticipantService
     */
    private $participantService;
    /**
     * @var MessageService
     */
    private $messageService;

    /**
     * SocketCommand constructor.
     * @param string|null $name
     * @param ParticipantService $participantService
     * @param MessageService $messageService
     */
    public function __construct(
        string $name = null,
        ParticipantService $participantService,
        MessageService $messageService
    ) {
        parent::__construct($name);
        $this->participantService = $participantService;
        $this->messageService = $messageService;
    }

    protected function configure()
    {
        $this->setName('socket:chat')
            // the short description shown while running "php bin/console list"
            ->setHelp("Starts the chat socket demo")
            // the full command description shown when running the command with
            ->setDescription('Starts the chat socket demo');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln(
            [
                'Chat socket',// A line
                '============',// Another line
                'Starting chat, open your browser.',// Empty line
            ]
        );

        $server = IoServer::factory(
            new HttpServer(
                new WsServer(
                    new Chat($this->participantService, $this->messageService)
                )
            ),
            8080
        );

        $server->run();
    }
}