<?php

namespace App\Form;

use App\Entity\QuestionSpeaker;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class QuestionSpeakerFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'content',
                TextareaType::class,
                [
                    'required' => true,
                    'attr' => ['placeholder' => "Вопрос", 'maxlength' => 1000]
                ]
            )
            ->add(
                'speaker',
                ChoiceType::class,
                [
                    'choices' => $options['speakers'],
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
                'data_class' => QuestionSpeaker::class,
            ]
        );
        $resolver->setRequired(
            [
                'speakers',
            ]
        );
    }
}
