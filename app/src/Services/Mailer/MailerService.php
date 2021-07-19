<?php


namespace App\Services\Mailer;


use Symfony\Component\Form\Form;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class MailerService
{
    public const EMAIL = 'danchiksokol@gmail.com';
    /**
     * @var MailerInterface
     */
    private $mailer;

    /**
     * MailerService constructor.
     * @param MailerInterface $mailer
     */
    public function __construct(MailerInterface $mailer)
    {
        $this->mailer = $mailer;
    }

    /**
     * @param Form $form
     * @param string $filePath
     * @throws \Symfony\Component\Mailer\Exception\TransportExceptionInterface
     */
    public function handleSendMail(Form $form, string $filePath)
    {
        $fio = $form->get('FIO')->getData();
        $phone = $form->get('phone')->getData();
        $city = $form->get('city')->getData();
        $work = $form->get('work')->getData();
        $title = $form->get('title')->getData();
        $authors = $form->get('authors')->getData();
        $theses = $form->get('theses')->getData();
        $emailTo = $form->get('email')->getData();
        $email = (new Email())
            ->from(self::EMAIL)
            ->to($emailTo)
            ->subject($title)
            ->text('Sending emails is fun again!')
            ->html('<p>See Twig integration for better HTML integration!</p>')
            ->attachFromPath($filePath);
//TODO:: Отверстать письмо для тезисов
        $this->mailer->send($email);
    }
}