<?php

namespace App\Form;

use App\Entity\Speaker;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SpeakerFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'is_show',
                CheckboxType::class,
                [
                    'required' => false
                ]
            )
            ->add(
                'user',
                ChoiceType::class,
                [
                    'choices' => $options['users'],
                    'attr' => [
                        'class' => 'form-select'
                    ]
                ]
            )
            ->add(
                'chatroom',
                ChoiceType::class,
                [
                    'choices' => $options['chatRooms'],
                    'attr' => [
                        'class' => 'form-select'
                    ]
                ]
            )
            ->add(
                'save',
                SubmitType::class,
                [
                    'label' => 'Сохранить',
                    'attr' => [
                        'class' => 'btn btn-fill'
                    ]
                ]
            );
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            [
                'data_class' => Speaker::class,
            ]
        );

        $resolver->setRequired(
            [
                'users',
                'chatRooms'
            ]
        );
    }
}
