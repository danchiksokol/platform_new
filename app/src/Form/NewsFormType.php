<?php

namespace App\Form;

use App\Entity\News;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NewsFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'title',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'href',
                TextType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'file',
                FileType::class,
                [
                    'label' => 'Загрузка картинки',
                    'required' => false,
                    'data_class' => null
                ]
            )
            ->add('is_show', CheckboxType::class, [
                'label' => 'Отобразить?',
                'required' => false
            ])
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
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
                                   'data_class' => News::class,
                               ]);
    }
}
