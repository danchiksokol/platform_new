<?php


namespace App\Command;

use App\Services\Message\MessageService;
use App\Services\Participant\ParticipantService;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Routing\RequestContext;
use Symfony\Component\Routing\RouteCollection;
use Symfony\Component\Routing\Route;
use Symfony\Component\Routing\Matcher\UrlMatcher;


// Ratchet libs
use Ratchet\App;
use Ratchet\Http\Router;
use Ratchet\Server\IoServer;
use Ratchet\Http\HttpServer;
use Ratchet\WebSocket\WsServer;

// Chat instance
use App\Sockets\Chat;

class SocketCommandMany extends Command
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
        $this->setName('socket:chats')
            // the short description shown while running "php bin/console list"
            ->setHelp("Starts the chats socket demo")
            // the full command description shown when running the command with
            ->setDescription('Starts the chats socket demo');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln([
                             'Chats socket',// A line
                             '============',// Another line
                             'Starting chats, open your browser.',// Empty line
                         ]);

//        $collection = new RouteCollection();
//        $collection->add(
//            'broadcast1',
//            new Route('broadcast/1', [
//                '_controller' => new Chat($this->participantService, $this->messageService),
//            ])
//        );
////        $collection->add(
////            'broadcast2',
////            new Route('/broadcast/2', [
////                '_controller' => new Chat($this->participantService, $this->messageService),
////            ])
////        );
//        $urlMatcher = new UrlMatcher($collection, new RequestContext());
//        $router = new Router($urlMatcher);
//
//        $server = IoServer::factory(
//            new HttpServer(new WsServer($router)),
//            8080
//        );
//        $server->run();

        $app = new App('localhost', 8080,'172.18.0.3');
        // Add route to chat with the handler as second parameter
        $app->route('/broadcast/1', new Chat($this->participantService, $this->messageService));

        // To add another routes, then you can use :
        //$app->route('/america-chat', new AmericaChat);
        //$app->route('/europe-chat', new EuropeChat);
        //$app->route('/africa-chat', new AfricaChat);
        //$app->route('/asian-chat', new AsianChat);

        // Run !
        $app->run();
    }
}