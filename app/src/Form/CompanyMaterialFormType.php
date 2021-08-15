<?php

namespace App\Form;

use App\Entity\CompanyMaterial;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CompanyMaterialFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'file',
                FileType::class,
                [
                    'label' => 'Загрузка pdf',
                    'required' => false,
                    'data_class' => null
                ]
            )
            ->add(
                'thumbnail',
                FileType::class,
                [
                    'label' => 'Загрузка картинки',
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
                'data_class' => CompanyMaterial::class,
            ]
        );

        $resolver->setRequired(
            [
                'company',
            ]
        );
    }
}
