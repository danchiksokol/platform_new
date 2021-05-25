<?php

namespace App\Form;

use App\Entity\Theses;
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
            ->add('FIO')
            ->add('email')
            ->add('phone')
            ->add('city')
            ->add('work')
            ->add('title')
            ->add('authors')
            ->add('theses')
            ->add(
                'file',
                FileType::class,
                [
                    'label' => 'Загрузка файлов',
                    'required' => false
                ]
            )
            ->add(
                'Save',
                SubmitType::class,
                [
                    'label' => 'Сохранить'
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
