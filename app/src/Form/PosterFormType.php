<?php

namespace App\Form;

use App\Entity\Poster;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PosterFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'title',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Заголовок"]
                ]
            )
            ->add(
                'content',
                TextType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Текст"]
                ]
            )
            ->add(
                'file',
                FileType::class,
                [
                    'label' => 'Загрузка pdf',
                    'required' => true
                ]
            )
            ->add(
                'thumbnail',
                FileType::class,
                [
                    'label' => 'Загрузка картинки',
                    'required' => true
                ]
            )
            ->add(
                'posterCategory',
                ChoiceType::class,
                [
                    'choices' => $options['posterCategory'],
                ]
            )
            ->add(
                'add',
                SubmitType::class,
                [
                    'label' => 'Добавить',
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
                'data_class' => Poster::class,
            ]
        );
        $resolver->setRequired(
            [
                'posterCategory',
            ]
        );
    }
}
