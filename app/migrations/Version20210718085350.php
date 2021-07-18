<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210718085350 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE answer_speaker (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, speaker_id INT DEFAULT NULL, chatroom_id INT DEFAULT NULL, question_speaker_id INT DEFAULT NULL, content VARCHAR(255) DEFAULT NULL, created_at DATETIME NOT NULL, is_show TINYINT(1) NOT NULL, INDEX IDX_33C51410A76ED395 (user_id), INDEX IDX_33C51410D04A0F27 (speaker_id), INDEX IDX_33C51410CAF8A031 (chatroom_id), INDEX IDX_33C51410B79E90AF (question_speaker_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE question_speaker (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, speaker_id INT DEFAULT NULL, chatroom_id INT DEFAULT NULL, content VARCHAR(255) DEFAULT NULL, created_at DATETIME NOT NULL, is_show TINYINT(1) NOT NULL, INDEX IDX_75590E7CA76ED395 (user_id), INDEX IDX_75590E7CD04A0F27 (speaker_id), INDEX IDX_75590E7CCAF8A031 (chatroom_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE speaker (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, chatroom_id INT DEFAULT NULL, created_at DATETIME NOT NULL, is_show TINYINT(1) NOT NULL, INDEX IDX_7B85DB61A76ED395 (user_id), INDEX IDX_7B85DB61CAF8A031 (chatroom_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE answer_speaker ADD CONSTRAINT FK_33C51410A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE answer_speaker ADD CONSTRAINT FK_33C51410D04A0F27 FOREIGN KEY (speaker_id) REFERENCES speaker (id)');
        $this->addSql('ALTER TABLE answer_speaker ADD CONSTRAINT FK_33C51410CAF8A031 FOREIGN KEY (chatroom_id) REFERENCES chat_room (id)');
        $this->addSql('ALTER TABLE answer_speaker ADD CONSTRAINT FK_33C51410B79E90AF FOREIGN KEY (question_speaker_id) REFERENCES question_speaker (id)');
        $this->addSql('ALTER TABLE question_speaker ADD CONSTRAINT FK_75590E7CA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE question_speaker ADD CONSTRAINT FK_75590E7CD04A0F27 FOREIGN KEY (speaker_id) REFERENCES speaker (id)');
        $this->addSql('ALTER TABLE question_speaker ADD CONSTRAINT FK_75590E7CCAF8A031 FOREIGN KEY (chatroom_id) REFERENCES chat_room (id)');
        $this->addSql('ALTER TABLE speaker ADD CONSTRAINT FK_7B85DB61A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE speaker ADD CONSTRAINT FK_7B85DB61CAF8A031 FOREIGN KEY (chatroom_id) REFERENCES chat_room (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE answer_speaker DROP FOREIGN KEY FK_33C51410B79E90AF');
        $this->addSql('ALTER TABLE answer_speaker DROP FOREIGN KEY FK_33C51410D04A0F27');
        $this->addSql('ALTER TABLE question_speaker DROP FOREIGN KEY FK_75590E7CD04A0F27');
        $this->addSql('DROP TABLE answer_speaker');
        $this->addSql('DROP TABLE question_speaker');
        $this->addSql('DROP TABLE speaker');
    }
}
