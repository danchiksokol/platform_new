<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210529123316 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE vote (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, poster_id INT DEFAULT NULL, date_create DATETIME NOT NULL, date_update DATETIME DEFAULT NULL, INDEX IDX_5A108564A76ED395 (user_id), INDEX IDX_5A1085645BB66C05 (poster_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE vote ADD CONSTRAINT FK_5A108564A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE vote ADD CONSTRAINT FK_5A1085645BB66C05 FOREIGN KEY (poster_id) REFERENCES poster (id)');
        $this->addSql('ALTER TABLE poster ADD poster_category_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE poster ADD CONSTRAINT FK_2D710CF284624602 FOREIGN KEY (poster_category_id) REFERENCES poster_category (id)');
        $this->addSql('CREATE INDEX IDX_2D710CF284624602 ON poster (poster_category_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE vote');
        $this->addSql('ALTER TABLE poster DROP FOREIGN KEY FK_2D710CF284624602');
        $this->addSql('DROP INDEX IDX_2D710CF284624602 ON poster');
        $this->addSql('ALTER TABLE poster DROP poster_category_id');
    }
}
