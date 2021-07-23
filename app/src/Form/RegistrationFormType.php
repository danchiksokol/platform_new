<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email',
                  EmailType::class,
                  [
                      'required' => true,
                      'attr' => ['placeholder' => "Ваш e-mail"]
                  ])
            ->add(
                'agreeTerms',
                CheckboxType::class,
                [
                    'mapped' => false,
                    'constraints' => [
                        new IsTrue(
                            [
                                'message' => 'You should agree to our terms.',
                            ]
                        ),
                    ],
                ]
            )
            ->add(
                'plainPassword',
                PasswordType::class,
                [
                    // instead of being set onto the object directly,
                    // this is read and encoded in the controller
                    'mapped' => false,
                    'attr' => ['autocomplete' => 'new-password', 'placeholder' => "Пароль"],
                    'constraints' => [
                        new NotBlank(['message' => 'Please enter a password',]),
                        new Length(
                            [
                                'min' => 6,
                                'minMessage' => 'Your password should be at least {{ limit }} characters',
                                // max length allowed by Symfony for security reasons
                                'max' => 4096,
                            ]
                        ),
                    ],
                ]
            )
            ->add(
                'surname',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Фамилия"]
                ]
            )
            ->add(
                'name',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Имя"]
                ]
            )
            ->add(
                'patronymic',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Отчество"]
                ]
            )
            ->add(
                'specialization',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Специализация"]
                ]
            )
            ->add(
                'job',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Место работы"]
                ]
            )
            ->add(
                'position',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Должность"]
                ]
            )
            ->add(
                'phone',
                TelType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Телефон"]
                ]
            )
            ->add(
                'country'
                ,
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Страна"]
                ]
            )
            ->add(
                'city',
                TextType::class,
                [
                    'required' => false,
                    'attr' => ['placeholder' => "Город"]
                ]
            );
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            [
                'data_class' => User::class,
            ]
        );
    }
}
