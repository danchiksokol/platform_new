<?php

namespace App\Form;

use App\Entity\Theses;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\SubmitButton;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ThesesFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'FIO',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "ФИО"]
                ]
            )
            ->add(
                'email',
                EmailType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => " Ваш e-mail"]
                ]
            )
            ->add(
                'phone',
                TelType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Телефон"]
                ]
            )
            ->add(
                'city',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Город"]
                ]
            )
            ->add(
                'work',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Лечебное учереждение"]
                ]
            )
            ->add(
                'title',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Заголовок постера"]
                ]
            )
            ->add(
                'authors',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Авторы"]
                ]
            )
            ->add(
                'theses',
                TextareaType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Тезис", 'maxlength' => 2500]
                ]
            )
            ->add(
                'file',
                FileType::class,
                [
                    'label' => 'Загрузка файлов',
                    'required' => true,
                    "row_attr" => [
                        "class" => "d-none"
                    ],
                ]
            )
            ->add(
                'send',
                SubmitType::class,
                [
                    'label' => 'Отправить',
                    'attr' => [
                        'class' => 'btn btn-outline-secondary'
                    ]
                ]
            );
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            [
                'data_class' => Theses::class,
            ]
        );
    }
}
