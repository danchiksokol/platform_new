<?php

namespace App\Sockets;

use App\Services\Message\MessageService;
use App\Services\Participant\ParticipantService;
use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

class Chat implements MessageComponentInterface
{
    /**
     * @var \SplObjectStorage
     */
    protected $clients;
    /**
     * @var ParticipantService
     */
    private $participantService;
    /**
     * @var MessageService
     */
    private $messageService;

    /**
     * Chat constructor.
     * @param ParticipantService $participantService
     * @param MessageService $messageService
     */
    public function __construct(ParticipantService $participantService, MessageService $messageService)
    {
        $this->clients = new \SplObjectStorage();
        $this->participantService = $participantService;
        $this->messageService = $messageService;
    }

    public function onOpen(ConnectionInterface $conn)
    {
        // Store the new connection to send messages to later
        $this->clients->attach($conn);

        echo "New connection! ({$conn->resourceId})\n";
    }

    public function onMessage(ConnectionInterface $from, $msg)
    {
        $numRecv = count($this->clients) - 1;
        echo sprintf(
            'Connection %d sending message "%s" to %d other connection%s' . "\n"
            ,
            $from->resourceId,
            $msg,
            $numRecv,
            $numRecv == 1 ? '' : 's'
        );

        foreach ($this->clients as $client) {
            if ($from !== $client) {
                // The sender is not the receiver, send to each client connected
                $client->send($msg);
            }
        }

        $data = json_decode($msg);
        $chatRoomId = intval($data->chatroom);
        $userId = $data->username;
        $content = $data->message;
        $participant = $this->participantService->createParticipant($chatRoomId, $userId);
        $this->messageService->saveMessage($participant, $content);
    }

    public function onClose(ConnectionInterface $conn)
    {
        // The connection is closed, remove it, as we can no longer send it messages
        $this->clients->detach($conn);

        echo "Connection {$conn->resourceId} has disconnected\n";
    }

    public function onError(ConnectionInterface $conn, \Exception $e)
    {
        echo "An error has occurred: {$e->getMessage()}\n";

        $conn->close();
    }
}