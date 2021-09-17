<?php


namespace App\Services\Mailer;


use App\Entity\User;
use App\Security\EmailVerifier;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Form\Form;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Mime\Email;

class MailerService
{
    public const LYMPHORUM_EMAIL = 'lymphorum@tsoncology.com';
    public const INFO_EMAIL = 'info@tsoncology.com';
    /**
     * @var MailerInterface
     */
    private MailerInterface $mailer;
    private EmailVerifier $emailVerifier;

    /**
     * MailerService constructor.
     * @param MailerInterface $mailer
     * @param EmailVerifier $emailVerifier
     */
    public function __construct(MailerInterface $mailer, EmailVerifier $emailVerifier)
    {
        $this->mailer = $mailer;
        $this->emailVerifier = $emailVerifier;
    }

    /**
     * @param Form $form
     * @param string $filePath
     * @throws TransportExceptionInterface
     */
    public function handleSendEmail(Form $form, string $filePath)
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
            ->from(self::LYMPHORUM_EMAIL)
            ->to($emailTo)
            ->subject($title)
            ->text('Sending emails is fun again!')
            ->html(
                "<p>ФИО: $fio</p>
                      <p>Телефон: $phone</p>
                      <p>Город: $city</p>
                      <p>Место работы: $work</p>
                      <p>Авторы: $authors</p>
                      <p>Тезисы: $theses</p>"
            )
            ->attachFromPath($filePath);

        $this->mailer->send($email);
    }


    /**
     * @param Form $form
     * @param string $title
     * @throws TransportExceptionInterface
     */
    public function handleSendRegistrationHelpEmail(Form $form, string $title)
    {
        $question = $form->get('question')->getData();
        $emailTo = $form->get('email')->getData();
        $email = (new Email())
            ->from($emailTo)
            ->to(self::INFO_EMAIL)
            ->subject($title)
            ->text('Sending emails is fun again!')
            ->html(
                "
                        <p>e-mail: $emailTo</p>
                        <p>$question</p>
                      "
            );

        $this->mailer->send($email);
    }

    /**
     * @param User $user
     * @throws TransportExceptionInterface
     */
    public function handleSendTemplateEmail(User $user)
    {
        $this->emailVerifier->sendEmailConfirmation(
            'app_login',
            $user,
            (new TemplatedEmail())
                ->from(new Address('lymphorum@tsoncology.com', mb_convert_encoding('Лимфорум', "UTF-8")))
                ->to($user->getEmail())
                ->subject(
                    'Началась трансляция Интерактивного форума экспертов "Лимфорум" 17-18 сентября 2021 г. на платформе.'
                )
                ->htmlTemplate('main/registration/confirmation_email_send.html.twig')
        );
    }

}