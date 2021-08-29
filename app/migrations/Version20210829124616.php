<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210829124616 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_statistics (id INT AUTO_INCREMENT NOT NULL, company_id INT DEFAULT NULL, company_material_id INT DEFAULT NULL, company_video_id INT DEFAULT NULL, broadcast_id INT DEFAULT NULL, is_sponsors TINYINT(1) DEFAULT NULL, INDEX IDX_45B44DCE979B1AD6 (company_id), INDEX IDX_45B44DCEFAD914F7 (company_material_id), INDEX IDX_45B44DCE31561523 (company_video_id), INDEX IDX_45B44DCE9C7E80E0 (broadcast_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_statistics ADD CONSTRAINT FK_45B44DCE979B1AD6 FOREIGN KEY (company_id) REFERENCES company (id)');
        $this->addSql('ALTER TABLE user_statistics ADD CONSTRAINT FK_45B44DCEFAD914F7 FOREIGN KEY (company_material_id) REFERENCES company_material (id)');
        $this->addSql('ALTER TABLE user_statistics ADD CONSTRAINT FK_45B44DCE31561523 FOREIGN KEY (company_video_id) REFERENCES company_video (id)');
        $this->addSql('ALTER TABLE user_statistics ADD CONSTRAINT FK_45B44DCE9C7E80E0 FOREIGN KEY (broadcast_id) REFERENCES chat_room (id)');
        $this->addSql('ALTER TABLE user ADD user_statistics_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D64974AB38E2 FOREIGN KEY (user_statistics_id) REFERENCES user_statistics (id)');
        $this->addSql('CREATE INDEX IDX_8D93D64974AB38E2 ON user (user_statistics_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `user` DROP FOREIGN KEY FK_8D93D64974AB38E2');
        $this->addSql('DROP TABLE user_statistics');
        $this->addSql('DROP INDEX IDX_8D93D64974AB38E2 ON `user`');
        $this->addSql('ALTER TABLE `user` DROP user_statistics_id');
    }
}
