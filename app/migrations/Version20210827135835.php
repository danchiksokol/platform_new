<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210827135835 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE company ADD is_show TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE company_material ADD is_show TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE company_video ADD is_show TINYINT(1) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE company DROP is_show');
        $this->addSql('ALTER TABLE company_material DROP is_show');
        $this->addSql('ALTER TABLE company_video DROP is_show');
    }
}
