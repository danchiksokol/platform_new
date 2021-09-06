<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210906193349 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user DROP FOREIGN KEY FK_8D93D6495656B91D');
        $this->addSql('DROP INDEX IDX_8D93D6495656B91D ON user');
        $this->addSql('ALTER TABLE user DROP visit_control_id');
        $this->addSql('ALTER TABLE visit_control ADD user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE visit_control ADD CONSTRAINT FK_BB52288CA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('CREATE INDEX IDX_BB52288CA76ED395 ON visit_control (user_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `user` ADD visit_control_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE `user` ADD CONSTRAINT FK_8D93D6495656B91D FOREIGN KEY (visit_control_id) REFERENCES visit_control (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_8D93D6495656B91D ON `user` (visit_control_id)');
        $this->addSql('ALTER TABLE visit_control DROP FOREIGN KEY FK_BB52288CA76ED395');
        $this->addSql('DROP INDEX IDX_BB52288CA76ED395 ON visit_control');
        $this->addSql('ALTER TABLE visit_control DROP user_id');
    }
}
