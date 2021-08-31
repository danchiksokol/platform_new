<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RegistrationHelpFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'email',
                EmailType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Введите свой e-mail"]
                ]
            )
            ->add(
                'question',
                TextareaType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Введите свой вопрос"]
                ]
            )
            ->add(
                'helpButton',
                SubmitType::class,
                [
                    'label' => 'Отправить',
                    'attr' => [
                        'class' => 'btn btn-fill'
                    ]
                ]
            );
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
                                   // Configure your form options here
                               ]);
    }
}
