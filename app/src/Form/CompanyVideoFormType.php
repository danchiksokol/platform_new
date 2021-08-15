<?php

namespace App\Form;

use App\Entity\CompanyVideo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CompanyVideoFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'video',
                FileType::class,
                [
                    'label' => 'Загрузка видео',
                    'required' => false,
                    'data_class' => null
                ]
            )
            ->add(
                'company',
                ChoiceType::class,
                [
                    'choices' => $options['company'],
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
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            [
                'data_class' => CompanyVideo::class,
            ]
        );
        $resolver->setRequired(
            [
                'company',
            ]
        );
    }
}
