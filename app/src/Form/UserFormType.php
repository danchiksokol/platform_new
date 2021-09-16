<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('is_attend', CheckboxType::class)
            ->add('email', EmailType::class)
            ->add(
                'surname',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'name',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'patronymic',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'specialization',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'job',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'position',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'phone',
                TelType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'country',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'city',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'password',
                PasswordType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'save',
                SubmitType::class,
                [
                    'label' => 'Сохранить',
                    'attr' => [
                        'class' => 'btn btn-outline-secondary'
                    ]
                ]
            );
//            ->add(
//                'delete',
//                SubmitType::class,
//                [
//                    'label' => 'Удалить',
//                    'attr' => [
//                        'class' => 'btn btn-danger'
//                    ]
//                ]
//            );
//            ->add('isVerified', CheckboxType::class)
//            ->add('secret', TextType::class);
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
