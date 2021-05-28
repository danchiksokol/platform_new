<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210528151935 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE company (id INT AUTO_INCREMENT NOT NULL, logo VARCHAR(255) DEFAULT NULL, title LONGTEXT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE company_material (id INT AUTO_INCREMENT NOT NULL, company_id INT DEFAULT NULL, file VARCHAR(255) NOT NULL, date_create DATETIME NOT NULL, date_update DATETIME DEFAULT NULL, INDEX IDX_642960F8979B1AD6 (company_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE company_video (id INT AUTO_INCREMENT NOT NULL, company_id INT DEFAULT NULL, video LONGTEXT NOT NULL, INDEX IDX_3B367849979B1AD6 (company_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE company_material ADD CONSTRAINT FK_642960F8979B1AD6 FOREIGN KEY (company_id) REFERENCES company (id)');
        $this->addSql('ALTER TABLE company_video ADD CONSTRAINT FK_3B367849979B1AD6 FOREIGN KEY (company_id) REFERENCES company (id)');
        $this->addSql('ALTER TABLE theses CHANGE date_create date_create DATETIME DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE company_material DROP FOREIGN KEY FK_642960F8979B1AD6');
        $this->addSql('ALTER TABLE company_video DROP FOREIGN KEY FK_3B367849979B1AD6');
        $this->addSql('DROP TABLE company');
        $this->addSql('DROP TABLE company_material');
        $this->addSql('DROP TABLE company_video');
        $this->addSql('ALTER TABLE theses CHANGE date_create date_create DATETIME DEFAULT NULL');
    }
}
