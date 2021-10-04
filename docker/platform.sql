-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Окт 01 2021 г., 10:02
-- Версия сервера: 8.0.21
-- Версия PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `platform`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `email`, `roles`, `password`) VALUES
(1, 'admin@example.com', '[\"ROLE_ADMIN\"]', '$2y$13$v52wMTEN8wjc1k6rlm3HyOZHGIjZ5edKpKpo/P..jkBe3BVRaCX9W');

-- --------------------------------------------------------

--
-- Структура таблицы `answer`
--

CREATE TABLE `answer` (
  `id` int NOT NULL,
  `message_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `answer_speaker`
--

CREATE TABLE `answer_speaker` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `speaker_id` int DEFAULT NULL,
  `chatroom_id` int DEFAULT NULL,
  `question_speaker_id` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_show` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_room`
--

CREATE TABLE `chat_room` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `broadcast` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `chat_room`
--

INSERT INTO `chat_room` (`id`, `name`, `broadcast`) VALUES
(1, 'Основная 18', '//vimeo.com/video/597052985'),
(2, 'AstraZeneca', '//vimeo.com/video/597054069'),
(3, 'Нанолек', '//vimeo.com/video/609695222'),
(4, 'БМС', '//vimeo.com/video/609025211'),
(5, 'Основная 18', '//vimeo.com/video/597053464');

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE `company` (
  `id` int NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_show` tinyint(1) DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`id`, `logo`, `title`, `created_at`, `updated_at`, `content`, `is_show`, `href`) VALUES
(10, '611930e334f99.jpg', 'AbbVie', '2021-09-02 15:20:14', NULL, 'AbbVie — глобальная научно-исследовательская биофармацевтическая компания, приверженная разработке инновационной терапии для лечения некоторых из самых сложных заболеваний в мире. Миссия компании – использовать экспертизу, опыт преданных делу сотрудников и уникальный подход к инновациям для развития и вывода на рынок передовых методов лечения, в первую очередь, в области иммунологии, онкологии, вирусологии и неврологии. Сотрудники компании AbbVie ежедневно работают в 75 странах мира для совершенствования решений для здравоохранения. За дополнительной информацией о компании обращайтесь по адресу <a href=\"https://www.abbvie.com/\" target=\"_blank\">www.abbvie.com</a>, следите за новостями @abbvie на Facebook.', NULL, NULL),
(11, '612f2762a7d41.png', 'Takeda', '2021-09-02 15:16:31', NULL, '<b>О компании Takeda Pharmaceutical Company Limited</b><br><br>\r\nTakeda Pharmaceutical Company Limited (<a href=\"https://www.takeda.com/investors/\" target=\"_blank\">TSE:4502/NYSE:TAK</a>) глобальная биофармацевтическая, приверженная ценностям, компания с фокусом на научные разработки. Компания c головным офисом в Японии занимает лидирующие позиции на фармацевтическом рынке мира. Takeda стремится заботиться о здоровье и будущем пациентов, используя последние достижения науки для создания инновационных лекарственных средств. Научно-исследовательская деятельность компании направлена на разработку новых препаратов в ряде терапевтических областей: онкологии, гастроэнтерологии, неврологии и лечении редких заболеваний, целевые инвестиции осуществляются также в разработку вакцин и препаратов плазмы крови.  В фокусе внимания компании - разработка инновационных лекарственных средств, способствующих изменению жизни пациентов. Мы создаем передовые методы лечения на объединенной научно-исследовательской платформе компании, формируя перспективный портфель продуктов в нескольких терапевтических областях. Наши сотрудники, работающие более чем в 80 странах и регионах мира, преданы идее улучшения качества жизни пациентов. Для получения дополнительной информации посетите наш сайт <a href=\"http://www.takeda.com/\" target=\"_blank\">www.takeda.com</a> <br><br>\r\n\r\nООО «Такеда Фармасьютикалс» («Такеда Россия») входит в состав Takeda Pharmaceutical Company Limited, Осака, Япония. Центральный офис расположен в Москве. Более подробную информацию о «Такеда» в России вы можете найти на сайте: <a href=\"http://www.takeda.com/ru-ru\" target=\"_blank\">www.takeda.com/ru-ru</a>', NULL, NULL),
(12, '612f27c9015d8.png', 'Bristol Myers Squibb', '2021-09-02 14:53:54', NULL, 'Прорывные открытия, меняющие жизни пациентов, лежат в основе всего, что делает компания Бристол Майерс Сквибб. Мы остаемся верны нашей миссии открывать, разрабатывать и обеспечивать пациентов инновационными технологиями, которые помогают им справляться с серьезными заболеваниями, и никогда не изменим своей цели – дарить надежду людям по всему миру. <br><br>\r\n\r\nМы уделяем большое внимание применению научных инноваций, так как верим, что наука способна справиться с одними из самых серьезных заболеваний современности. Наши научные достижения позволили добиться беспрецедентных результатов в лечении пациентов с такими заболеваниями, как рак, сердечно-сосудистые заболевания, ВИЧ и ВГС. Мы стали первыми, кто создал класс лекарств, которые используют силу иммунной системы в лечении рака. <br><br>\r\n\r\nМы стремимся предоставить доступ к нашим препаратам для всех пациентов, поэтому мы тщательно работаем над процессом ценообразования и следуем политикам, помогающим увеличить доступность препаратов. Мы активно участвуем в глобальном диалоге, нацеленном на обеспечение доступности наших жизненно-важных лекарственных препаратов. <br><br>\r\n\r\nМы поддерживаем программы, инициативы и организации, которые нацелены на повышение уровня оказания медицинской помощи, расширение возможностей для исследовательской деятельности и поддержку образования в сфере естественных наук.  Мы выступаем за равноправное оказание медицинской помощи по всему миру и стараемся повысить доступность жизненно- важных препаратов для людей, страдающих серьезными заболеваниями. <br><br>\r\n\r\nНаша главная мотивация – понимание того, что наши усилия могут изменить жизнь пациентов. \r\n<br><br>\r\n\r\n<a href=\"https://www.bms.com/ru\" target=\"_blank\">https://www.bms.com/ru</a>\r\n<br><br>\r\n\r\nNORU2002776-01', NULL, NULL),
(13, '612e38203a405.png', 'AstraZeneca', '2021-09-02 14:55:17', NULL, '«АстраЗенека» является международной инновационной биофармацевтической компанией, нацеленной на исследование, развитие и коммерческое использование рецептурных препаратов в таких ключевых терапевтических областях, как онкология, кардиология и сахарный диабет, респираторные, воспалительные и аутоиммунные заболевания, а также в неврологии. Компания представлена более чем в 100 странах мира.<br><br>\r\n\r\nАдрес: 123110, г. Москва, 1-й Красногвардейский проезд, д.21, стр.1., 30 этаж, Б/Ц «Око», СИТИ. <br><br>\r\n\r\nТелефон:	+7 (495) 799 56 99. <br>\r\nФакс: +7 (495) 799 56 98. <br>\r\nЭлектронная почта: Moscow.Reception@astrazeneca.com<br>\r\nСайт: <a href=\"https://www.astrazeneca.ru\" target=\"_blank\">https://www.astrazeneca.ru/</a><br>', NULL, NULL),
(16, '612f87de0d6b6.png', 'Sanofi', '2021-09-03 12:42:03', NULL, '<b>Санофи</b> – глобальная биофармацевтическая компания, миссия которой – оказывать поддержку тем, кто сталкивается с различными проблемами со здоровьем. <br><br>\r\nСанофи представлена более чем в 100 странах мира и присутствует в России с 1970-х годов, являясь лидером российского фармацевтического рынка в течение 6 последних лет . Широкий диверсифицированный портфель препаратов компании позволяет поддерживать здоровье россиян, начиная c профилактики инфекционных заболеваний современными вакцинами до управления такими серьезными заболеваниями, как диабет, сердечно-сосудистые, онкологические, аутоимунные и редкие генетические болезни, а также рассеянный склероз.<br><br>\r\nСтратегия Санофи в России отвечает государственным приоритетам в области здравоохранения: локализация производства препаратов для лечения социально-значимых заболеваний не только позволила повысить доступность инновационной терапии для российских пациентов, но и укрепила экспортный потенциал России в странах Евросоюза.', NULL, 'https://hemoexpo.ru/'),
(17, '6130d6bfd769e.png', 'Nanolek', '2021-09-15 13:56:43', NULL, '<b>О КОМПАНИИ НАНОЛЕК</b><br><br>\r\n\r\nНАНОЛЕК — это современная быстроразвивающаяся российская биофармацевтическая компания с собственным высокотехнологичным производством полного цикла по стандартам GMP и ISO, которая специализируется на выпуске импортозамещающих и инновационных лекарственных препаратов, как собственной разработки, так и созданных с привлечением международных партнеров, с фокусом на профилактику и терапию социально значимых заболеваний. Компания обладает уникальным опытом в области трансфера технологий в рамках партнерств с ведущими мировыми фармацевтическими компаниями (Merck, Sanofi,Novartis, Egis, Aspen, Celltrion, Riemser и др.). <br><br>\r\nООО «Нанолек» стал победителем премии «Платиновая унция-2019» в номинации «Вектор года» подноминация «Проект года. Бизнес-проект», лауреатом премии в области эффективного использования передовых технологий «ПРИОРИТЕТ-2020» в номинации «Локализация производства» за препарат для лечения синдрома Хантера – ХАНТЕРАЗА», занял первое место в категории «Быстрорастущие крупные компании» рейтинга «ТЕХУСПЕХ»-2019 и «ТЕХУСПЕХ»-2020, а также компания была участником приоритетного проекта Минэкономразвития России «Поддержка частных высокотехнологических компаний-лидеров» («Национальные чемпионы») в 2017 году. <br><br>\r\nНа сегодняшний день компания является одним из лидеров в области производства педиатрических вакцин в РФ. Компания НАНОЛЕК работает в следующих направлениях: вакцины, specialty care, CMO. <br><br>\r\n14 августа 2019 года ООО «Нанолек» вышло из списка портфельных компаний РОСНАНО. <br><br>\r\nВ 2020 году ООО «Нанолек» вошло в перечень системообразующих предприятий российской экономики. Решение о включении организации в перечень было принято правительственной комиссией по повышению устойчивости развития российской экономики. Отраслевой список опубликован на сайте Минпромторга России 25 апреля 2020 года. <br><br>\r\n\r\n<b>Цифры за 2020 год</b><br>\r\n\r\n<ul>\r\n<li><p>Выручка компании за 2020 год составила порядка 12 млрд рублей, что на 60% выше показателя 2019 года (7,5 млрд).</p></li>\r\n<li><p>Налоговые отчисления составили: 548,6 млн рублей, из них в бюджет Кировской области – 225,9 млн рублей, что в 2,5 раза больше, чем годом ранее.</p></li>\r\n<li><p>Объем инвестиций составил более 828 млн рублей, что на 66% выше показателя 2019 года (500 млн рублей).</p></li>\r\n</ul><br><br>\r\n\r\n\r\n<p>Сайт <a href=\"http://www.nanolek.ru/\" target=\"_blank\">www.nanolek.ru</a> <br>\r\nФейсбук <a href=\"www.facebook.com/nanolek/\" target=\"_blank\">www.facebook.com/nanolek/</a> <br>\r\nИнстаграм <a href=\"www.instagram.com/nanolek_team/target=\"_blank\">www.instagram.com/nanolek_team/</a> <br>\r\nYouTube <a href=\"https://www.youtube.com/channel/UCnItb1UgSvgAqaKwd5VLYxg?view_as=subscriber\" target=\"_blank\">https://www.youtube.com/channel/UCnItb1UgSvgAqaKwd5VLYxg?view_as=subscriber</a> </p><br><br>\r\n\r\n<p>ООО “Нанолек”<br>\r\nОГРН   1117746339369<br>\r\nИНН   7701917006 / КПП   770101001  \r\n<br><br>\r\n127055, Москва, Бутырский Вал, 68/70, стр. 1<br>\r\nТел.: +7 (495) 648-26-87<br>\r\nwww.nanolek.ru <br>\r\npress@nanolek.ru</p>', NULL, NULL),
(18, '613096363909d.png', 'Amgen', '2021-09-02 15:10:40', NULL, '<b>Амджен</b> – биотехнологическая компания, занимающаяся разработкой, производством и распространением инновационных лекарственных препаратов, созданных методами генной инженерии. <br><br>\r\n 	Компания Амджен, основанная в 1980 году, является лидером биотехнологической индустрии и одной из первых раскрыла потенциал нового поколения эффективных и безопасных лекарств и принципиально новых подходов к лечению тяжелых заболеваний.\r\n<br><br>\r\n 	Препараты Амджен изменили повседневную медицинскую практику, помогая миллионам людей во всем мире бороться с тяжелыми онкологическими, гематологическими и нефрологическими заболеваниями, ревматоидным артритом и другими серьезными патологиями. Обширный портфель разрабатываемых на сегодняшний день препаратов (более 50 новых молекул, находящихся на разных стадиях разработки и исследований) подтверждает приверженность компании к использованию научных достижений для улучшения жизни людей. <br><br>\r\n 	Компания Амджен остается верна своей миссии: «Служить пациентам, страдающим тяжелыми заболеваниями, путем разработки инновационных лекарств для удовлетворения медицинской потребности».\r\n<br><br>\r\n 	Подробную информацию о новейших научно-исследовательских разработках и лекарственных препаратах компании «Амджен» можно найти на сайтах: <a href=\"http://www.amgen.com\" target=\"_blank\">http://www.amgen.com</a> и <a href=\"https://www.amgen.ru/\" target=\"_blank\">www.amgen.ru</a>\r\n<br><br>\r\n<b>RU-NPS-1120-00001</b><br><br>\r\nAmgen LLC, Russia, Moscow, 123112<br>\r\nPresnenskaya naberezhnaya 8, bld.1, fl.7<br>\r\ntel +7(495)745-0478/79 <br>\r\nfax +7 (499) 995-1965<br>\r\nwww.amgen.com<br> www.amgen.ru', NULL, NULL),
(19, '61308b48ec4c7.png', 'Biocad', '2021-09-03 15:58:18', NULL, '<b>О компании</b>\r\n <br><br>\r\nBIOCAD – одна из крупнейших биотехнологических инновационных компаний в России, объединившая научно-исследовательские центры мирового уровня, современное фармацевтическое и биотехнологическое производство, доклинические и клинические исследования, соответствующие международным стандартам. \r\n  <br><br>\r\nBIOCAD – компания полного цикла создания лекарственных препаратов от поиска молекулы до массового производства и маркетинговой поддержки. Продуктовый портфель в настоящее время состоит из 61 препарата, включая 9 оригинальных; более 40 продуктов находятся на разных стадиях разработки. Препараты предназначены для лечения онкологических и аутоиммунных заболеваний.\r\n  <br><br>\r\n\r\nВ BIOCAD работает более 2600 человек, из которых около одной трети – ученые и исследователи. Офисы компании есть в ОАЭ, Китае, Бразилии, Вьетнаме.\r\n  <br><br>\r\n\r\nИсточник: пресс-служба компании BIOCAD, <a href=\"https://biocad.ru/\" target=\"_blank\">www.biocad.ru</a>     \r\n  <br><br>\r\n\r\nПри использовании материала просим указывать в качестве источника BIOCAD или имя спикера.', NULL, NULL),
(20, '61308af40b072.png', 'Roche', '2021-09-02 14:55:56', NULL, '«Рош» — глобальная инновационная компания в области фармацевтики и диагностики, которая использует передовую науку, чтобы улучшить жизни людей. Объединение фармацевтического и диагностического подразделений позволяет «Рош» быть одним из лидеров в области персонализированной медицины — стратегии, направленной на разработку эффективных медицинских решений для пациентов, с учетом индивидуальных особенностей каждого.<br><br>\r\n«Рош» — один из крупнейших производителей биотехнологических лекарственных препаратов для лечения онкологических, аутоиммунных, инфекционных и офтальмологических заболеваний и нарушений центральной нервной системы. Компания также является одним из лидеров в области диагностики <em>in vitro</em> и гистологической диагностики онкологических заболеваний, а также пионером в области самоконтроля сахарного диабета.<br><br>  \r\n«Рош» была основана в 1896 году. На протяжении своей истории она продолжает искать новые возможности профилактики, диагностики и лечения заболеваний и вносит значимый вклад в общественное развитие. Компания также стремится улучшить доступ пациентов к медицинским инновациям, работая со всеми заинтересованными сторонами. Более 30 препаратов «Рош», в том числе жизненно важные антибиотики, противомалярийные и противоопухолевые препараты, включены в Примерные перечни основных лекарственных средств ВОЗ. Кроме того, 10 лет подряд компания «Рош» признается лидером в сфере фармацевтики, биотехнологий и медико-биологических наук по показателям устойчивости индекса Доу-Джонса. \r\n<br><br>\r\nГруппа компаний «Рош», штаб-квартира которой расположена в Базеле, Швейцария, имеет представительства более чем в 100 странах мира. В компании работают более 94 000 человек. В 2018 году инвестиции «Рош» в исследования и разработки составили 11 млрд швейцарских франков. «Рош» полностью принадлежит компания Genentech, США, а также контрольный пакет акций компании Chugai Pharmaceutical, Япония. Дополнительную информацию о компании «Рош» в России можно получить на сайте <a href=\"https://www.roche.ru/\" target=\"_blank\">www.roche.ru</a>.\r\n<br><br>\r\nАО «Рош-Москва»<br>\r\n107045, Россия, г. Москва, Трубная площадь, дом 2<br>\r\nТел.:  +7 (495) 229 29 99<br>\r\nФакс: +7 (495) 229 79 99<br>\r\n<a href=\"https://www.roche.ru/\" target=\"_blank\">www.roche.ru</a>', NULL, NULL),
(21, '61308ab125af0.png', 'Janssen', '2021-09-02 15:24:51', NULL, '<b>О Janssen,\r\nфармацевтических компаниях\r\nJohnson & Johnson</b><br><br>\r\n\r\nВ Janssen мы создаем будущее, где заболевания\r\nостанутся в прошлом. Мы — фармацевтические\r\nкомпании Johnson & Johnson, и мы не жалеем\r\nсил, чтобы это будущее стало реальностью\r\nдля пациентов по всему миру. Мы побеждаем\r\nзаболевания передовыми открытиями науки.\r\nИзобретаем, как помочь тем, кто нуждается\r\nв помощи. Исцеляем безнадежность\r\nчеловеческим теплом.<br><br>\r\n\r\nМы работаем в тех областях медицины, где\r\nможем принести больше всего пользы: сердечно-\r\nсосудистые заболевания, иммуноопосредованные\r\nзаболевания и нарушения обмена веществ,\r\nинфекционные болезни и вакцины, заболевания\r\nцентральной нервной системы, онкология,\r\nлегочная артериальная гипертензия.<br><br>\r\n\r\nУзнайте больше на <a href=\"https://www.janssen.com/russia/\" target=\"_blank\">janssen.com/russia</a><br><br>\r\nПодписывайтесь: <a href=\"https://www.facebook.com/JanssenRU/\" target=\"_blank\">facebook.com/JanssenRU/</a><br><br>\r\nООО «Джонсон & Джонсон» в Janssen<br>\r\nPharmaceutical Companies, Johnson & Johnson.<br><br>\r\nCP-196130', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `company_material`
--

CREATE TABLE `company_material` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `company_material`
--

INSERT INTO `company_material` (`id`, `company_id`, `file`, `created_at`, `updated_at`, `thumbnail`, `is_show`) VALUES
(2, 10, '6119397988873.pdf', '2021-08-15 15:57:45', NULL, '6119397989805.png', 0),
(3, 10, '611939aa072fb.pdf', '2021-08-15 15:58:34', NULL, '611939aa08975.png', 0),
(4, 10, '612639222d91f.pdf', '2021-08-25 15:35:46', NULL, '6126392231118.png', 0),
(5, 10, '6126392bc0442.pdf', '2021-08-25 15:35:55', NULL, '6126392bc25e3.png', 0),
(6, 10, '612c987d827b7.pdf', '2021-08-30 11:36:13', NULL, '612c987d88d8a.png', 0),
(7, 10, '612c988e06be5.pdf', '2021-08-30 11:36:30', NULL, '612c988e08ef0.png', 0),
(8, 10, '612cbe9fb718b.pdf', '2021-08-30 14:18:55', NULL, '612cbe9fbeb9f.png', 0),
(13, 10, '612cc0ffc32f8.pdf', '2021-08-30 14:29:03', NULL, '612cc0ffc5ff3.png', 0),
(14, 10, '612cc151c215f.pdf', '2021-08-30 14:30:25', NULL, '612cc151c42d7.png', 0),
(15, 10, '612e3ac87a0a6.pdf', '2021-08-31 17:20:56', NULL, '612e3ac87cf9b.png', 1),
(16, 10, '612e3ae41a0e9.pdf', '2021-08-31 17:21:24', NULL, '612e3ae41c830.png', 1),
(17, 11, '612e3cf6331a4.pdf', '2021-08-31 17:30:14', NULL, '612e3cf63894e.png', 1),
(18, 11, '612e3cfe7a129.pdf', '2021-08-31 17:30:22', NULL, '612e3cfe7a634.png', 1),
(19, 18, '61309ba095eb4.pdf', '2021-09-02 12:38:40', NULL, '61309ba09b429.png', 1),
(20, 18, '61309bad5ba8f.pdf', '2021-09-02 12:38:53', NULL, '61309bad5eaad.png', 1),
(21, 18, '61309bbb41af1.pdf', '2021-09-02 12:39:07', NULL, '61309bbb44d70.png', 1),
(22, 20, '6130b5b8016c4.pdf', '2021-09-02 14:30:00', NULL, '6130b5b80a894.png', 1),
(25, 20, '6130b5e7eb51c.pdf', '2021-09-02 14:30:47', NULL, '6130b5e7ec51a.png', 1),
(26, 20, '61445523bc1cb.pdf', '2021-09-02 14:31:32', '2021-09-17 11:43:15', '61445523bffb7.png', 1),
(27, 21, '6130caae59598.pdf', '2021-09-02 15:59:26', NULL, '6130caae6119f.png', 1),
(28, 21, '6130cab96acf9.pdf', '2021-09-02 15:59:37', NULL, '6130cab96d9a5.png', 1),
(29, 21, '6130cac82d99f.pdf', '2021-09-02 15:59:52', NULL, '6130cac83111a.png', 1),
(30, 17, '61446b25d4da4.pdf', '2021-09-03 15:51:09', '2021-09-17 13:17:09', '61446b25d8cc6.png', 1),
(31, 19, '6132229a2a8ed.pdf', '2021-09-03 16:26:50', NULL, '6132229a37a24.png', 1),
(32, 19, '613222d94d5ce.pdf', '2021-09-03 16:27:53', NULL, '613222d954fd8.png', 1),
(33, 19, '6132231e13deb.pdf', '2021-09-03 16:29:02', NULL, '6132231e18c39.png', 1),
(34, 17, '61446b4d48a0f.pdf', '2021-09-15 20:41:29', '2021-09-17 13:17:49', '61446b4d496ee.png', 1),
(35, 17, '61446b6ad6221.pdf', '2021-09-15 20:41:44', '2021-09-17 13:18:18', '61446b6ad92c7.png', 1),
(36, 13, '61430ffa26f27.pdf', '2021-09-16 12:35:31', '2021-09-16 12:35:54', '61430ffa2c0bc.png', 1),
(37, 13, '6143101f555cc.pdf', '2021-09-16 12:36:11', '2021-09-16 12:36:31', '6143101f58228.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `company_video`
--

CREATE TABLE `company_video` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_show` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `company_video`
--

INSERT INTO `company_video` (`id`, `company_id`, `video`, `is_show`) VALUES
(8, 13, 'https://player.vimeo.com/video/596417351', 1),
(10, 16, 'https://player.vimeo.com/video/596423285', 1),
(11, 18, 'https://player.vimeo.com/video/596421908', 1),
(13, 11, 'https://player.vimeo.com/video/596424674', 1),
(14, 12, 'https://player.vimeo.com/video/596508689', 1),
(15, 21, 'https://player.vimeo.com/video/596545173', 1),
(17, 10, 'https://player.vimeo.com/video/596553894', 1),
(18, 19, 'https://player.vimeo.com/video/597210976', 1),
(19, 20, 'https://player.vimeo.com/video/601219720', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210926215157', '2021-10-01 10:01:37', 85);

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int NOT NULL,
  `participant_id` int DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_show` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`id`, `participant_id`, `content`, `file`, `created_at`, `is_show`) VALUES
(132, 52, 'Спасибо !', NULL, '2021-09-21 12:03:37', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_show` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `href`, `file`, `created_at`, `updated_at`, `is_show`) VALUES
(6, 'Session1', 'broadcast', '6128dfad01de5.png', '2021-09-17 10:20:57', '2021-09-17 10:20:57', 0),
(7, 'Session2', 'broadcast', '6128dfb5e3028.png', '2021-09-17 13:28:13', '2021-09-17 13:28:13', 0),
(8, 'Session3', 'https://lymphorum.com/broadcast', '6128dfc8ea40b.png', '2021-09-17 14:46:41', '2021-09-17 14:46:41', 0),
(9, 'Session4', 'https://lymphorum.com/broadcast', '6128dff3db14d.png', '2021-09-18 08:36:08', '2021-09-18 08:36:08', 0),
(10, 'Session5', 'broadcast', '6128dffd12169.png', '2021-09-17 13:28:39', '2021-09-17 13:28:39', 0),
(11, 'AZsymp', 'https://lymphorum.com/broadcast/2', '6128e1909c3ec.png', '2021-09-17 13:52:11', '2021-09-17 13:52:11', 0),
(12, 'bmssymp1', 'https://lymphorum.com/broadcast/4', '6128e19fa05b5.png', '2021-09-18 15:54:05', '2021-09-18 15:54:05', 0),
(13, 'nanoleksymp', 'https://lymphorum.com/broadcast/3', '6128e1a6d4e6a.png', '2021-09-17 13:52:22', '2021-09-17 13:52:22', 0),
(14, 'UpcomingEvents', 'app_broadcast', '6128e5020c196.png', '2021-08-27 16:13:38', '2021-08-27 16:13:38', 0),
(18, 'До начала', NULL, '6138d9bda8104.png', '2021-09-08 18:41:49', NULL, 0),
(20, 'Before start second day', NULL, '6144dcb960bdf.png', '2021-09-17 21:21:45', NULL, 0),
(21, 'obed', NULL, '6145bffea9eab.png', '2021-09-18 13:31:26', NULL, 0),
(22, 'Before record', NULL, '6145e743704d5.png', '2021-09-18 16:18:59', NULL, 0),
(23, 'Record', 'https://lymphorum.com/broadcast', '614db327d642e.png', '2021-09-24 14:14:47', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `participant`
--

CREATE TABLE `participant` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `chatroom_id` int DEFAULT NULL,
  `is_block` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `participant`
--

INSERT INTO `participant` (`id`, `user_id`, `chatroom_id`, `is_block`) VALUES
(21, 24, 1, 0),
(22, 314, 1, 0),
(23, 277, 1, 0),
(24, 375, 1, 0),
(25, 129, 1, 0),
(26, 159, 1, 0),
(27, 289, 1, 0),
(28, 403, 1, 0),
(29, 398, 1, 0),
(30, 80, 1, 0),
(31, 382, 1, 0),
(32, 97, 1, 0),
(33, 304, 1, 0),
(34, 303, 1, 0),
(35, 195, 1, 0),
(36, 185, 1, 0),
(37, 377, 1, 0),
(38, 292, 1, 0),
(39, 178, 1, 0),
(40, 335, 1, 0),
(41, 169, 2, 0),
(42, 24, 2, 0),
(43, 24, 3, 0),
(44, 314, 2, 0),
(45, 108, 1, 0),
(46, 470, 1, 0),
(47, 458, 1, 0),
(48, 169, 1, 0),
(49, 450, 1, 0),
(50, 201, 4, 0),
(51, 256, 4, 0),
(52, 481, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `poster`
--

CREATE TABLE `poster` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `poster_category_id` int DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `poster`
--

INSERT INTO `poster` (`id`, `title`, `content`, `file`, `created_at`, `updated_at`, `poster_category_id`, `thumbnail`, `is_show`) VALUES
(6, 'Постер № 1', 'Прогностическая ценность классификационных признаков течения множественной миеломы в современную эру', '611a27b4254c0.pdf', '2021-08-16 11:54:12', NULL, 3, '611a27b42a6d9.png', NULL),
(7, 'Постер № 02', 'Опыт лечения пациентов с множественной миеломой с применением высокодозной химиотерапии и аутологичной трансплантации гемопоэтических стволовых клеток. Данные отделения гематологии ГБУЗ ИОКБ', '611a281367012.pdf', '2021-08-16 11:55:47', NULL, 3, '611a281367d6d.png', NULL),
(8, 'Постер № 3', 'Морфофункциональные особенности сосудистой ниши костного мозга и мезенхимных стромальных клеток у пациентов с множественной миеломой после терапии', '611a290385d02.pdf', '2021-08-16 11:59:47', NULL, 3, '611a290387c19.png', NULL),
(9, 'Постер № 4', 'Динамика показателей клеточного иммунитета у больных множественной миеломой до и после аутологичной трансплантации гемопоэтических стволовых клеток', '611a2928c6199.pdf', '2021-08-16 12:00:24', NULL, 3, '611a2928c7352.png', NULL),
(10, 'Постер № 7', 'Успешное лечение больного с ишемической болезнью сердца после лучевой терапии по поводу неходжкинской лимфомы', '611a2942dc2a6.pdf', '2021-08-16 12:00:50', NULL, 4, '611a2942ddb4f.png', NULL),
(11, 'Постер № 8', 'Риск развития тромбоэмболических осложнений у пациентов с неходжкинской лимфомой с антителами к кардиолипинам', '611a295fc4fa1.pdf', '2021-08-16 12:01:19', NULL, 4, '611a295fc6040.png', NULL),
(12, 'Постер № 28', 'Терапия ингибиторами контрольных точек PD-1 в комбинации с BeGEV у пациентов с рецидивом классической лимфомы Ходжкина', '611a298124f29.pdf', '2021-08-16 12:01:53', NULL, 5, '611a298125d9a.png', NULL),
(13, 'Постер № 29', 'Ингибиторы контрольных точек и классическая лимфома Ходжкина: эффективность и безопасность пебролизумаба при рецидивах и резистентном течении лимфомы (опыт ФГБУ «НМХЦ им. Н.И. Пирогова» Минздрава России)', '611a29a258adc.pdf', '2021-08-16 12:02:26', NULL, 5, '611a29a25a3d7.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `poster_category`
--

CREATE TABLE `poster_category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `poster_category`
--

INSERT INTO `poster_category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Множественная Миелома', '2021-08-16 11:52:41', NULL),
(4, 'Неходжскинские Лимфомы', '2021-08-16 11:53:03', NULL),
(5, 'Лимфома Ходжкина', '2021-08-16 11:53:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `question_speaker`
--

CREATE TABLE `question_speaker` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `speaker_id` int DEFAULT NULL,
  `chatroom_id` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_show` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `question_speaker`
--

INSERT INTO `question_speaker` (`id`, `user_id`, `speaker_id`, `chatroom_id`, `content`, `created_at`, `is_show`) VALUES
(18, 159, 16, 1, 'Добрый день. Похожий пациент с массивными поражениями на коже и слизистой оболочки полости рта. Хронический лимфолейкоз (с февраля 2021 г. - 1 цикл R-B) с паранеопластической пузырчаткой с марта 2021 г. Диагностировался CMV. Проведена терапия неоцитотеком', '2021-09-17 17:31:51', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `speaker`
--

CREATE TABLE `speaker` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `chatroom_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_show` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `speaker`
--

INSERT INTO `speaker` (`id`, `user_id`, `chatroom_id`, `created_at`, `is_show`) VALUES
(16, 429, 1, '2021-09-17 11:29:02', 1),
(17, 429, 3, '2021-09-17 11:29:18', 1),
(18, 429, 4, '2021-09-17 11:29:49', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `theses`
--

CREATE TABLE `theses` (
  `id` int NOT NULL,
  `fio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `secret` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `is_attend` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `surname`, `name`, `patronymic`, `specialization`, `job`, `position`, `phone`, `country`, `city`, `is_verified`, `secret`, `is_attend`) VALUES
(1, 'user@example.com', '[\"ROLE_USER\"]', '$2y$13$v52wMTEN8wjc1k6rlm3HyOZHGIjZ5edKpKpo/P..jkBe3BVRaCX9W', 'Surname', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', 1),
(24, 'danchiksokol@mail.ru', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$v52wMTEN8wjc1k6rlm3HyOZHGIjZ5edKpKpo/P..jkBe3BVRaCX9W', 'Даниил', 'Соколов', 'dfdfgdf', 'dfgdf', 'dfgdf', 'dfgfdfgd', '89261307275', 'Россия', 'г Москва, г Троицк', 1, '76e4a601ceee9dfc9b3ed2ea7126ca48', NULL),
(33, 'test1@lymphorum.com', '[\"ROLE_USER\"]', '$2y$13$RkGNLq581uQAFjgpz4PNfOT3fAqBCyphBYBxI/FbLi7MZiqWiTtbS', 'Байков', 'В.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', 1),
(34, 'test2@lymphorum.com', '[\"ROLE_USER\"]', '$2y$13$RkGNLq581uQAFjgpz4PNfOT3fAqBCyphBYBxI/FbLi7MZiqWiTtbS', 'Борзенкова', 'Е.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', 1),
(35, 'test3@lymphorum.com', '[\"ROLE_USER\"]', '$2y$13$RkGNLq581uQAFjgpz4PNfOT3fAqBCyphBYBxI/FbLi7MZiqWiTtbS', 'Головенко', 'А.', 'О.', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', NULL),
(36, 'test4@lymphorum.com', '[\"ROLE_USER\"]', '$2y$13$RkGNLq581uQAFjgpz4PNfOT3fAqBCyphBYBxI/FbLi7MZiqWiTtbS', 'Капланов', 'К.', 'Д.', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', 1),
(54, 'vlada.khlebnikova@tsoncology.com', '[\"ROLE_USER\"]', '$2y$13$FLQ24qGvCydjKC2Y0bPTuOnS5Y2kGBh8rgEfcCOb8492BZ/XNIy3W', 'Хлебникова', 'Владислава', 'Валерьевна', '*', 'ТС Онколоджи', '*', '89299159005', 'Россия', 'Москва', 1, '3b780d3fb2642983391274096094c217', 1),
(60, 'dmitriy.suloyev@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$sfBvCWt4CruQtWMj0frU/g$Kp6J9BpnsdyN3dMFbXvqpsG3d5HNwxfktWooZcMiGKk', 'Сулоев', 'Дмитрий', 'Александрович', 'Гематолог', 'ООО Медиком (СМ-Клиника)', 'Врач-гематолог', '+79522410685', 'Российская Федерация', 'Санкт-Петербург', 0, 'ea11c12c9cfbd41366afcf295b1bc1ee', 1),
(61, 'nest.ek@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$xHErJwf94cb3RJo7pAVpWg$513pKWeYc+h20tx1hM2TaUql8ZDdZIB3tTvwvYmWSpQ', 'Нестерова', 'Екатерина', 'Сергеевна', 'гематолог', 'ФГБУ НИМЦ гематологии', 'врач', '89104296226', 'Россия', 'Москва', 0, '44df868f5c9f358ccb469c68b07133ca', 1),
(62, 'tvorozhnikov1988@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fxL3PCWUnu9jTWCjVug3uQ$xvJVRF6n5xNn0ezh6whqywoRk3PYIK7c+QeuJSW+280', 'Творожников', 'Евгений', 'Александрович', 'Гематолог', 'СМ клиника', 'Гематолог', '89505674530', 'Россия', 'Москва', 0, 'cf1753f97a5e23db7a52342c19da599b', NULL),
(63, 'dandelionwine@inbox.ru', '[\"ROLE_USER\"]', '$2y$13$3rEMCLTwqJSHPsBq/MckB.IPdVgadrEa3pNxBRUljBSCZST3skKL.', 'Махнева', 'Анна', 'Фридриховна', 'Патологическая анатомия', 'НЦП и ДХ', 'врач-патоморфолог', '+77013227777', 'Казахстан', 'Алматы', 1, '2d486ee9bfeb3c287e7306711bbfca91', NULL),
(64, 'annarina@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fqV663LvVT8HtZsgpnQu9A$9OtMZs/oJ/gnMpf2aq5AFFfB+DHtzaWJK4SvVXDXYUU', 'Никифорова', 'Анна', 'Владимировна', 'Гематологии', 'КГБУЗ ЦГБ г. Уссурийск', 'Врач гематолог', '89241314959', 'Россия', 'Уссурийск', 0, '451767524ce82ff1cc8fab8b3f95d35a', NULL),
(65, 'dr-monin.ilia@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$38ViSv6B06WR5PTAhdX2kQ$4WiLgMCv8iaxTlyNVQciMLSKtLjHBe2xkExWT73SXX8', 'Монин', 'Илья', 'Сергеевич', 'Онкогематология', 'ФГБУ \" НМИЦ онкологии им. Н.Н.Блохина\" МЗ РФ', 'Врач- трансфузиолог', '89258257848', 'РФ', 'Москва', 0, 'e7a2c7ca76f37e44931799feddefb0b3', NULL),
(67, 'liskovmo@nn.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$FB6ANhaHfEQijrHM1bP18A$KC6N+dfECjlIFs3KU3K7x7HtJdHbAEEw2z3yLw9crDg', 'Лисков', 'Михаил', 'Олегович', 'Онколог', 'Медфарма', 'Врач', '74997281974', 'Россия', 'Москва', 0, 'ca1295904b2e2b81a8a73679ba0ecbfa', 1),
(68, 'tanyaocbs@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$9OZsYD/FaMZXwarFGCx+VA$OiGfIHNXtWAD8HXR6fQNldPam57Qc+mzyJE3LZoRKvs', 'Мишкина', 'Татьяна', 'Анатольевна', 'акушерство и гинекология, онкология', 'ГУЗ ОКБ', 'врач', '+79272298678', 'Россия', 'Саратов', 0, '556b62070b680205117d6d111257b428', NULL),
(69, 'yanot85@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ShGNBYZr/AMCrCFSWFGRqQ$cRIzv0dFe/XkiwaukojWAejNsOYrzE7vgUpfomIY7ew', 'Човдхури', 'Приянка', 'Рошановна', 'гематология', 'ФГБУ ЦКБ УДПРФ', 'гематолог', '89031776222', 'Россия', 'Москва', 0, '9abe51d25b8c938fa4d901e9969c0964', NULL),
(70, 'tatyana.pingina@sibnet.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$tiLCGoVoKoy+K6MVzyH3Ng$FLW56a4auzNz17zczLGiCLC4+5t+Zk6Lm1daFzQzins', 'Пингина', 'Татьяна', 'Алексеевна', 'Онколог', 'Onklinic', 'Врач', '74992276541', 'Россия', 'Москва', 0, 'd3cef347168fe0bf074beafb913b6c70', 1),
(71, 'r.yanin@nanolek.ru', '[\"ROLE_USER\"]', '$2y$13$AktV9WcDJq3Hxtli3Jw1ueUQ5Z1n3DJQ0RRag9KPwu6TaAuqs2tfW', 'Янин', 'Роман', 'Александрович', 'Онкология/онкогематология', 'Нанолек', 'Групп бренд менеджер', '+7916 700 14 00', 'Россия', 'Москва', 0, '8b6806ff06b5cf1b6e52b456fe0c67cd', NULL),
(72, 'gavrilenko_a_n@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$rNHgvirSSFdBS9hOphIYEg$Rv8mh/yP1txW5oJZzqbA3a2GmB3s/QmvZXFZ9LIHfcY', 'Гавриленко', 'Андрей', 'Николаевич', 'врач- онколог', 'НИИ ДОГиТ им Р.М. Горбачевой', 'врач- онколог', '89211487778', 'РФ', 'С- Петербург', 0, '9c8c8abca216fcbce7e0bf8d267d9cda', NULL),
(73, 'kislova-maria@mail.ru', '[\"ROLE_USER\"]', '$2y$13$BNvW9isgeprP3aNXZR9DH.VvVmcB3..F60pp6YlpQQNsfTijRvBni', 'Кислова', 'Мария', 'Игоревна', 'гематология', 'ГКБ им С.П. Боткина', 'ординатор', '+79161559990', 'Россия', 'Москва', 0, 'a86fe870dbaa15b613794d2a7f61f1c6', NULL),
(74, 'doctor_morozov@hotmail.com', '[\"ROLE_USER\"]', '$2y$13$OxyLuEPgmoWH3z8tzS4niumbsOaOVDdxiN2k0TJdFRISZgVYE6Od6', 'Морозов', 'Владимир', 'Александрович', 'гематолог', 'РосНИИГТ ФМБА', 'зав. отделением', '89052133322', 'россия', 'санкт-петербург', 1, '9325a51978f680ecb5f47cfce408cd89', NULL),
(75, 'bikbuliov@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$sv1hOIUMuW/JjWE3oeYQVg$rUvxtlDxEDNlP7tx3uk58XPgwiy1ymDE2C4PUyvuTh4', 'Бикбулатов', 'Владислав', 'Русланович', 'Онкология', 'Ркод', 'Врач онколог', '89273282023', 'Россия', 'Уфа', 0, 'bc87c7a68e4e887d5d6e321fb3a08f04', 1),
(76, 'galialy@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$q3amXCYNzU6JfPSXnoJZCg$+T7A3oWFCFaYZW58+0NjB048sh73zfKeVLic4wpEn7E', 'Алимова', 'Галина', 'Анатольевга', 'врач-лабораторный генетик', 'ФГБУ НМИЦ гематологии  Министерства здравоохранения РФ', 'врач-лабораторный генетик', '8(905)7341232', 'Россия', 'Москва', 0, '4f1d1a0d8f55ffd388e5e9f2f4b31d97', NULL),
(77, 'euromedcomrus@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WWHVg+l7/JXHDqw/D69bKA$2SDMaoZ82jwzta/DYiE5ZG5uLXhGGIoOZkTmt9jdidE', 'Смирнов', 'Сергей', 'Анатольевич', 'Лимфолог', 'Серпуховская городская больница имени Семашко Н. А.', 'Врач', '89151080843', 'РФ', 'Серпухов', 0, '35fc451f32505d6e7bca66f4368f9971', 1),
(78, 'idforstore@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$1zJlPi7XrzNIoqGhhlvbOA$pfzS6wmDxww5Be4MdG6jWFITPew4v7cROBErLTqzAJg', 'Герасимов', 'Георгий', 'Денисович', 'Гематология', 'ГБУЗ МКНЦ им А.С.Логинова ДЗМ', 'Врач-гематолог', '89775608296', 'РФ', 'Москва', 0, 'c3c16ed2b048206bd24913b8684e07ca', NULL),
(79, 'katerina-safi@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$XRGGVBtkP8plybSTRcy8sw$xMrV8n8lxtuMNCRU2UQbwahm5oZOtxXc0kmWHvvnm+Y', 'Сырцева', 'Екатерина', 'Беязитовна', 'Гематология', 'КГБУЗ Красноярская межрайонная клиническая больница 7', 'Врач гематолог', '89135981043', 'Россия', 'Красноярск', 0, '90efbd1202f878f1e9a4cfca6381c0ca', NULL),
(80, 'ksu_12_06@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$d4vQJuqV7d7ETxgKVSljkQ$ErhUmUgt6l0GBU/9APWbkgvdIA31+wcPAodI4bQv8GE', 'Калужская', 'Ксения', 'Владимировна', 'гематология', 'гкб 52', 'врач', '89778049380', 'Россия', 'Москва', 1, '94312e0650269949ac95cf8e73e6d445', NULL),
(81, 'bil-zhanna@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$RxjJsJRN45cjsAs2jisOleUzIHOXUoyqoEi1lePY/QXhP5o8SMeUG', 'Бильчич-Старовик', 'Жанна', 'Владимировна', 'анестезиология, гематология', 'КНП КЦТКМ ОТКМ и ИТ', 'врач', '+380972413932', 'Украина', 'Киев', 1, '5c1e0627b72e6cd54ca4c92a1744b33b', NULL),
(82, 'cooperationrus@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$1dh0UreP0Bc8NXVIwc0cog$bsM2nthW1HYCMVA5gaE/lDLtlFOWROb4PBUpOYgcu6s', 'Макаров', 'Виктор', 'Петрович', 'Эндокринолог', 'Больница Пущинского научного центра РАН', 'Врач', '89195197883', 'Россия', 'Пущино', 0, '561db61498dcc050f06db999697c3cd8', NULL),
(83, 'bondaroncology@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$i7jC9HL/9Pj4H8H4gDGBNA$k/SOoMVgPdA8zUJeg47LITNQyg1opk6YhUeVPENt668', 'Бондарь', 'Людмила', 'Николаевна', 'патологическая анатомия, онкология', 'НИИ Онкологии Томского НИМЦ РАН', 'врач-патологоантом', '89234023216', 'Россия', 'Томск', 0, '4af3dbc52bececfeba09c22d06f45cb9', NULL),
(84, 'marilexo@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$In8Z25JmxY2jNG2rtoB6hOoLeqso81/KVhXnkBI.ApNsTFGcajpHu', 'Иванова', 'Мария', 'Олеговна', 'Гематология', 'ПСПБГМУ', 'Заведующая отделением', '+79217507938', 'Россия', 'Санкт-Петербург', 1, '43feb29a36ae586934ef9b1070fa31a4', NULL),
(85, 'minzdraw@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$jfXgJ91CrOESBVFPuGDepQ$DnOxHZi2jEj8TCN1HfMrs2MQZg7ENRsC7pnmYjkpnDM', 'Травин', 'Михаил', 'Андреевич', 'Онкопатолог', 'НГМУ', 'Доцент', '+79529324262', 'Россия', 'Новосибирск', 0, '988f5448a16c6c7e0d8a524ee83f423f', NULL),
(86, 'ekateri-koto@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$KeiRLS4GVD21wBn6GZnwhg$EkrzIDGRsRdiIRkN1Z2AVbRrFWpHK7A/iD4NpK/t+sQ', 'Котова', 'Екатерина', 'Сергеевна', 'Гематология', 'ФГБУ «НМИЦ гематологии» МЗ РФ', 'Врач-гематолог, аспирант', '89165322436', 'Россия', 'Москва', 0, '2a5bc93575312d32dd1c5e9407e476b5', NULL),
(87, 'blood-60@mail.ru', '[\"ROLE_USER\"]', '$2y$13$RRcanhaSTICfBtQ8GR5BN.nmNxJuklhctrCoie.sdPvx2isqykEqe', 'Балакирева', 'Татьяна', 'Владимировна', 'Гематология', 'ФГБУ ДПО РМАНПО', 'Доцент кафедры', '+79169868660', 'РФ', 'Москва', 1, '4b993879138558fc8f6784b6aa7c1d40', NULL),
(88, 'slava29393@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$v3ErOFwjWbTMU9bx6FIi5w$Kq0TkKEAzDMhCgl87tmHajTIGATaB1dl9KO68dM8/lA', 'Нестеренко', 'Вячеслав', 'Александрович', 'Гематология', 'Сургутская ОКБ', 'Гематолог', '89829179453', 'Россия', 'Сургут', 0, 'd06c99255bf1640a383267c41e08613b', NULL),
(89, 'valya.ryltseva@mail.ru', '[\"ROLE_USER\"]', '$2y$13$V/OwSQJZrUbCGTJVWZ14hequAHd5CPNDBq0CCFUlNk6ngjwV7Re86', 'Куцемелова', 'Валентина', 'Юрьевна', 'Гематология', 'ОКДЦ', 'Врач', '+79094112765', 'Россия', 'Ростов-на-Дону', 0, '7e945bf68c2481cd84b6ecaa5a856c5e', NULL),
(90, 'rechmedina_n@mail.ru', '[\"ROLE_USER\"]', '$2y$13$jQKiug8Eh3gj0GXgWUTEqe7.Ll3gWal9bz0UCwUal62bVuLbbhlrm', 'Речмедина', 'Надежда', 'Владимировна', 'Кардиология', 'ГБУЗ Краснодарского края ГП N23 города Краснодара', 'Врач-кардиолог', '+79183772273', 'Россия', 'Краснодар', 0, '98d2ae6d90591495e0e0192afc6dbf63', NULL),
(91, 'popovaNB@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$U4hS8M4sZj9kB1cOw3aXKeKFf70wpuMLO5fyScL70En8HpSZS/g7e', 'Попова', 'Наталья', 'Борисовна', 'Гематология', 'Сургутская окружная клиническая больница', 'Врач-гематолог', '+79226546304', 'Россия', 'Сургут', 1, 'f2421017a411a7a8add64289c898b977', NULL),
(92, 'dbudanova@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$vElm/MfyAF4kn4++gmkJig$HVKMYCsxIV5kEnzm5x3bjWpGaj3Nf6UwgVBcfSWYjCM', 'Буданова', 'Дарья', 'Александровна', 'Гематолог', 'ПМГМУ им.И.М. Сеченова', 'Врач', '89165202050', 'Россия', 'Москва', 1, 'fa7721613c714f9dd6f381940910861c', NULL),
(93, 'rkaledin85@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Fj6wwL7EoPTVJhN9ZrrXFw$MPonBC0+1ezWlNApv7SN6SzcL6ZnrMzNP4zn5JgHjv0', 'Каледин', 'Руслан', 'Русланович', 'Онкология', 'Нмиц онкологии', 'Врач', '84993241130', 'Россия', 'Москва', 0, '33e243f03d58e8fcbe8bbadae7e64c62', NULL),
(94, 'viktoria2102@icloud.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$0gRexhj6SxVjLGi6Sc5UMA$2NXClFHMO6oOrkYWvDC4PB+ku98khadAi4YDwXubh18', 'Хышова', 'Виктория', 'Александровна', 'Гематология', 'ФГБУ «НМИЦ Гематологии» МЗ РФ', 'Врач-гематолог', '89834130200', 'Россия', 'Москва', 0, '19fe98e4dbcce3592b9e1e823e5ebe5f', NULL),
(95, 'Kovalev.mmeda@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$L0rtUxcq8xpUsH2VTVkrFw$7IcZKcfs5Dt8+2uQb043gd8EzZKQH+aBEweyG9ARyvw', 'Ковалев', 'Алексей', 'Викторович', 'Гематология', 'Военно-медицинская академия им. С.М. Кирова', 'Клинический ординатор', '+79657617787', 'Россия', 'г. Санкт-Петербург', 1, '033bf55061c4ac3f3a0df54fbbb0c3fa', NULL),
(96, 'v-bursim2@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qlr/n8pDgrakcwdgCQP6qA$uDlbtuUY8Cb7V/xJhY9h/CNqXuohkjKBTbhIdBDib4Q', 'Прокопович', 'Елена', 'Владимировна', 'Гематолог', 'Гбуз янао ноябрьская цгб', 'Гематолог', '89634962743', 'Рф', 'Ноябрьск', 0, '9d6a63d8d2c52add95a7dc0aec8a418c', NULL),
(97, 'fatima-babayeva1990@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$nxoXdAolLv8IXaopWsDFsA$QydSoJUNq1hn6K4epwHZrPpmnVY9JpxzrKkhBNroDck', 'Бабаева', 'Фатима', 'Эльшановна', 'гематология', 'ФГБУ НМИЦ Гематологии МЗ РФ', 'ВРАЧ-ГЕМАТОЛОГ', '8-915-233-80-08', 'РФ', 'Москва', 1, '3c49d254fcddccedb3f6f8d9d6c7fe29', NULL),
(98, 'olya.bosko@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$2CeRqlSCmGM2MH4gT9D/5Q$k6EgBhxztCdBhvhuVdZJ9VZVskvOprRzgRNrTmdl3ko', 'Боско', 'Ольга', 'Олеговна', 'Гематология', 'ГЮУЗ ОД2 г. Сочи', 'Зав.отделением', '89654739676', 'Рф', 'Сочи', 1, 'ba8a9886c4fd3c57ebdd57a4acd984e4', NULL),
(99, 'o.skam@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$m/fzBBogzcNAaISvg/5jA.Oc62WhHwb8E3O/4PY10SG1AAXTQeepu', 'Скаморина', 'Ольга', 'Петровна', 'Гематология', 'Центральная поликлиника', 'Врач гематолог', '89031987141', 'Россия', 'Москва', 1, 'd830d863284447936f11ca9acbefa3d9', NULL),
(100, 'samarinasv2010@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZzJSqqVCFDDbyvd4ZOjnBw$my4AoqXRz5ry5FOLTECkqk34dnL5Jw9ZZ4bqZ03Jx88', 'Самарина', 'Светлана', 'Валерьевна', 'Гематология', 'ФГБУН КНИИГ и ПК ФМБА России', 'Заведующая КДО гематологии и химиотерапии', '+79127324756', 'Россия', 'Киров', 1, 'bdf46322a4f3f3f7e435f630c1aa3596', NULL),
(101, 'dokbond@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WisFXcbsotqs+5cTUNr0fg$zUO/UY+LsbM4+SeYvS9j1tKiuGEB9kyMqq0rtcatALE', 'Бондарчук', 'Сергей', 'Валерьевич', 'гематология', 'Медико-социальный институт', 'доцент', '+79119552188', 'Россия', 'Санкт-Петербург', 0, 'cfa08ccef0d5119f3712509bc4ce8f1d', NULL),
(102, 'arzu_27@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$I9cOJ+Qi4sF40DhP7RPZcA$mSP1nx5ZCZKL0GLRGncYWFmOm0TI+BmsOiLov5jBskc', 'Агаширинова', 'Арзу', 'Алфидаровна', 'Гематология', 'ГКБ им СП Боткина', 'Гематолог', '+79057973943', 'РФ', 'Москва', 1, 'f7c6513e539220be77be823cc9cc1807', NULL),
(103, 'Anna.hlavno@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oG4bjyn/k2kHmT0qW4G3Lg$LW4RDUGzWcIcCxVjpK02q88JzOBbm6qgn0iHTtI2i60', 'Хлавно', 'Анна', 'Борисовна', 'Гематология', 'Гкб N1 им НИ Пирогова ДЗМ', 'Врач-гематолог', '+79165876322', 'Россия', 'Москва', 1, 'ed5849949dda294dbf77cc99a75a0b06', NULL),
(104, 'dr.darina@mail.ru', '[\"ROLE_USER\"]', '$2y$13$bZPE9B.ftqM9H3pRUf2NeeiGhoQ.QnJMtB7VrJT.nKk6XslR07VLu', 'Буряк', 'Дарья', 'Владимировна', 'Гематология', 'БУЗ ВО ВОКБ1', 'Врач-гематолог', '+79204532556', 'РФ', 'Воронеж', 1, 'dba944cb9e8abc7761e652a5bac81e8e', NULL),
(105, 'mukhametdinov1963@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$n69tUzANum/MxjK+LjbKaA$fkgIIRZzNg25KPCDRu51dRE5bXtUhqp/ADWij0AdHWw', 'Мухаметдинов', 'Ильдус', 'Габдулхаевич', 'хирургия', 'ГБУЗ РБ Чишминская ЦРБ', 'заведующий хирургическим отделением', '+79177877348', 'Россия', 'рп. Чишмы', 0, 'de1706b810c54b38651583bab9e4544a', NULL),
(106, 'chvali@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$SbFCS2WqP+hqA/EPpgwNiw$WmJfkrQvXTYijH591rRYhIIsVkV2ocSGbv4TG5H/iKw', 'Валиахметова', 'Чулпан', 'Хусаеновна', 'онкология', 'ГАУЗ РКОД МЗ РБ', 'заведующая отделением, врач-онколог', '+79177550015', 'Россия', 'Уфа', 0, '003877cf6692963210514687238fa012', 1),
(107, 'hel.87@bk.ru', '[\"ROLE_USER\"]', '$2y$13$06IO9JfeosmHn5chphUhve4I0MgVYxf/q4EcwUTWLt.o2talDFNrK', 'Петрова', 'Елена', 'Станиславовна', 'Гематология', 'ГБУЗ МКНЦ им. АС Логинова', 'Врач гематолог', '89057548471', 'РФ', 'Москва', 1, 'de70f5e2695a841cfb72abebe70e52de', 1),
(108, 'samarina01@mail.ru', '[\"ROLE_USER\"]', '$2y$13$Ex7lZGOTLEcsnBJtw2hqD.ZNkcg9Z.WKXPSO4mrw2pzyQlFNioo4y', 'Самарина', 'Дарья', 'Владимировна', 'Гематология', 'Цгкб', 'Гематолог', '89052454805', 'Россия', 'Калининград', 1, '99bd08a2acbb388e7db232c3cbe514ce', NULL),
(109, 'liana15.94@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$NGZO2Jq30LDq+gpXVXE5+A$ZNvkoVV5QImpYm6h309ojLQ+uk7vi6w3Yym32Ly6A5A', 'Оганесян', 'Лиана', 'Вачагановна', 'онколог - химиотерапевт', 'МКНЦ им. А.С. Логинова', 'врач онколог', '+79260139727', 'Россия', 'Москва', 1, '4ff176184e0ea45a582de7db8a60552c', NULL),
(110, 'gravity_@mail.ru', '[\"ROLE_USER\"]', '$2y$13$J3OcLh0uJT/Kka.S.86yI.L/wVZeFraGfIa.mEF0fFOtM/zob.lpm', 'Панфилова', 'Виктория', 'Викторовна', 'Клиническая лабораторная диагностика', 'ГОО ВПО ДОННМУ им М Горького', 'ассистент кафедры трансплантологии и клинической лабораторной диагностики', '+70502671875', 'Украина', 'Донецк', 0, '896bbd693152a0a7e074f6ccc829b615', NULL),
(111, 'isachenkov@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$J4M+VPqgLh1CUfO53Uq6qg$x8b2HzKOtW7TePJzr4PzZtYuOhQE4e/E3e2IdQ4r5yA', 'Исаченков', 'Максим', 'Игоревич', 'гематолог', 'ОП ЦАОП ГКБ им.Д.Д.Плетнева', 'врач-гематолог', '+79031402625', 'Россия', 'Москва', 1, 'faa13c2704f293fed1a043659272b2ad', NULL),
(112, 'mts71@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$vFMio7D2LBSgu4iZZCjmAg$Bjg5cfxl04blXiD2b06uNJhx/MupWNd1cnh9qgWaYew', 'Ильичёв', 'Виктор', 'Викторович', 'онкология', 'Мытищинская городская больница', 'Врач', '499 660 98 14', 'Россия', 'Москва', 0, '438c6f8b2e08e11aeb46880a8e67a5d2', 1),
(113, 'mmar55@list.ru', '[\"ROLE_USER\"]', '$2y$13$022WWxe14qE2MaJItQwo8OE3GZ2hIvFd3N4APWe7i.GqCmnclykSC', 'Мельникова', 'Мария', 'Владимировна', 'Патологическая анатомия', 'НМИЦ онкологии им. Н. Н. Блохина', 'Врач-патологоанатом', '89030124773', 'Россия', 'Подольск', 1, 'b0d47b9f0dec168adef53344b6f8678f', NULL),
(114, '4444anna_alekseeva@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$rbLU+mEGyrq7FRb8OIp+zQ$/jDiutLKn2xQMpBaAhwUysI3dvqR0t25TEzXRk7ss6E', 'Алексеева', 'Анна', 'Николаевна', 'гематология', 'ркб им. Семашко', 'врач', '89149831173', 'Россия', 'улан-удэ', 1, '9faafdfa1c411388ab8b085e36a69d72', NULL),
(115, 'valeryamarckelowa@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PVERP8ESvpY5n1naJyOQmg$+1oi8EB87t79ypQBroupIA8tG89191siaA/xb7Tj80Y', 'Маркелова', 'Валерия', 'Александровна', 'Онкология', 'ФГКУ 422 ВГ МО РФ', 'Хирург', '+79030521732', 'Россия', 'Нижний Новгород', 1, '6a3fe67b50f2f6a1aaf6e77b55168883', NULL),
(116, 'ardana_mak@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$HQbj0trUJDTED00HKdTxZQ$SDUePl2Lr1iP3lq9Z0WZB4iTdTBZWfoH8u3gNJMeHkw', 'Makenova', 'Ardana', 'Abylayevna', 'Гематология', 'Областная больница', 'Гематолог', '+77055652035', 'Казахстан', 'Усть-Каменогорск', 0, 'c58d4a20dcbbebe23e61b4cbbcdec982', NULL),
(117, 'ivleva1987@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WbVqrmQbRM3Dy9WSTLwXUQ$6Pe8CHwKE1w2hwqwgociVInSTTKM1KlrW0uxvV3z770', 'Ивлева', 'Ольга', 'Викторовна', 'гематология', 'ЧУЗ ЦКБ РЖД -МЕДИЦИНА', 'гематолог', '8965443383', 'Россия', 'Москва', 0, '48fcdd6b7c2dbe732d5cf2ca6da4f787', NULL),
(118, 'bannikova_anna@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PPHg/EHdRT4T0Z9v0dLp2w$OTDGKIXWG1qZGIxQUmc1UT1NGc8EnRfOrbZqFX0/m8Q', 'Банникова', 'Анна', 'Евгеньевна', 'гематология', 'ФГБУ НМХЦ им Пирогова', 'врач-гематолог', '89167268347', 'Россия', 'Москва', 0, '75c91f0975eae2e290eddb7b7f4caf3c', NULL),
(119, 'doc_tarasenko@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$a4HHX0MKdhYFeZHMzSNKpA$XK2f72uexqOWN8f+u32rdyvJKPdSql8tidiMIDuqP+k', 'Тарасенко', 'Елена', 'Викторовна', 'Гематолог', 'ГБУЗ \"Городская больницы №1 им. Н.И. Пирогова\" г. Севастпополя', 'заведующая отделением', '89787304128', 'Россия', 'Севастополь', 0, 'ddb205395b4bd7bdc3d648dfa9b52a02', NULL),
(120, 'juliagavrilova@list.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$lV4uNlwrR8KPFg8CnwVBPQ$CwlfNOyVRzyFJkePxAZo1t/+d/kpm6+4YKlXq0DluN8', 'Гаврилова', 'Юлия', 'Владимировна', 'гематология', 'ФМБЦ ФМБА', 'Врач-гематолог', '89152891285', 'Россия', 'Москва', 0, '726fafab2200e2c5bdb23548b7d7e0bc', NULL),
(121, 'lesya-shakyeva@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Vj0/dFm+UI7HlZefJWRqcQ$hO30nl9Cg/rL6s6z+KmuJTWDzcuyEE31/7FgVe8bOo8', 'Климова', 'Олеся', 'Усмановна', 'Гематология', 'НИИ ДОГИТ ИМ. Р. М. ГОРБАЧЕВОЙ', 'Гематолог', '89006291724', 'Россия', 'Санкт-Петербург', 0, '17d0491e302726e5ba18cb4cac96f2e2', NULL),
(122, 'khavamed06@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZYJMKgosbHRtIzvrrfJbkg$abws9XbptcWNTH1Dg2IneOQ8PfVbQsME2AlNX/vG4G0', 'Medova', 'Hava', 'Yakubovna', 'Гематология', 'ИРКБ', 'Зав гематологии', '9286978128', 'Ингушетия', 'Назрань', 0, 'ed663d7541de2cace774100b61bdf53c', NULL),
(123, 'voroncova9@mail.ru', '[\"ROLE_USER\"]', '$2y$13$ifghVTTrOK0tVkLeY9EWx.jySf4LiIVlMtoHcRcnogB.YsuXRqGnK', 'Воронцова', 'Александра', 'Валерьевна', 'Гематология', 'ГБУЗ ГКОБ 1 ЦАОП СВАО', 'Врач гематолог', '89163125684', 'Россия', 'Москва', 0, '0e2039c710a882f616de8f7787420f6a', NULL),
(124, 'sandaburuiana69@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$kNm7EcU0oXeUpL4KTjN63g$mtp2VFMX6c/tE8dxSFSyKoAS/bATQ8F+bQi+wz552Hw', 'Буруяна', 'Санда', 'Ивановна', 'Гематология', 'ГУМФ', 'Доцент кафедры', '069384040', 'Молдова', 'Chisinau', 1, 'a65d3aa94e75f6499b65dfc4096eba57', NULL),
(125, 'carbahol@mail.ru', '[\"ROLE_USER\"]', '$2y$13$iynxyW0AinCGU.l7SCZ0bO0jjCPbZfbc4grjmE32Do/KAl4p34.de', 'Глинкина', 'Светлана', 'Александровна', 'Патологическая анатомия', 'ФГБУ «НМИЦ гематологии» Минздрава России', 'врач-патологоанатом', '+79096493684', 'РФ', 'Москва', 0, 'ac87340cc2778642756c8c060a8c89aa', NULL),
(126, 'serratus10@mail.ru', '[\"ROLE_USER\"]', '$2y$13$dyQaG/tz.GU3w8IMYDIiBuWJo68MvWUvwFgjigQDY/1Y0R9wSHCdm', 'Данилина', 'Татьяна', 'Павловна', 'Патологическая анатомия', 'ФГБУ \"НМИЦ гематологии\" Минздрава России', 'Врач-патологоанатом', '89163563798', 'Россия', 'Москва', 0, '902f5afdd97769ec07aef7a8e9dba607', NULL),
(127, 'voda90@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uCNNsQzzVJ8AN9Orf8/RdA$2sKvT6gpNXgPpjD+SRxCPzkZzSf/NartqRbkhePxtvg', 'Шуплецова', 'Ирина', 'Александровна', 'патологическая анатомия', 'ФГБУ \"НМИЦ гематологии\" Минздрава России', 'врач-патологоанатом', '89067575043', 'Россия', 'Москва', 0, 'f7caac87dadbd98daa4abfc22da0ea65', NULL),
(128, 'shch78@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$07i39fJMtOUwIgHWVpcrvA$VYLqkDrA2jq5VhzAIKwSyb5Szi2rOVjI1PqTBH4+lhk', 'Щеголеватая', 'Ольга', 'Олеговна', 'гематология', 'АО ГК Медси,Клиническая больница Медси в Отрадном', 'врач-гематолог', '9039640833', 'РФ', 'Москва', 0, '4c3346540c4cd7a133f5554b95150b1f', NULL),
(129, 'elenavolodicheva@inbox.ru', '[\"ROLE_USER\"]', '$2y$13$nU40N2C481Zg3oymTwyUuOqpyovZbvWLje7JRcaNWwHO8BKirRJLO', 'Володичева', 'Елена', 'Михайловна', 'гематология', 'ГУЗ ТО ТУЛЬСКАЯ ОКБ', 'заведующая отделением', '+79109497702', 'Россия', 'Tula', 0, '16a98010a0408986c351ec96340e97e6', NULL),
(130, 'andrew190884@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$kPchTzDqkJt2kDu8w2f8nw$oFHf44cNklvcR8NPYMNlcMb2XKvqdlitiGDwSItq1g0', 'Лобашев', 'Андрей', 'Германович', 'Онколог', 'БУЗ ВО Вологодская городская поликлиника 1', 'Врач-онколог', '89218342226', 'Россия', 'Вологда', 0, '4acfb385a6c9709d90d043029858c579', NULL),
(131, 'schurov03@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$waRfuMuE3JjyrT7FUmeWyw$PgONtsCQ+ZaYEDVlQTZKSLetMdRArhpq4Q6mnSSBGcI', 'Щуров', 'Николай', 'Федорович', 'онколог', 'Запорожский ГМУ', 'доцент', '+380506205976', 'Украина', 'Запорожье', 1, 'bbde1b3d1401ae2e7d681a0f248d34b3', NULL),
(132, 'm.dmitrieva@nanolek.ru', '[\"ROLE_USER\"]', '$2y$13$pY6Z79qU.IXodZYdQ5tePu89fbIDWMZehLhZKFfCdbuAoqfkGibJi', 'Дмитриева', 'Мария', 'Николвевна', 'врач УЗИ', 'Нанолек', 'MSL', '+79165196156', 'Россия', 'дер. Путилково', 0, 'dc734a6426a34ff89ccbde682eb9c786', 1),
(133, 'tokarevanv75@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zacQRP8Hljau4+UIkq6jOw$gIBkVx4W6LAndsjjOSWN103VvYVUbwpZUjld4L0nOcw', 'Токарева', 'Наталья', 'Валентиновна', 'Врач билхимик', 'ФГБУ СибФНКЦ ФМБА России, СКБ, Перинатальный центр', 'Врач', '+79039539095', 'Россич', 'г Томск', 0, '25f8c3905fc955520aa7202013bf6d34', NULL),
(134, 's.natali03042@gmail.com', '[\"ROLE_USER\"]', '$2y$13$H/wAkxOQZXUolh5HZftUhuANUi1e6rclEac8VlguunfjcWyiB42BC', 'Горева', 'Наталья', 'Викторовна', 'Патологическая анатомия', 'НМИЦ Гематологии', 'Ординатор', '89855386553', 'Россия', 'Москва', 0, 'cb32bbb9c6b7e78fa8aa574a07017857', NULL),
(135, 'say-inara@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JmfPg9VGLLwJUn1NKx8r1A$/B6vU3TDAyKq3KM7+LMp7xbrJZjfZHmPQSJwFp19TjQ', 'Сайдуллаева', 'Инара', 'Санджаровна', 'Гематология', 'НМИЦ гематологии', 'Клинический ординатор', '89680290932', 'Россия', 'Москва', 1, '0987a86644c260c1f5f4ec460822d7fe', NULL),
(136, 'zarema_doc@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$lXFonU24jo/euUjFZQefZA$N2Q5DVZRpDAyEaZmI4fmlXlzCfPKJyNX6opUTdOghO4', 'Шихабова', 'Зарема', 'Саламуевна', 'Онкология', 'Гкб 52', 'Врач', '89258259191', 'Россия', 'Москва', 1, 'dd1fff3e4c03d90ac53fd82c28274630', NULL),
(137, 'cherniy_kloun@mail.ru', '[\"ROLE_USER\"]', '$2y$13$.BkbUhDFgxSoxUPy6akkwuzYtG5NUz0xh5O2nkit2EyGDnav0VVwW', 'Марченко', 'Андрей', 'Анатольевич', 'Патологическая анатомия', 'ГБУЗ НСО \"Государственная Новосибирская областная клиническая больница\"', 'врач-патологоанатом', '8-923-226-91-65', 'Российская Федерация', 'Новосибирск', 1, 'f61e83d15b502d8b89d7296222f629e7', NULL),
(138, 'romanova.es@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$o90tFlOOSAOBwGeMsd2c.OaCO6Y6R9Zlhsrv5MjVoGb9WB/6S.XEa', 'Романова', 'Елена', 'Сергеевна', 'Онкология', 'Чуз ЦКБ РЖД Медицина', 'Врач', '+79036193291', 'Россия', 'Москва', 1, 'c7be86f5ce092b57cd324f3020a1cabc', NULL),
(139, 'doctor-ainash@mail.ru', '[\"ROLE_USER\"]', '$2y$13$ZaE7UVQTAblmAkbo7IFfBuqlEYmkHcQQBtf2Yv2lyiRdURDpeGl2m', 'Altayeva', 'Ainash', 'Zholdybaevna', 'Патологическая анатомия', 'Лаборатуар Де Жени', 'врач патологоанатом', '+79771685671', 'Россия', 'Москва', 1, '531adf4a7b743be3a9baaeadc8cd22ce', NULL),
(140, 'takhaev@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$xWJMbcMbRHzf3yd39tvDDw$5TUqHI3nGKH7GGH9N5/XQg6meZTGR3HqTKhBnhvh5Ck', 'Тахаев', 'Зорикто', 'Владимирович', 'Патологическая анатомия', 'Лаборатуар Де Жени', 'врач патологоанатом', '+79085917021', 'Россия', 'Москва', 0, '4f40b714a10920cc27f220c27a91da5f', NULL),
(141, 'ekaterinaevg12@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$xe5sXEYIuAQ0oKTK7bx6Tg$a5OBxN176nP3A8cPxDU2gZyx3vlnKKdXvn4Y9d7jXQA', 'Горбань', 'Екатерина', 'Евгеньевна', 'Патологическая анатомия', 'ФГБУ НИИЦ Гематологии', 'Ординатор', '9777204633', 'Российская Федерация', 'Москва', 1, 'a10a6feda338f46969dedc495f613f69', NULL),
(142, 'liudmilanch@mail.ru', '[\"ROLE_USER\"]', '$2y$13$82a3TTAaQQ97wKl4QVzg2ep9H7ZlYugZQ8XTCCB1trtNKMGy2RJg6', 'Анчукова', 'Людмила', 'Викторовна', 'Гематолог', 'БУЗ ВО 《ВОКБ》', 'Врач гематолог гематологического отделения', '89212366839', 'Россия', 'Вологла', 0, '57ae30bc1db2915d3ca933b30a1cd570', NULL),
(143, 'sherstnevandrejj@mail.ru', '[\"ROLE_USER\"]', '$2y$13$DkKSTCJMKyG7/tUjNghPuuFP3iNux54.XneKXHx6WvbIvr93ns4Au', 'Шерстнев', 'Андрей', 'Алексеевич', 'Патологическая анатомия', 'ФГБУ \"НМИЦ гематологии\" Минздрава России', 'врач-патологоанатом', '+79260457959', 'РФ', 'Москва', 0, '9ec82d685100c540fed291070abf123d', NULL),
(144, 'tratsevskaya.zh@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$wPu1DnwGqzBKXtx0CKK4xO7MtftEg.C8th2n2wovBOH2czHefyDkm', 'Трацевская', 'Жанна', 'Викторовна', 'Патологическая анатомия', 'НМИЦ гематологии МЗ РФ', 'Врач-патологоанатом', '+79035133651', 'Россия', 'Москва', 0, 'fba92ff4be4d745a11ed5f18c5a91cd2', NULL),
(145, 'mtimoshi@amgen.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$CXFXn+t9LN32zxdGKlgcTg$KTVQuYcueIyHoGOTP3X/2Ok9nkdkDI5ryrEyHTbS4rQ', 'Тимошишин', 'Максим', 'Игоревич', 'Онкогематология', 'Амджен', 'Маркетинг', '89096396761', 'Россия', 'Москва', 0, '1064f5affd9ca54fb0c20825ae6b7339', 1),
(146, 'zstolypina@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$tlsRwaThybFB4xEOH3Algg$BLAulUwAG31/CQKkt0ocHJ6Cq85QJ7RJ6MjqoBvgZl8', 'Столыпина', 'Жанна', 'Леонидовна', 'гематология', 'СПбГБУЗ\"Городская больница№15\"', 'врач', '89119157876', 'Россия', 'Санкт-Петербург', 0, 'dce7ae6d463df26b4e20e1358e825a5e', NULL),
(147, 'mr.kite@yahoo.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$0DY8o86i/1nwMrjxiW7sEA$5ZdUYbkZR3FXiY+wp1RxyeqRgMbm2sYEe7vxb2u91+M', 'Стефанов', 'Дмитрий', 'Николаевич', 'Онкогематология', 'ФГБУ НМИЦ ДГОИ им. Дмитрия Рогачева', 'Научный сотрудник', '79166240171', 'Россия', 'Москва', 0, 'f8f69f158b8ed5c2301a735bee0d44eb', 1),
(148, 'mzarubin@amgen.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$jZDj+66BgXu8ExTNuWsm7A$O9deAmWq5BK/2qzukuap3EWvHgQGVu7WI35L5A4Byd8', 'Зарубина', 'Мария', 'Сергеевна', 'маркетинг', 'Амджен', 'маркетинг менеджер', '+79104297248', 'Россия', 'Москва', 1, 'b269fbfd8e74bb4e999e40647626ce7c', 1),
(149, 'waterfull@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$1SSvj/BFZS7bG+b1BjuI8Q$F98RJmxjN7ql/1F/Be/Cz7XJDJ0UaEsUVfK22TfIA48', 'Конева', 'Анна', 'Игоревна', 'Гематология', 'ГБУЗ ГКБ 52 ДЗМ', 'Врач-гематолог', '89099077507', 'Россия', 'Москва', 1, '5f6e0da576a7a18e850ef3541d96db86', NULL),
(150, 'salamova.parvana@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Qx+cEOn2T+VJkYZA2K+vzg$FekpTmqM6k7T8dGeWwRNR4aCqOyyizxGyPLrdpc+kks', 'Саламова', 'Парвана', 'Габил кызы', 'Гематология', 'УКБ 1,г.Москва', 'Врач ординатор', '89129180627', 'Россия', 'Москва', 1, '3005eee8bdcc74bbdf588fdd836d9d06', NULL),
(151, 'goryacheva_kseny@mail.ru', '[\"ROLE_USER\"]', '$2y$13$DhFDsiy/LlZG.dq0CPPXWOfjbC5rwrXBH1co3F.3xgiUEqNz5f3V2', 'Горячева', 'Ксения', 'Эдуардовна', 'гематология', 'ГБУЗ МО \"Подольская ОКБ\"', 'зав гематологическим отделением', '89166373522', 'Россия', 'Подольск', 0, '8ef356508098e1143fde7b6ad0c97cd3', NULL),
(152, 'abrailovskaya1274@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MGkbB7QED8/YETLOyBO0Dw$opgoSRPiVc8qyFUgeCQG2TC4RZysooVkuvKp/Q8/XAA', 'Брайловская', 'Анастасия', 'Андреевна', 'Гематология', 'УКБ #1', 'Врач-ординатор', '+79057956524', 'Россия', 'Москва', 1, '53ab343bd28f096943e6753c7d02d7fc', NULL),
(153, 'armanarmanarmanarmanarman@yandex.ry', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$lTXS2ywtN6GTQCsayDTxZQ$Vb5c4oDwLY+iWZlni4FjNjzPiGmEI8if1YK5Fb/tROc', 'Аракелян', 'Арман', 'Вачаканович', 'Онкология', 'НМИЦ онкологии им Н.Н. Блохина', 'Аспирант', '+79167388069', 'Россия', 'Москва', 0, 'f35e510472cdededd196e7ae85b9af76', NULL),
(154, 'nastena.voronko@mail.ru', '[\"ROLE_USER\"]', '$2y$13$pUNtZrIQ9ew.MloEkLBNDeAwF3GQ74xAJ3desiqvPD5ASrSG9AYli', 'Музафарова', 'Анастасия', 'Сергеевна', 'Врач гематолог', 'Сургутская окружная клиническая больница', 'Врач', '89171021228', 'Россия', 'Сургут', 0, '2062afc30276f5f157602c54af766da3', NULL),
(155, 'tanya_hem@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$xdKUc6XlXLlqs5h1dTMoyg$lIZadKhAqyEMLWnPsIHjwwANebr8mUedeVn3YbNj4DY', 'Клиточенко', 'Татьяна', 'Юрьевна', 'гематология', 'Клиника Сова на Академической', 'врач', '+79053986763', 'Россия', 'Волгоград', 0, '653a70529277198dc7532ce948567b46', 1),
(156, 'vash_roman93@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$hmHcpg84S/IdQ24JIAE3/w$zZ92bSdd12SzGCgZaLOhcMHvOIraEIneru9gz7/uRpY', 'Ващенков', 'Роман', 'Владиславович', 'Гематология', 'ГКБ 31', 'Врач гематолог', '89110834866', 'Россия', 'Санкт-Петербург', 0, '60cc4d09a7a483d7befc0d8698a437dc', NULL),
(157, 'doktor-gai@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$EdeUArDDLjocm/lpbupvd.FBIlYNL5qn4kjrc4hO6b0YtvDTvfSua', 'Гадаев', 'Игорь', 'Юрьевич', 'Гематология', 'Пмгму им И.М.Сеченова каф. Госпитальной терапии #1', 'Доцент', '89160382833', 'Россия', 'Москва', 1, '6f9eef61ea57f2a1b88036761089cb5d', NULL),
(158, 'sefeta@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$/doi4Ae/NZURM.aKxQfc2enWBGJ6aPBCoSo2SsTPP56V5frbcJftW', 'Писаревская', 'Ольга', 'Николаевна', 'гематология', 'ФГБУ ГВКГ им. Н. Н, Бурденко', 'врач - гематолог', '+7-985-475-82-23', 'Россия', 'Москва', 1, '8fee8da029a26255eb53c8d5e6697de1', NULL),
(159, 'ignatyeva_elena@mail.ru', '[\"ROLE_USER\"]', '$2y$13$fLBV2/g2s5q0OeizduqFfue39KZNj9qLZY9KH7rfIUIZwTKu1YbVW', 'Игнатьева', 'Елена', 'Валентиновна', 'Гематология', 'ФГБУ ГВКГ им. Н. Н. Бурденко МО', 'Гематолог', '+79036630340', 'Российская Федерация', 'Москва', 0, '6b16083098cd5038109c15ef1e80622e', NULL),
(160, 'markovir@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$iuXCxTwkfGNJIaZSpIJ+AQ$vmIXQUjVMgcellnzHiHAcjFJI0ZeMboZGAzlDbQgpV4', 'Марков', 'Игорь', 'Романович', 'гематология', 'ФГБУ ГВКГ им. Н. Н, Бурденко', 'врач - гематолог', '+7-977-284-39-57', 'Россия', 'Москва', 0, 'd39d67ed348f657aec0adea9b04ca897', 1),
(161, 'NOVIKOVA.E.86@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PF28QWhINdQQTrBXVauHrQ$31UZaRAhyMD7LvprAw5eJBNU6a5coG5cy6gj+43Fymw', 'Дурнайкина', 'Екатерина', 'Ивановна', 'гематология', 'ГБУЗ ООД', 'врач', '8937 4231068', 'РФ', 'Пенза', 1, 'fc90fc2a9a4966777349f6d87ad85aa0', NULL),
(162, 'balajancz@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$hdCnZcVSLfqddnGFGL4z2g$O6s6LpmANs7/yQhF8NNKFcOfCjVZ/+QOLYpUjDATzNM', 'Балаянц', 'Виктор', 'Александрович', 'Патологическая анатомия', 'НМИЦ Гематологии', 'Ординатор', '89262300435', 'Россия', 'Москва', 1, '1799c6e642d873369d97f198e29f4b28', NULL),
(163, 'lskhayrullina@mail.ru', '[\"ROLE_USER\"]', '$2y$13$NhiG9tCpLxGH1PsVffG2E.ADXDzGepVdcfvc7TEasYcv1DOYWumqW', 'Хайруллина', 'Лилия', 'Сабуровна', 'Гематология', 'МНИОИ им. П.А. Герцена', 'Врач -гематолог', '+79274475340', 'Россия', 'Москва', 1, '178fa043f5721987e061af0dc0c482db', NULL),
(164, 'ya.zholobova-anna@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$4hsrwFXYt5cLbB8Kr4l0cufJNvBH4CBNlwM2Q6jWCw9augG65HPJ6', 'Жолобова', 'Анна', 'Алексеевна', 'Гематология', 'городская больница №31', 'Клинический ординатор', '89214261008', 'Россия', 'Санкт-Петербург', 0, 'a3e6cd02ecb410fd99923489f76f65de', NULL),
(165, 'bola.blood@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$SPi8MWPXHyKseCNfm4ANu.3M0UqfVNhs4t0MG7Fg62p629/r3bWze', 'Джумабаева', 'Болдукыз', 'Толгонбаевна', 'гематолог', 'ФГБУ НМИЦ Гематология', 'ведущий научный сотрудник', '8(926)271 92 82', 'РФ', 'Москва', 1, '52c38f25a77a3b88c51f3d45269ce5cd', NULL),
(166, 'doctorKLI@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$y985yYVtAnpS5X0MkWNvFA$yzCIDhaznS5EnDDQACYkk51XRY/UnYqcNPkjS1yl6nU', 'Крылова', 'Людмила', 'Ивановна', 'гематология', 'СПб ГБУЗ \"Городская больница №15', 'гематолог', '8 911 951 45 71', 'Россия', 'Санкт -Петербург', 0, '0dfa37b97c018098a18a6bec3d0edaf9', NULL),
(167, 'maria.plastinkina@takeda.com', '[\"ROLE_USER\"]', '$2y$13$NRABgr6WQgZ2Ri4yeK0sguhwDlBnyfer49CPJCbWAGh4Yj6/xeiqu', 'Пластинкина', 'Мария', 'Алексеевна', 'Онкология', 'Такеда', 'Менеджер', '89175021716', 'Россия', 'Москва', 1, '6ce7c397e453b0784f4b0a56330f6d18', NULL),
(168, 'abramova.alla84@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$hPAdDty9fGJjUblAq2yO0w$X/RzHjnhwVpeF1Su1zScqvpXHbUuXMFjVY3KEB4AepA', 'Полякова', 'Ольга', 'Львовна', 'терапевт', 'ГБУ Таганский', 'врач терапевт', '+79150560212', 'Россия', 'Москва', 0, 'ea8f699d309b81fb5b22bf43afd3c2fb', 1),
(169, 'i.snezhko@mail.ru', '[\"ROLE_USER\"]', '$2y$13$YNixWKpa0803zd/xLWIgoOUo8xHJE4OtZgzDdvQbydyxnrcpoJwuy', 'Снежко', 'Ирина', 'Викторовна', 'гематолог', 'Ростовский государственный медицинский университет', 'доцент кафедры гематологии и трансфузиологии', '8-928-605-9661', 'Россия', 'Ростов-на-Дону', 1, 'f26863fe9d344af0a20c6d2e7a8c0f89', NULL),
(170, 'lolman_333@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Rc+aUf4wd964Qi5Bhazjew$0QhGGYS4KF8Dz5iJ6uzYjZQFAtkEjJTvNCWujL5JKms', 'Кулагина', 'Людмила', 'Николаевна', 'Терапевт', 'КДЦ \"Измайловский\"', 'Врач', '89169532702', 'Россия', 'Москва', 0, 'd11613ad13b3ca9b18e48560b03f58ba', 1),
(171, 'annanovikova11@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fmQjbetWqShNI/K+aouR6A$2JztJ4ct9vy/77OpIWDXI5Q74O6ZP7uxjzz3y6/eJbY', 'Новикова', 'Анна', 'Александровна', 'Гематология', 'ФГБУ «НМИЦ гематологии» Минздрава России', 'Врач', '9168731572', 'Россия', 'Москва', 1, '6b70e98445159114d806d1be01de0a20', NULL),
(172, 'rosinternet@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zyWwj50Z2AsbWUo52vY6Dw$SI3vO07PLnphwEbUqKBChxjL+WIC3hnSQm//kLFgdxA', 'Наседкин', 'Виталий', 'Николаевич', 'Онкология', 'Эндокринологический Центр', 'Сотрудник', '8-910-4502779', 'Россия', 'Москва', 0, 'c37737c93913057cea8c56ef04c7a95b', NULL),
(173, 'lunina.su@gmail.com', '[\"ROLE_USER\"]', '$2y$13$tGgb8SKxZ9UQttz576vDQ.5S2kU/srhUYZieZ8EyDN1/aJwIBAeXW', 'Лунина', 'Светлана', 'Юрьевна', 'Онкология', 'ЦГКБ г.Реутов', 'Врач', '9163168107', 'Россия', 'Москва', 1, '1b7703f9b58d69f74bc78824d17b4655', NULL),
(174, 'eilushkina@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$5t0IXF4q4ZF4fODB79zN8.9EpfetN012PXGlarRVOqzBoKLQirX4y', 'Илюшкина', 'Елена', 'Юрьевна', 'Гематология', 'СПбГБУЗ «Городская больница 15»', 'Врач-гематолог', '89219493120', 'Россия', 'Санкт-Петербург', 1, '7ea0cbe24bb15f99a651053d5f818ce0', NULL),
(175, 'sofya.maksimenko.23@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$USLda87IiKJC7jl9fMcvnQ$LcXJxUayaS1uNw5EK+S5kvaPFCOQpVCghXcQVRdCRVE', 'Максименко', 'Софья', 'Дмитриевна', 'Патологическая анатомия', 'ГБУЗ КОД №1', 'Врач-патологоанатом', '+7-996-405-51-37', 'Россия', 'Краснодар', 1, '43b74e53a2e52c73699c3f84eaa3b008', NULL),
(176, 'lyubov_kovalenko88@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$SNKMukKT4tPRSx4EIfQ1iw$oR0eVGbC0sk+C41Uzy/WGYprgWFxQ4Yw52OXFiRAWzs', 'Коваленко', 'Любовь', 'Александровна', 'Гематолог', 'КГЬУЗ Краевая клиническая больница', 'врач-гематолог', '8-909-507-82-84', 'Россия', 'Барнаул', 0, '42129ae50a73ef6b804dcacb270016f8', NULL),
(177, 'sp888.81@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$bE5IMtF3mb/1VFoZ8vU37w$hqGf8ZsQo0YFHi5x1XiUPGDAsy8HuJSUv7jIriU20Dg', 'Полетаева', 'Светлана', 'Владимировна', 'Патологическая анатомия', 'ГБУЗ СОДКБ', 'Зав. ПАО', '89397523111', 'Россия', 'Самара', 0, '10cda8c46473b7a744d31427a6e774cc', NULL),
(178, 'kuvshinovmd@gmail.com', '[\"ROLE_USER\"]', '$2y$13$UwCSH3VOQ07I8t8G61wAdepUI/ttPK9BOqHUMSzkkyDniIaPdXk8C', 'Кувшинов', 'Алексей', 'Юрьевич', 'гематология', 'ФГБУ РосНИИГТ ФМБА России', 'главный врач', '88122745715', 'Россия', 'Санкт-Петербург', 1, '541865f6cdee018ae5199a27bd62d703', NULL),
(179, 'Sychevskaya-KA@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dBTnan9gGpaE37bkQsUQtQ$Nm3h0THrE/Mk4QkiWyx1/qZtu4rGjrLDzxxTO8LzCIc', 'Сычевская', 'Ксения', 'Андреевна', 'гематолог', 'ФГБУ НМИЦ гематологии МЗ РФ', 'врач', '89104097944', 'Россия', 'Москва', 1, '92f831ee691cd8ffbbed4789712b3bdd', NULL),
(180, 'vitaliydubov1996@me.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$nXRRctbpg+lnwVcojrkYSg$ACgQM+T8oxiz4/Cqiap14VyYwtEzgnAgwqWCdK0Q6N8', 'Дубов', 'Виталий', 'Сергеевич', 'Гематология', 'ККБ#2', 'Гематолог', '89243321996', 'Россия', 'Владивосток', 0, '75b8ec2e109886e6acda03274b6476f3', NULL),
(181, 'lidiya_y@list.ru', '[\"ROLE_USER\"]', '$2y$13$zb9/v/ZmUt/ANQjU8/F4JeXJhvwLeh2F6Bw8eO0SG4k5qlegUkcWe', 'Яковлева', 'Лидия', 'Анатольевна', 'Гематология', 'Военно-медицинская академия им. С.М. Кирова', 'Гематолог', '89117080861', 'Россия', 'Санкт-Петербург', 1, '6d031478b3f8478f700ab10f9826c1a6', NULL),
(182, 'povpe@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$28Ba9IbSnz2GSrOhkx0Nm.ZPNPhmjCQVz6QPdqtIoyeeB0/QNwRbu', 'Повилайтите', 'Патриция', 'Едмундовна', 'патологическая анатомия', 'ГБУ РО ПАБ', 'зав отделением', '+79185549835', 'Россия', 'Rostov-on-Don', 1, 'b256bad14067b5eb116e4a96ffefada1', NULL),
(183, 'o_morozova2305@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$0/xkMDWvD0gX9jY5UMrBRQ$2a0aGzWHUvWm0NeEAa8rgT76grP9nCexaI36OlPAnlU', 'Морозова', 'Оксана', 'Михайловна', 'гематология', 'МНПЦ Х,Т и Г', 'врач', '+375296492264', 'Республика Беларусь', 'Минск', 1, 'ba2bbed4b38c688ec95d12294bf762cb', NULL),
(184, 'doctorsokolova@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ckm0qaf2MfrknYeIL6YwTA$3LRRMsGmGjbrKVUgEcMfcFF0BObEw+132ZJUiUtg3Ec', 'Соколова', 'Елена', 'Константиновна', 'онкогематолог', 'ФГБУ ГНЦ ФМБЦ им.А.И.Бурназяна', 'врач', '89165984966', 'россия', 'москва', 0, '1cd14f3b6e5ae99de73124ed8078b6b0', NULL),
(185, 'maminat@mail.ru', '[\"ROLE_USER\"]', '$2y$13$E82/.WKtTDKVTyMy1dWM9.66oOMh2GT4HP9tj1pb4wNhiEhFgViT2', 'Магомедова', 'Аминат', 'Умарасхабовна', 'гематолог', 'ФГБУ НМИЦ гематологии Минздрава России', 'ведущий научный сотрудник', '8-926-218-25-84', 'Россия', 'Москва', 1, 'fde0e5951188e8acff35b80150d6ea33', NULL),
(186, 'celousova.kirov@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ECT3XH7NJFUEFSCSQgUP3A$vSCRcZnWDam1LKprknSqh+nhmcnnHiiyPoy/J/HBPWs', 'Целоусова', 'Ольга', 'Михайловна', 'гематология и химиотерапия', 'ФГБУН КНИИГиПК ФМБА России', 'завю детским отд. гематологии и химиотерапии', '89229026752', 'Россия', 'Киров', 0, '6455e1dad46bebfd9c066127c58f9f6e', NULL),
(187, 'stuklovn@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$LtEyE0G0prvcT7mPSx2ctg$Op0LNcrI9zTsCag/VoZ5ODRNKGZTaMlIy2S1ATS//Ng', 'Стуклов', 'Николай', 'Игоревич', 'Гематолог', 'РУДН', 'Профессор', '+79168119551', 'Россия', 'Москва', 0, 'bab11c80a206610f25046dd6b2eccba4', NULL),
(188, 'prettyfairy19@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$ewDW71kon1rJ4AznHha/Mez8SE.rbZJLgw2qNDnvLKcj0fhXL1l3K', 'Саманева', 'Наталья', 'Юрьевна', 'онколог', 'ФГБУ \"НМИЦ онкологии\"', 'врач-онколог', '89061850625', 'Россия', 'Ростов-на-Дону', 1, '4d7e15364a6f746f268a522e21e0ff0d', NULL),
(189, 'yana.chernyakova@mail.ru', '[\"ROLE_USER\"]', '$2y$13$I1V9Q3.gZvdvWrcOCos.seItHX5oFqUCEskZbwi8K2JMl/l16rFB2', 'Чернякова', 'Яна', 'Юрьевна', 'Гематология', 'ГУЗ ТО ТОКБ КДЦ', 'Врач-гематолог', '89531823287', 'РФ', 'Тула', 1, '9bc6d01dda4fdd5b5adcdc968111744b', NULL),
(190, 'Ishmatova@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$BDVMoHch+Od6ibk0AmCEYw$yjT77FHOsFzkli/ba2hpgIhKuim1bdz9/Q51MNxLORI', 'Ишматова', 'Ирина', 'Валерьевна', 'Гематолог', 'НМИЦ Онкологии им Н. Н. Петрова', 'Врач отделения гематологии и трансплантации костного мозга', '89219836574', 'Россия', 'Санкт-Петербург', 0, 'b396a646207f264441770ce89c668edd', NULL),
(191, 'farmaimpeks@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$TGdX7f6FoFizEmVNxzjtwQ$rMB4JsOCRNj7g1em4Rd00aUuP+j/MfRzlm8hzWRJN8U', 'Воронцов', 'Сергей', 'Анатольевич', 'Лимфолог', 'Подольская городская клиническая больница', 'Врач', '89266267912', 'РФ', 'Подольск', 0, '330a7a610cb8746db367e55e247d541f', NULL),
(192, 'zhanna_davydova@bk.ru', '[\"ROLE_USER\"]', '$2y$13$DFcfUJbJtOXB8pWj2EVjBO7KimZwuGybsLHjHw8ZVlwFNQ.GuAexm', 'Давыдова', 'Жанна', 'Александровна', 'врач -гематолог', 'г. Калининград,ООО \"Первый Мед\"', 'начмед', '8-915-642-76-89', 'РФ', 'г. Калининград', 1, 'd6b1e8caf9eace8f920cb92f8f829b50', NULL),
(193, 'imkorablina@mail.ru', '[\"ROLE_USER\"]', '$2y$13$Nyu9pWjqpnLKpJMUctudQO7jaGYoAraHwyCgrDoZ6dnFBCNdoES16', 'Кораблина', 'Инна', 'Михайловна', 'патологоанатом', 'Национальный центр клинической морфологической диагностики', 'врач', '+79219798853', 'Россия', 'Санкт-Петербург', 1, '6ed41a9cc8a926eae320ebf5803b5a28', NULL),
(194, 'mbagova89@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MfpCaexqogWy3t6s0ldVqg$jQvuhEBTTrEfGhoQ7cXywcYdq6NrsQhu+a29ddVaEKo', 'Багова', 'Мадина', 'Олеговна', 'Врач', 'ФГБУ «НМИЦ  гематологии» МЗ РФ', 'Гематолог', '89389134383', 'Россия', 'Москва', 1, 'bf3f079bde9bc4d79ce91f58e2ab81db', NULL),
(195, 'ekaterina.orlova.1993@list.ru', '[\"ROLE_USER\"]', '$2y$13$nwd/unfNQgYq26ZqAkkhEehy6x0LLwIv3k70vR2vm3KJForIKFL.O', 'Орлова', 'Екатерина', 'Филипповна', 'Гематолог', 'НМИЦ Блохина', 'Врач', '89299291031', 'Россия', 'Москва', 0, 'f4f37b04ffbee3d086760180409b41d2', NULL),
(196, 'ytytxtxtr@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$gQirYmMSUSOYuh2WwkAOfg$SmaCP5/MCxPgtvG4IWEeDxTLlxTEurcWv/1DUSnjt9U', 'Уваров', 'Аркадий', 'Германович', 'онкология', 'ГБУЗ', 'ГБУЗ МО Подольская ОКБ', '8-926-120-15-37', 'Россия', 'Подольск', 0, '7fa961c85c11081d309490ce23e0a54a', NULL),
(197, 'shira_n@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ylvwvdcm4RQtYOh0A6ZVwg$loNH9VUbLY62dlJkkXfyGkEVzXQPMZx9mC3AgXlPqAQ', 'Широнина', 'Наталья', 'Леонидовна', 'онкология', 'АО Фармстандарт', 'медицинский менеджер', '89117155906', 'Россия', 'Москва', 0, 'db327b709913aa46b76a0ae32cae58c1', NULL),
(198, 'grakhimova@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Q3bluLkTIjCPukH14yLluw$CSG0J64QkNw9OjXeshup+4tp2PaCySiXg/szcIdxpNw', 'Рахимова', 'Гузель', 'Рависовна', 'Трансфузиолог', 'ГБУЗ ГКБ 52 ДЗМ', 'Врач', '89262143495', 'Россия', 'Москва', 0, 'f6eef5eba96d5166147661f52b548cb9', NULL),
(199, 'grakhimova2017@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$MjyIFf55.oiaFbp1ua6vSecCNpjhfC9MFi9isErJVN7NfA5bEJSlq', 'Рахимова', 'Гузель', 'Рависовна', 'Трансфузиолог', 'ГБУЗ ГКБ 52 ДЗМ', 'Врач', '89262143495', 'Россия', 'Москва', 1, 'd34a1006b50a54def42c325a33b7d240', NULL),
(200, 'orion52@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$NxGvl5LAPzAdez+oEibk7A$dw/3Xka0kRlLo7nF8ZVptepsLf6/iXXrVUaMZ/fsjjk', 'Иванюк', 'Александр', 'Валерьевич', 'Гематология', 'ФГБУ «НМИЦ онкологии им. Н.Н. Петрова» Минздрава России', 'Врач-гематолог', '+79119669083', 'Российская Федерация', 'Санкт-Петербург', 0, '1d3c26d1ea9c277f1db53777f8bb6e5b', NULL),
(201, 'mnzchel@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$S8REu4PyUpfIwaElCXyjRO06rJA1t0vC4jvQTfk4jbjpAy6RjsEr2', 'Захарова', 'Марина', 'Николаевна', 'гематология', 'Челябинсмкая областная клиническая больница', 'врач', '+79080812665', 'Россия', 'Челябинск', 1, 'ba572dd6fac6b81a90994eba32e0e09c', NULL),
(202, 'yulia.guseva@roche.com', '[\"ROLE_USER\"]', '$2y$13$dnoCTOyHrlHSOkc6/L.yC.xJHAOTkLpO3WTsjs6/oDLUC4I1CUY2C', 'Гусева', 'Юлия', 'Константиновна', 'гематология', 'Roche', 'сотрудник компаниии', '+79660165250', 'Россия', 'Москва', 1, 'fbaed996b045c56418517a04518ac238', NULL),
(203, 'anashcherbak@gmail.con', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6lOw0Z7vehKQbZhU3WVKJQ$Yh0A2sKYbzkUGCdi8vvPGxTN8gXQEkUlLzH0fqBJ8n8', 'Щербак', 'Анна', 'Леонидовна', 'Онкология', NULL, NULL, '+79855158753', 'РФ', 'Москва', 0, 'e05a00a3ee3029ecbfad51d91cf29174', NULL),
(204, 'rosa07@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$d4Pg3ICL6JuI36v2afl57Q$UCeNzWTezgpVlKni9+S6AniH7jxQJup90osuLjMS4ZU', 'Карягина', 'Елена', 'Викторовна', 'Гематолог', 'Больница 15', 'Зав. отд. онкогематологии', '+79119375524', 'Россия', 'Санкт- Петербург', 1, '30ce6bf9df1ff1da7bc4eddcef123685', NULL),
(205, 'irmax69@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zg9JzlIsF7fq4QCPmoqXRA$O/RaFwz0ov1nWFnu+28rJ/OTSuJ8r6Htm7KX6XI49eI', 'Максименко', 'Ирина', 'Викторовна', 'Гемаиология', 'БМУ \"КОКБ\"', 'Врвч гематолог', '89065759192', 'Россия', 'Курск', 1, '50806af97b9aaf40dec163b26fe086f5', NULL),
(206, 'sergx1@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$BYrtt6p6Uem7lF7RCs.ymuUQDJB7par2D9eCRvkGoQ6nvg5wDxl7q', 'Криницына', 'Екатерина', 'Евгеньевна', 'гематология', 'ФГБУН\"КНИИГиПК\"ФМБА России', 'врач', '89127162357', 'Российская Федерация', 'Киров', 1, '6557f23a7bf88139257c8623d2c86e56', NULL),
(207, 'ovh72@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$IAz3goY0wDPpLYTRLCBLog$u9X/LWVOvi5tFnrV0nfssC/koZW1sjr8IAv8FaZ9x4M', 'Хороших', 'Оксана', 'Владимировна', 'клиническая лабораторная диагностика', 'ГБУЗ \"Иркутская ордена \"Знак Почета\" областная клиническая больница\"', 'врач', '+79643576633', 'Россия', 'Иркутск', 1, '08c999bdc050dfe91c81cfe794d47083', NULL),
(208, 'otmorsckaya@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$zPPa6LhiRqpHshAdMjYfJumtJZdL84Wr/miJbKnUM22qtkY5ibMoS', 'Отморская', 'Анна', 'Александровна', 'Гематолог', 'КГБУЗ ККБ', 'Гематолог', '+79132134574', 'Россия', 'Барнаул', 1, '7c51d5be54fc1aad62da3af202c962f4', NULL),
(209, 'kaplina.a@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$evFV5KlnTR9L+zY4gY584Q$cbWh6fKqMoRueGP73120ZCpGr9nYg8I1kasbqKKRJZA', 'Каплина', 'Анна', 'Анатольевна', 'Гематолог', 'ГБУ РО РОКБ', 'Врач гематолог', '79198797030', 'Россия', 'Ростов на Дону', 1, 'ace5b526879322b21a0fe0e0c4f40649', NULL),
(210, 'danilyk125@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$DIgy2xUtePk0wnhvMgLfGg$vkXgxLje+XVxk2+OqIoeQzqb8zkZ5cErFdfvl4tumyQ', 'Данилюк', 'Наталья', 'Александровна', 'Гематолог', 'ГБУЗ ОБЛАСТНОЙ онкологический диспансер г.Пенза', 'Заведующая детским отделением', '+79631002356', 'Россия', 'Пенза', 1, '8322354a6bba388b4393ceaf27b9d3df', NULL),
(211, 'orlovamed@gmail.com', '[\"ROLE_USER\"]', '$2y$13$HUUFR31xRjgorXogRktqIebqAUKCdijSgLhuN0aVru4hRJbwmAwFe', 'Орлова', 'Мария', 'Алексеевна', 'Маркетинг', 'АстраЗенека', 'Маркетинг', '123', 'Россия', 'Москва', 0, 'd79f7c12ea3b4aee6993047d0d2dae91', NULL),
(212, 'maria.popescu@usmf.md', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oaDYFzoUbCA+p3uD/2du1Q$kTfvFlzcPqMLdAm2Yn8ZtTsYJlpWrXl5E+3JMyY2zRU', 'Popescu', 'Maria', 'Gheorghievna', 'hematolpgie', 'USMF  N. Testemitanu', 'asistent universitar', '+37379485162', 'Moldova', 'Chisinau', 0, 'e723e842f9ea20986b8f862ed05be5fa', NULL);
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `surname`, `name`, `patronymic`, `specialization`, `job`, `position`, `phone`, `country`, `city`, `is_verified`, `secret`, `is_attend`) VALUES
(213, 'mdtmor@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$C0E22h3TS//ewh8cAosvWg$877BVEfpcgj/quh17y21RORGPs03kv9AvSvsvGcHjFo', 'Толстых', 'Татьяна', 'Викторовна', 'Гематология', 'ГКБ им. В.В.Вересаева ДЗМ', 'Гематолог', '9031567823', 'Россия', 'Москва', 1, '254cc2e83f1069752ad38316394a9aa9', NULL),
(214, 'sorkinaom@mail.ru', '[\"ROLE_USER\"]', '$2y$13$x.cToDjg3s0NX72.ReejwO4oZiepufrJJA1VaT.O2Dfx1Ti0ENueu', 'Соркина', 'Ольга', 'Марковна', 'Гематология', 'НМИЦ гематологии', 'Врач', '+79055344687', 'РФ', 'Москва', 1, 'f52d6be220d2aa8f581f608c4905ae09', NULL),
(215, 'olga.alikova@takeda.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$iLhrT+RjoTSFtCQklVBoLA$chC6xsG0RHmceup9wkh4gzoSDrfSi4HLS2GcnRWjvCA', 'Аликова', 'Ольга', 'Александровна', 'гематология', 'Такеда Фармасьютикалс', 'медицинский советник', '+79151908328', 'Россия', 'Москва', 1, '05faa556d749f675770c6101c73a9acf', 1),
(216, 'superfunk-91@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qo8ix7eDcUM/UpEMkmdSzA$Q9zeJW/slI+HReXfjcmhCVSQ4W1WcmgGBDuq+jqsrmY', 'фалеева', 'ирина', 'викторовна', 'акушерство', 'временно не работает', 'временно не работает', '89852905808', 'россия', 'москва', 1, '29bd44f47894ae7a8da282c135a28556', 1),
(217, 'Liubov.Dmitrieva@roche.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$5aRLds0tAMtZKv1BRlbCHw$DCSavKHA0YIHnrKtbT9LKjS4Iy6iq690/xS6z9he09A', 'Дмитриева', 'Любовь', 'Дмитриевна', 'Гематология', 'Рош-Москвв', 'КАМ', '89111014230', 'РФ', 'СПб', 1, '259abe520bbf8d6d2e3a688f254a7b3a', NULL),
(218, 'lisa2324@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$0aBR9ayapc0oRkKZlG5njOeAOH3ZYdsTOtZm30W1661XaNMEJvmSu', 'Мухарлямова', 'Лейсан', 'Фаритовна', 'Онкология', 'Ркод', 'Онколог', '89393302905', 'Россия', 'Казань', 0, 'f146abd2c66e516ba34a2fc09e5fbd17', NULL),
(219, 'novikova_d@hotmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$bdi8U1Me0GOkFrBRmgdhFg$Pk9jANZ3f1fIy4xeB3ybHo9LVDba+juZgWOg04TxsLQ', 'Новикова', 'Дарья', 'Владимировна', 'Гематология', 'ФГБУ НМИЦ гематологии', 'Врач гематолог', '89266669694', 'Россия', 'Москва', 0, '5e575576f1d7c494a6b99292a6918990', NULL),
(220, 'yulprotopopova@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$96TLcc+M+YGHjKndev4aoA$0tnEEbQ8Y2Lbf1jb4XBJ1onP3W88ZCRKhKZ3K2t8/ho', 'Протопопова', 'Юлия', 'Васильевна', 'Гематолог', 'Первый МГМУ им. Сеченова', 'Ординатор', '89081462819', 'Россия', 'Москва', 0, '4664acab4b7c9bfc85118c0f3cfc3366', NULL),
(221, 'xava1970@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UfPeud92UqtWkfbrBuV0yg$HSLBZ2xAQCsvfPzqQQBvkocgGGosKXrMOQojDVKfj+U', 'Богдалова', 'Хавва', 'Ислямовна', 'Гематология', 'ГБУЗ ООД', 'Врач гематолог', '89379137234', 'Россия', 'Пенза', 0, 'c04162df0add5ba642137862d00553fa', NULL),
(222, 'elenavolidicheva@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ztwxo2y39LjWBnVDTP44LA$ZGI1fwE/+ME88vfWlaoIdosG0CJfPSW2N1TCVa1qb3Q', 'Володичева', 'Елена', 'Михайловна', 'Гематология', 'ГУЗ то Тульская ОКБ', 'Заведующий отделением', '89109497702', 'Россия', 'Тула', 0, '17897867aa8df66aa2793a922690de2e', NULL),
(223, 'natalia_kulichkina@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6QmTn40lzNtWpIh43a444A$1vYR+5WCEk/wW8v+0hdLey5fUqUM/9fcCfsR4D8xZjs', 'Цаплина', 'Наталия', 'Сергеевна', 'Детская онкология', 'Нмиц онтологии им. Н.Н.Блохина', 'Врач', '9261732927', 'Россия', 'Москва', 1, 'a69f2b03578ea88d8800ccad179c048f', NULL),
(224, 'elenohka201@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$mEtx74OFojuO6dwTj2ROeQ$ROf0WGGjSeaefOijzhzQjajj3WeQR+8UlYyulhUf8B0', 'Дмитриева', 'Елена', 'Александровна', 'Гематология', 'ГКБ им.СПБоткина', 'Врач', '89263980734', 'Российская федерация', 'Москва', 1, '00cfcbc5d4ad4f8545f3888c06a3cec0', NULL),
(225, 'sashevir@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$mPy7gXA5nHfrn6Qd9PZoPw$kUaTMH46B5BMDFnlqX509MQngVXhCiwmV59V/8voXg8', 'Вашура', 'Владимир', 'Игоревич', 'Гематология', 'БУЗ ВО ВОКОБ', 'врач гематолог', '89038632560', 'Россия', 'Воронеж', 0, '26ed09549a6b2e30411431acaa2b0295', NULL),
(226, 'ales.khv@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uGQCdTfwlktKW8uKyLlDOg$lpIprI6rIypRCN3xvb367HEFDvkddyCd6YzEbwqTtIA', 'Шевченко', 'Александра', 'Михайловна', 'гематология, кардиология, терапия', 'ФЦ ССХ', 'кардиолог', '89145446222', 'РФ', 'Хабаровск', 0, '561e65bc1a5daca086512459438d0544', NULL),
(227, 'kan.green@mail.ru', '[\"ROLE_USER\"]', '$2y$13$7NM.TM9julGp5C2J104NCu1P9X/zfWoNrs..EXFsjnC1h5NUmrSqi', 'Кан', 'Ольга', 'Евгеньевна', 'Гематология', 'Джонсон и Джонсон', 'Ркуоводитель по стратегическому развитию по направлению Гематология', '89854133255', 'Россия', 'Москва', 1, 'bab0486a1abe3e1f4692273ffefa2166', NULL),
(228, 'anashcherbak@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6LAY4fmzrmrtSK7defF7cg$M0KyYrzLjS6/flgxxowBsrlh0q3erWyVENWjjV28tS8', 'Щербак', 'Анна', 'Леонидовна', 'онкология', 'НМХЦ им. Н.И. Пирогова', 'ординатор', '+79855158753', 'РФ', 'Москва', 1, 'f09404985557c7f24145ef9d291fc749', NULL),
(229, 'nz-2212@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6Vf5OJF4djnACxSbjr1Vww$ndoMkAbk7F3KKbZCS61kM/ZEzsfR0MRPsRM6zKeaIw4', 'Трипутень', 'Наталия', 'Захаровна', 'Гематология', 'ГКБ им.В.В.Вересаева', 'Врач', '89652120763', 'Россия', 'Москва', 1, 'cb4334c9090506b533c218480e277947', 1),
(230, 'vesnushka211@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$W9PsvCIyR7nSrJBNoTfnRA$O7Xv4nB9So5rGET1/OhsvzZPnvg56xd7IEuaiiLCaO8', 'Митрюкова', 'Ирина', 'Аликовна', 'Гематология', 'ГАУЗ Городская больница 2', 'Врач гематолог', '89068514020', 'Россия', 'Магнитогорск', 1, '2a4bb39347215e67ca1e36a09b36b9f1', NULL),
(231, 'aygun61@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$x+/hdHR8AW7UVdadglNGGw$lF1OkUpP/3X8qOWE4/IwYvsbtgrShXh5mTFSWmgfbd8', 'Годжаева', 'Айгюн', 'Тофик кызы', 'Гематолог', 'Гкб им.В.В.Вересаева', 'Врач-гематолог', '89154953684', 'Россия', 'Москва', 1, 'f86a0b052da289a53bfa282c2d52f356', 1),
(232, 'nadya.nikolaeva.74@bk.ru', '[\"ROLE_USER\"]', '$2y$13$MidgggGelnVlzez9toiOKO4zWa5TvxskPiq8p5K.uxRfEJRlkPyrS', 'Николаева', 'Надежда', 'Владимировна', 'гематолог', 'ФГБУ \"НМИЦ онкологии\" МЗ РФ', 'врач гематолог', '+79185571544', 'Россия', 'Ростов-на-Дону', 0, '27dc24141d1206f877a0f28dd190b3f3', NULL),
(233, 'horinova82@gmail.com', '[\"ROLE_USER\"]', '$2y$13$TqeZSF87GPnhxkgnrKY0V.FIgHyDmBU0M6W5BRuBfjlkBn4.3Q6KW', 'Васильева', 'Ирина', 'Валерьевна', 'Гематология', 'ГБУЗ СО ЦГБ 7 Г. ЕКАТЕРИНБУРГА', 'Врач-гематолог', '+79030784990', 'Россия', 'Екатеринбург', 0, 'b1629be2653b7d336f7b55b416627c9f', NULL),
(234, 'dchaginskaya@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$9hCZI181aoexp8zEQq6Luw$INsww5e5IrX/Xwgkq79ukXomHyVLhrKoiUR6vO3DzvU', 'Чагинская', 'Дарья', 'Алексеевна', 'врач гематолог', 'СПБ ГБУЗГКБ 31', 'врач гематолог', '89112719022', 'Россия', 'Санкт Петербург', 1, '9bca81e3f710d96a444c04f58daf1b19', NULL),
(235, 'radohka@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$AFxrPaNA9zqVeygPnGi+Qg$0ROmdcTUPYiaAECaG8LtAgRHrwQcTd7ynXvkPiJTcfg', 'Морозова', 'Радмила', 'Витальевна', 'Патологическая анатомия', 'ГБУЗ ДККБ', 'заведующий отделением', '89883556853', 'Россиия', 'Краснодар', 1, '50a9021c4f935a941bea53cc054f5549', NULL),
(236, 'krissstina91@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JS2eUTE2/DkySlcUPuE9tg$8/vi5kJMsNcqBp462urVC/RRKFJZ7/aYu1HJ68Ga5H4', 'Шашкина', 'Кристина', 'Сергеевна', 'онкология', 'ФГБУ НМИЦ гематологии МЗ РФ', 'врач', '+7-963-962-9446', 'РФ', 'Москва', 1, 'd90debba01c2720db84e7479078ec71a', NULL),
(237, 'Gl0204@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$KeWI9EH9kpp7n2niQU7Tbg$zt1SfCC76TnnkVxEkTaFen+vsG9DOSHkMEtJDIN1Tz4', 'Глущенко', 'Светлана', 'Алексеевна', 'патанатомия', 'Томский НИМЦ', 'врач-патологоанатом', '89138122045', 'Россия', 'Томск', 0, 'e0b6daee65d68740271cafa241fdd691', NULL),
(238, 'annahem@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$faVGZRLWbjBBxE0uXlq3Lg$LCn5xceG3Ze6gUT/DNIkZ+UQiMiQxBVXSocZhKycQYg', 'Шипаева', 'Aннa', 'Леонидовна', 'гематология', 'ВОКОД', 'врач', '89053963752', 'Россия', 'Волгоград', 1, 'af06e96e005fa574328e1e3f61020978', NULL),
(239, 'ovodok777@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$1jGpaIVtr7KEgMiNZZnbYA$tZ+omCi4t9AhfLneBSe4ITP/FmJUCuXjA8XSLGhLqks', 'Оводок', 'Александр', 'Евгеньевич', 'Анестезиология-реаниматология', 'МНПЦ \"ХТиГ\"', 'Зав ОАР №3', '+375295093283', 'Беларусь', 'Минск', 1, '25ef78df9ca1640f04b1a7f9b80c3610', NULL),
(240, 'maxsolovej@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$VMwzFzDiz/FQsWq4h99yAg$XL6TDzddhenmxfKAD6DQU09uF548bWjRTsXVnKLVuM0', 'Соловьев', 'Максим', 'Валерьевич', 'Гематолог', 'ФГБУ \"НМИЦ гематологии\" Минздрава России', 'Врач гематолог', '89646427650', 'Россия', 'Москва', 0, 'd6c097182e06490064061e90aa3865a8', NULL),
(241, 'katjabs@mail.ru', '[\"ROLE_USER\"]', '$2y$13$YEwk8JCILZYx2sV1tqIivu.F2uhmTzile62ayg1P6gKtI2QncipoO', 'Бредун', 'Екатерина', 'Александровна', 'Гематология', 'Филиал №3 ГВКГ им. Н. Н. Бурденко', 'Врач-гематолог', '89859524602', 'Россия', 'Москва', 1, 'f0792a40536331aed3721ef40056fbcf', NULL),
(242, 'vasilievalina687@gmail.com', '[\"ROLE_USER\"]', '$2y$13$EKqHoclo9ri0unKVf99qCuzeUsMpB8s.N56cD0GKmeWTn.CMnAIJ6', 'Васильева', 'Алина', 'Александровна', 'Гематология', 'БМУ КОКБ', 'Врач-гематолог', '89038729388', 'Россия', 'Курск', 1, 'becafcfadb77b88e04ab8a7bf5b374b7', NULL),
(243, 'sheveleva10@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$mSXMWfxckNJ8HKtLYSo8rA$th4+lPU6QEIS+PjbkhSFR0+ik2K/fB8wUMO/06kzNeg', 'Охота', 'Валерия', 'Константиновна', 'Гематология', 'НМИЦ гематологии', 'Врач-гематолог', '89251287976', 'Россия', 'Москва', 1, 'dfba5ac7677c9fa49ac164309ab056d4', 1),
(244, 'ia.modenova@mail.ru', '[\"ROLE_USER\"]', '$2y$13$I7qM3I.4R3W.HNKfCHVcZ.pEQotEeUlm0ds9R5bYh7YcUD7czF05m', 'Моденова', 'Ирина', 'Андреевна', 'гематолог', 'БУЗ ВО ВОКБ№2', 'врач гематолог', '89005592124', 'Россия', 'Череповец', 1, '0265e45dad069c56be95721f760e8c1a', NULL),
(245, 'a.zotova@nanolek.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$IFnuw/UQI8LMkT3Wp6WMgA$Pxs/fdR5FzAdqyY4stpSCq9nKKFQruYs6LRYdKYE4Tc', 'Зотова', 'Анна', 'Вячеславовна', 'Онкогематология', 'Нанолек', 'специалист по медицинской информации', '8-915-349-06-59', 'РФ', 'Москва', 1, 'a00cb4baece376701edec06282d0de2c', 1),
(246, 'irina.gorgan@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$GOvUG4QdAWstDd+bKE78eQ$NgIXecTXPMstk9NwsJPcamAnenDiJqBc/eP+YXuQ2MY', 'Горган', 'Ирина', 'Владимировна', 'Онкология', 'ГБУЗ РМ \"РОД\"', 'врач-ординатор', '89510504561', 'Россия', 'Саранск', 1, '06b44216d80a979a28a55c291fcfd116', NULL),
(247, 'vikvr@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+S0/RNiUWCgTyc5xJwXwiA$Z5j2pyjteHoK69IUc+udjAva0elP9mqKElIPurFeyQg', 'Рябчикова', 'Виктория', 'Владимировна', 'онкология, гематология', 'СПбГБУЗ ГКБ №31', 'заведующая отделением', '+79219492192', 'Россия', 'Санкт-Петербург', 0, 'a12b2ed3ddd1fd5996757a88599d0385', 1),
(248, 'badika.alena@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fzbxIOZtHUPquDjI4IKUPQ$rV0EslTHVApTUgqdv1HzsamPU2+tsmVhPKHUwTOEqog', 'Матвеева', 'Елена', 'Ивановна', 'Гематолог', 'Тверь, ГБУЗ ОКП', 'Врач', '89190661419', 'Россия', 'Твкрь', 1, '5bbc4b2bddbb1fa75d842ae7079d6798', NULL),
(249, 'sv-glebova@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$yvH6aANxoDAsLCfLK2XzSu5Undb44n22U4pEj7L/3KPi5PBtVuy8q', 'Коржова', 'Светлана', 'Михайловна', 'Патологическая анатомия', 'ФГБУ НМИЦ Гематологии', 'Врач-патологоанатом', '89032659718', 'Россия', 'Москва', 1, '6300742662f2ff14b4f5b48c7faf8c37', NULL),
(250, 'zhguchka86@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WMifgxjR0MUZQXHHTY0ztg$f2hyWxIBHfaTz3Ip5jfFHVaersZ8gTjC5IMxohUAukk', 'Антюфеева', 'Ольга', 'Николаевна', 'Гематолог', 'ФГАОУ ВО Первый МГМУ им. И.М.Сеченова', 'Врач-гематолог гематологического отделения', '89031212091', 'Россия', 'Москва', 0, '2a00e29755ec3ec95274d2ca9e6302f7', NULL),
(251, 'kas_nast@nail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZjGrND9y1cYamw5jMCVPyQ$MsdO2iPu1OF/JlfNnr2NpjrnuP00GkyhUE8Yc6D2ny4', 'Кобызева', 'Ольга', 'Михайловна', 'КДЛ', 'ГКБ им.С.С.Юдина', 'Биолог', '89032466164', 'Россия', 'Москва', 0, '05f3c694ab6f84c686a61315f6247851', NULL),
(252, 'kas_nast@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+2W0cnMm1yOZLkPPA6t9HQ$EHulvN0fXQvQDH6kwGddqFgE/ZcjvdX1Gq0i3V5opbI', 'Кобызева', 'Анастасия', 'Александровна', 'КДЛ', 'ГКБ им.С.С.Юдина', 'Биолог', '89660976915', 'Россия', 'Москва', 0, '0d250786e00c28b7cc914af3e125760a', NULL),
(253, 'petrenkoandrei13@gmail.com', '[\"ROLE_USER\"]', '$2y$13$HlOR5MZEMtimgxECoPT9CO2d9l2Q36iuDqwa3QiJHxqVA0Ib/9LgC', 'Петренко', 'Андрей', 'Анатольевич', 'Гематология', 'ГБУЗ ГКБ им. С.П. Боткина ДЗМ', 'Врач-гематолог', '+79686935933', 'Россия', 'Москва', 1, 'cb35c47013f8667eb87600246f8a482e', NULL),
(254, 'dessimilis@mail.ru', '[\"ROLE_USER\"]', '$2y$13$QvaaDv.ipaGsqOgGFGm26e9Pc8IVUIdZn9NbAJ56Lx.L1DFkr8kZ2', 'Асубаева', 'Асель', 'Муратовна', 'гематолог', 'НИИ онкологии и радиологии', 'гематолог', '+77774073737', 'Казахстан', 'Алматы', 1, '60fb16ef3e112d5f32edafb3e3474ffb', NULL),
(255, 'aliamir@list.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$DrB3BYiZDAGs1kLP9+jMtA$/4N6xU4Ns2uzHySvLu4QU7H+VzMgtKfE59tnlJ9rBqs', 'Живописцева', 'Алия', 'Мирзаевна', 'гематология', 'ВМедА', 'старший преподаватель, гематолог', '89216303352', 'Россия', 'СПб', 1, '1415f3b5785d85963480049b04207474', NULL),
(256, 'lvg9@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$GXb2.Sr2WATZa9uykF.CPODtiwS.fDuEo1fwSEWv3YnGsNGWwEL.W', 'Гаврилова', 'Любовь', 'Владимировна', 'врач-гематолог', 'ГБУЗ РКБ №4 МЗ РМ', 'врач-гематолог', '8-905-378-85-65', 'Россия', 'Саранск', 1, '5c55d0dc2609031566c214831bd4173b', NULL),
(257, 'kochkareva_yulia@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ihf/T26zSk5oNVfbBmQBqg$7/2pwqFG8tcG2qzfxf2liWABSPyuCrf10nZv9+5P1BQ', 'кочкарева', 'юлия', 'борисовна', 'гематолог', 'ГБУЗ ГКБ им БОткина', 'врач- гематолог', '+79104690490', 'Россия', 'Москва', 0, 'bd6b574d9eb6f3bf19c702ad601aaf83', NULL),
(258, 'shuvaev77@mail.ru', '[\"ROLE_USER\"]', '$2y$13$OCjDvRk8NXq6sNTwnKxvKOSW21.vw5tXSwoicBN07mtVkWr3FrBDm', 'Шуваев', 'Василий', 'Анатольевич', 'гематолог', 'ГКБ им. В.В. Вересаева ДЗМ', 'Руководитель гематологического центра', '+79216365472', 'Россия', 'Москва', 1, '12f6f456994a9f2160ab2fbffea5249f', NULL),
(259, 'zstolypina@gmail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$4tm35GKD4UZM4GF8AU3yAg$DH/KSyTf3KVX0B3Q//YnKqgUoPonGNu1iOM/BH9JZio', 'Столыпина', 'Жанна', 'Леонидовна', 'онкогематология', 'С-ПбГБУЗ\"Городская больница №15\"', 'врач', '89119157876', 'Россия', 'Санкт-Петербург', 0, 'fd278e7991e891d219434c0469a6c54f', NULL),
(260, 'vera.podgornykh@astrazeneca.com', '[\"ROLE_USER\"]', '$2y$13$cyB86KyEcHmVg4QMghW/Lu/36uwaLV79toT6luoJXncIYZb63ZPLC', 'Подгорных', 'Вера', 'Евгеньевна', '-', 'АстраЗенека', '-', '+79625643753', 'Россия', 'Москва', 1, '593ea1921fcdc55db480fe5d8f86b846', NULL),
(261, 'baumert78@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+i6jnqyTnHep5t42rdZJlQ$Zt7ykHLfZy6GiuEvbKQysKlyslYsjhQ+GHS4ubCvpB8', 'Баумерт', 'Евгения', 'Владимировна', 'гематология', 'СПБГБУЗ ГБ №15', 'врач-гематолог', '+7(921)658-46-80', 'Российская Федерация', 'Санкт-Петербуург', 0, '26f8f382ff519891c4d9b3eda825f1fa', NULL),
(262, 'n_v_mironiva@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$iqCR91WEi9mDvPiP54usJg$fiSh7c1k2ogugPjqZUYvdSjeEHKpyW74lnaMTuTZq7c', 'Миронова', 'Наталья', 'Вячеславовна', 'Гематология', 'ГБУЗНО НОКБ им НА Семашко', 'Врач', '8910006856', 'РФ', 'Нижний Новгород', 0, 'cb800a81ad3dca1afb018a122f1ec428', NULL),
(263, 'm.dubnitskaya@mknc.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$OTcjgnbD5zyEvm0RsUG7Xg$/UvVYbMS/jSZj+d5RIOpynRxM3gwNeNaWBt8iyZkkrk', 'Дубницкая', 'Марина', 'Геннадиевна', 'Гематология', 'ГБУЗ МКНЦ им. А.С.Логинова ДЗМ г.Москва', 'Врач-гематолог', '89096458401', 'РФ', 'Москва', 0, '1c493d74fca6af61230fdce9b7f3a33c', 1),
(264, 'magrishu@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$A65LsI+3WTKlGJFQUYAqOQ$5Ske6QjIqzXImI2iYSQpbUkQnaXMcce38obnW7nHhv4', 'Гришунина', 'Мария', 'Евгеньевна', 'гематолог', 'ГБУЗ НО НОКБ им Н. А Семашко', 'врач', '+79519067146', 'Россия', 'Нижний Новгород', 1, '74876dcfa330db88e4339a6dc9895ade', NULL),
(265, 'a.s.platonov1985@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$5PM4Gseqe0iJkqa1nkkywQ$y1UbR64Xu1MxAjfSGjaUfOK5nhZ+YfvvaWyqNPlI1zU', 'Платонов', 'Александр', 'Сергеевич', 'Урология', 'ГКБ', 'Врач', '89057291651', 'Росси', 'Москва', 0, 'cc6e5689ece714b49cd2b1e20a92ebd7', NULL),
(266, 'arshanskaya.evgeniya@gmail.com', '[\"ROLE_USER\"]', '$2y$13$OLR8vnb8LF2Dte5m/oZ0I.lPYUkbbygIeX44IrFhcSGvyGYs0FsLe', 'Аршанская', 'Евгения', 'Григорьевна', 'Гематология', 'Гкб им.С.П.Боткина', 'Врач', '89035723559', 'Россия', 'Москва', 1, 'd6985ce6771f18c3c833cfa131a67b8a', NULL),
(267, 'angelique.r86@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qKVFHPRURup/3MwsAXFlQw$CAtcwGW86cNJSyJ1FPQp+CdhAIJJePrT25fFva7IItI', 'Рахмани', 'Анжелика', 'Фаридовна', 'гематология', 'ГКБ им. В.В. Вересаева', 'врач-гематолог', '89265355499', 'Россия', 'Москва', 1, '6b9e1ea7acdc55fb2935cff0af21bc64', NULL),
(268, 'darialysenko18@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Fe2DVjsvtAgWpgUbi+z5CQ$WzViCtlhbmaUsJ+JKgFLVnQleuqSOdV3FBfg0L88ZQA', 'Боряк', 'Дарья', 'Алексеевна', 'Гематология', 'ГКБ 52', 'Врач-гематолог', '89295804145', 'Россия', 'Москва', 0, 'a3b8e25eca9b424222fe674aed89d59b', NULL),
(269, 'sashagriffon@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uH4vFnxZTEpaCCzv1ClP4Q$DLywnid6ZJ7LZBo9Tc1x0fy/z+yed8kwcJDRZwcSDlo', 'Котельникова', 'Александра', 'Николаевна', 'Гематология', 'ФГБУ \"ГВКГ им. Н.Н.Бурденко\" МО РФ', 'Врач- гематолог', '89265341966', 'РФ', 'Москва', 0, 'b522c1796e07455f4d86499fd57e8c43', 1),
(270, 'k.kutcaya@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$CChSYzNIqju6umTTMsaY2w$RZi430oEC5mpIoBquevl91Ky34NkERFuFYQtkfOBRTY', 'Куцая', 'Кристина', 'Павловна', 'Гематология', 'Сгму укб #3', 'Гематолог', '89378101777', 'Россия', 'Саратов', 0, '3853fbc537c8d7763cb71a1605903f9e', NULL),
(271, 'artymaxxx@gmail.com', '[\"ROLE_USER\"]', '$2y$13$gaJrsur6Mo2oP/dNcmgVFeCPDVg83157bwM0Q4Y4Svw.lYBMTnoAe', 'Максимов', 'Артур', 'Юрьевич', 'Онкогематология', 'Нанолек', 'Медицинский научный советник', '89313663024', 'Россия', 'Санкт-Петербург', 1, '4244ae1ef79573de60b47cc877810325', 1),
(272, 'martynova-olga-s@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$5S6105PPMe8TKHUN0agI1g$ZjWvfoP0+CO/xzXgrb+4aXEQrZbNj/U1JuaHPGGp/kM', 'Мартынова', 'Ольга', 'Андреевна', 'Врач-патоморфолог', 'ООО \"ЮНИМ\"', 'Врач-патоморфолог', '+79516653912', 'Россия', 'Москва', 0, 'a9612953d1b43f064c5c9b2b7acf38af', NULL),
(273, 'mary.shkarina2015@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$jIeOIVH+6eOu1oBkNorgzQ$ipMUtCATrFgtPKAcRmRrxk4S61TaESXC17Ko2qDly8Y', 'Белкина', 'Мария', 'Алексеевна', 'Гематология', 'ГБУЗ НО НОКБ им Н.А.Семашко', 'Врач', '89108850980', 'Россия', 'Нижний Новгород', 1, '0625e2d215219d1ab590217b0f1b31e2', NULL),
(274, 'adian46@mail.ru', '[\"ROLE_USER\"]', '$2y$13$Ne4/4vsmXj7vlK1FnqK7FuwPOI0mNdwN4yt.9YN36NWCfZsvmBXS6', 'Ibragimov', 'Aydemir', 'Magomedsadirovich', 'Онкология', 'НМИЦ онкологии им Блохина', 'Аспирант', '+79651657864', 'РФ', 'Москва', 0, '0d1a719087ca889cb510390a5e2f125f', NULL),
(275, 'roksana_hidirova@mail.ru', '[\"ROLE_USER\"]', '$2y$13$q9Gm3A9cynB0PtXNtlhj3ePQ5gRucuUZrdEd6WJqs4vX6HrP868Ve', 'Павлова', 'Роксана', 'Кичибеговна', 'Гематология', 'БУЗ ВО «ВОКБ»', 'Гематолог', '89807088235', 'Россия', 'Вологда', 1, '9d1f69a4c85b400d017c46842034405d', NULL),
(276, 'yablokova.vera@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$8VsUn7BjpP4JXycNMJZGX.C9E7CVAlDEiTT0/4qKuKMKGnRA3Q9hC', 'Яблокова', 'Вера', 'Вениаминовна', 'гематолог', 'ЯГМУ', 'доцент кафедры онкологии', '+79038224274', 'Россия', 'Ярославль', 1, '0b2c11106d87cbd9ed0a4ec6eac7179a', NULL),
(277, 'olgakob75@gmail.com', '[\"ROLE_USER\"]', '$2y$13$89Xunc/uBvdjmC8rqW3lBe6F4oJZN5/HsmKFPhQcEsHLL3ZNU4bqC', 'Кобызева', 'Ольга', 'Михайловна', 'КДЛ', 'ГКБ им.С.С.Юдина', 'Биолог', '89660976915', 'Россия', 'Москва', 1, '904646f3d89b7bbb9422e5a97b82c96b', NULL),
(278, 'lynoliska@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$mPVH/IHNwHtmIGtggQ1ptg$F5/AS4sphveCqCr1v8iswBOKdcZLtKKllZ6Bm0H7FOc', 'Лисакова', 'Елена', 'Вячеславовна', 'Гематология', 'ФГБУ им. Бурназяна', 'Ординатор', '89015080694', 'Россия', 'Москва', 0, 'eec47ebdc62f254751738682a04c5f6d', 1),
(279, 'shabaevamar@mail.ru', '[\"ROLE_USER\"]', '$2y$13$w2Sf1rZjQnqoiegw.Guii.j8FQNsWoEDzZ/sk0FWuHxMBkSltOBF.', 'Шабаева', 'Марина', 'Михайловна', 'лекарственная терапия', 'ФГБОУ ВО \"АГМУ\"', 'Доцент кафедры онкологии и лучевой терапии', '89033211075', 'Россия', '414000, Астраханская обл, г Астрахань', 0, 'ff284b9a0ca43bc433f12b6ddf65a66e', NULL),
(280, 'svetlanashambievna001@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PhkzBY4q9tz5WunfJACzhw$nZcs4acbURTaJEvkkGfaG1QhnWSKDkn6OI5Wq8rah7k', 'Бабичева', 'Светлана', 'Шхамбиевна', 'Гематология', 'ГБУЗАРКОД', 'Заведующий гематологическим отделением', '89064387378', 'Россия', 'Майкоп', 1, 'da1bc75647a0aaca1f8969ac8bb83fb5', NULL),
(281, 'albinatokmak@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+D6IFe/uTv0zXIrb2hMHNA$BRHgUvWxhM82SZqn8yf1t17B2+9Lrx21Gt/ZJIBG49E', 'Токмакова', 'Альбина', 'Арсеновна', 'Гематология', 'МКНЦ', 'Врач-гематолог', '79286944840', 'Россия', 'Москва', 0, '19088616c3bd60df407f385d8622fd38', NULL),
(282, '9bogannisyan@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+MFHuRYRAE3zeWeacv0u7A$XnRAj+RKyjYS757VgLkzFr1CuqalzRjNjPw2ceq6vLM', 'Оганнисян', 'Арман', 'Андраникович', 'Гематолог', 'МКНЦ Логинова', 'Врач-ординатор', '89775407313', 'Россия', 'Москва', 1, '4313d3beca689ed07c44b9ecc0fe655a', NULL),
(283, 'olga/antonova.92@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fFd10ZiccHo0sQJAD0+m8w$nUvtsStxab4TZtyPUe4xwn3jCNfKV4qu5XA5fRJjjcE', 'Кргулова', 'Ольга', 'Дмитриевна', 'Другое', 'Коммерческая компания', 'Менеджер', '+79150824175', 'Россия', 'Москва', 0, '2beb57356acf3afeac8ff1f5d97c68fa', NULL),
(284, 'evgengluhanuk@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$/jlS5Yl66RgDCTsVHWfY8g$JcN2OiCVUMmnG6yYHHMenM6OQQbnCaomwgVRjN1nobE', 'Глуханюк', 'Евгений', 'Владимирович', 'гематология', 'ГКБ им Боткина', 'Слушатель программы профессиональной переподготовки', '89857296543', 'Россия', 'Москва', 1, '03b6d68571f11538cb9107867198d736', 1),
(285, 'bakhtina@rpharm.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$abfs3ZVMyRS9zfzDn0hyCQ$ASyEuM3glpKy873gP8i+ha7GUR6LJI7vQ4S9Nc8jSA4', 'Бахтина', 'Виктория', 'Николаевна', 'Фармацевтика', 'Р-Фарм', 'менеджер по маркетингу', '+79104016137', 'Россия', 'Москва', 1, '857cd429c095a2f65902d447f5e1b140', NULL),
(286, 'israel200ldu@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$CipX/jRIb4QGioyTB4kyBQ$jWd+nHwQFFWhEnVHPwNBMuF/IKULGKjcZW1bq3sWm1o', 'Де Ла  Крус', 'Израэль', 'Франсиско', 'Гематология', 'Мкнц', 'Ординатор', '+79774038984', 'Россия', 'Москва', 1, 'a11dc7a973c38d89a72d9570425dcdd0', 1),
(287, 'amylee103@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$CQdTJq9jel/qdH0k5YhGsg$Q2QufRBCUqRcowaRh9WjD70uUvjC2I6hc+sL8KeqPBU', 'Проценко', 'Марина', 'Сергеевна', 'Гематология', 'ГБ N4  г. Орска', 'Терапевт', '89011157229', 'Россия', 'Орск', 0, '4454a001de4e0b7a7ee412907b9edad1', NULL),
(288, 'vitalysokolinsky@gmail.com', '[\"ROLE_USER\"]', '$2y$13$hR4/UgH4tNUX8vwKBKonOuo.pJlAb0jjP0H2NMOukTLggYldhVyzu', 'Соколинский', 'Виталий', 'Геннадьевич', 'Фарминдустрия', 'BeiGene', 'Руководитель по России и странам СНГ', '+79169022615', 'Россия', 'Москва', 1, 'bebd18be61b1adcb317a707b1154d795', NULL),
(289, 'DiakonovDA@Rambler.ru', '[\"ROLE_USER\"]', '$2y$13$Ce3fvM7Xo7UGb6AWIxV2wulYmPubsHs8LfeKfVpX9B.cwAMKHIfS.', 'Дьяконов', 'Дмитрий', 'Андреевич', 'патологическая анатомия', 'ФГБУН КНИИГиПК ФМБА России', 'заведующий', '8-912-828-6483', 'РФ', 'Киров', 0, 'bdd44afe36e968c92d7d3ced818f0923', NULL),
(290, 'v.a.ros@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$/aOReulYivHQlHY4EplGzQ$djDNH34u8/QfZxyixEWyRk9r0Uh0dIM1MNxavKqH8vs', 'Росин', 'Виталий', 'Анатольевич', 'гематология, патоморфология', 'ФГБУН \"КНИИГиПК ФМБА России\"', 'старший научный сотрудник', '89536779540', 'Россия', 'Киров', 1, '222442fb0d3937cb63e9a58f4dfc3a65', NULL),
(291, 's.b.kapustina@me.com', '[\"ROLE_USER\"]', '$2y$13$uyXgmKE./Dsgcu1JdEWKa.TveQMcWwiin3MEVALxsaReNr84jHKhG', 'Капустина', 'Светлана', 'Борисовна', 'Онкология', 'Такеда Фармасьютикалс', 'Региональный Медицинский советник', '+79627107014', 'Россия', 'Санкт-Петербург', 1, '086c31245bfa6ba127cd2899884e3700', NULL),
(292, 'ytytxtxtr@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$ReJSpjc2QRkfDA1yTz/aO.CZvp.yy7Dn7vPgFF.Z9gfDc4e8RJbx.', 'Уваров', 'Аркадий', 'Германович', 'онкология', 'ГБУЗ МО Подольская ОКБ', 'врач-онколог', '89261201537', 'Россия', 'Подольск', 1, '2c7db17141caa812f2d7bc02070dfaab', NULL),
(293, 'tone.n@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$/hBwiI1s72xOD554oxqwaA$UFt4kpC89SeFtjIlglqhjbbaBGYLKaamiDiOlKrQe4Y', 'тонэ', 'наталия', 'викторовна', 'онкология', 'поликлиника', 'врач-онколог', '8 916 903 71 78', 'россия', 'москва', 0, 'b5e789ab14b16b33ff61733ffb93e6b3', NULL),
(295, 'edvard-78-ru@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$.ztFCVQQzrpXV0n544I.MehRjQbQ.hbbR4fRanFcYWVPyw35Dspqq', 'Биячуев', 'Эдвард', 'Русланович', 'Гематология', 'ГКБ им СПБоткина', 'Врач гематолог', '89175676337', 'Россия', 'Москва', 1, '35154f9841c8e781a602581cf1bd6710', NULL),
(297, 'natalyak@list.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PMZEGYS8sHphPkTZnCq2zA$fUUGNjH5bWeHnIYJGtJae14E+k2YY+mcbgs4W/sBA4k', 'Казанская', 'Наталья', 'Валериевна', 'Гематология', 'БУЗ ВО \"Воронежская областная клиническая больница 1\"', 'Врач- гематолог', '89601348346', 'Россия', 'Воронеж', 1, '6e80de4fda80710e74abc6a1193a86ea', NULL),
(299, 'zarina.lyagufova@mail.ru', '[\"ROLE_USER\"]', '$2y$13$5yu5dycis3WIJyauSl558.4EbBfMCxu1Rvl8jLVLMBE.hDNNCQ08i', 'Лягуфова', 'Зарина', 'Муратовна', 'Гематологии', 'ГБУЗ РАЗ АРКОД им М.Х.Ашхамафа', 'Врач гематолог', '89094709304', 'Россия', 'Майкоп', 1, 'a9b13dea9c6a917d1e6707f896652a0d', NULL),
(300, 'elena.osipova93@bk.ru', '[\"ROLE_USER\"]', '$2y$13$31lhxZGowYUsFr6vjjBU5urNQOJfqYmMlT1D3YWbCvIm5uJ9.gM1W', 'Осипова', 'Елена', 'Сергеевна', 'врач-гематолог', 'ФГБУН КНИИГ и ПК ФМБА России', 'врач', '89091397578', 'Россия', 'Киров', 1, 'f8776b225f2af9a50140e468a5f5dd7c', NULL),
(301, 'roman.shuleyko@takeda.com', '[\"ROLE_USER\"]', '$2y$13$Y4rl1hHdZyAH.G0oWatl5uIG3AxhEnjI6n4DhMFMGN3LG33pSJUCq', 'Шулейко', 'Роман', 'Глебович', 'Гематология', 'Такеда', 'Медицинский советник', '+79096209735', 'Россия', 'Москва', 1, '839f77c4b43b0d0b1e34c669bdd42824', NULL),
(302, 'dr.plastinina@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$L7oGYRsfKopw0M44lurYkeiRtQkkzG2LQHBcIgEfBZZnNHKpC99Pa', 'Пластинина', 'Любовь', 'Васильевна', 'Гематология', 'ФГБУ НМИЦ гематологии', 'Гематолог', '89252076149', 'Россия', 'Москва', 1, '39eac25b9af449a8995a462f36567f40', NULL),
(303, 'egorrabinovich1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$r4gRoca4nzL9wMe20FJJbuDGtCPJLC5KtRijY21XaRzSZJA.t7zAu', 'Поспелов', 'Егор', 'Андреевич', 'Онколог', 'ГБУЗ РК КРОКД им.В.М.Ефетова', 'врач онколог отделения гематологии', '+79788402396', 'Россия', 'Симферополь', 1, 'caf73fc1eaebee718a4097001bb89203', NULL),
(304, 'asalka2907@mail.ru', '[\"ROLE_USER\"]', '$2y$13$q9pQl7f1CVo2nNmzsLA4Vu9O4QkmAXet39s0eoDMbiU49j.7F860e', 'Меметова', 'Алиме', 'Айдеровна', 'онкология', 'ГБУЗРК КРОКД им. В. М. Ефетова', 'врач- онколог', '+79788229501', 'Россия', 'Симферополь', 1, '9f398f1f61f9c5ec849ab67ca6d99d59', NULL),
(305, 'igor.pritulyak@tspncology.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$x+cmdu1P9TgF9veU9XsUnA$bxSquPiL7LbQmXfE3LjZHtF5f+qa06IgEru0539m/tA', 'Притуляк', 'Игорь', 'Александрович', 'Компьютерные технологии', 'ТС Онколоджи', 'Суперспец', '80000000000', 'Россия', 'Москва', 0, '95a1ff2bf049e153ed31e0f74251e45e', 1),
(307, 'vdht.mnioi@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$16/APLdZfBbkp7zZwwRqEw$QGG4Zury3RE8WSAv66ZTMdQ5VFIeVbDE6n9bk0jt/Dg', 'Гущина', 'Елизавета', 'Евгеньевна', 'гематолог', 'МНИОИ имени П.А. Герцена', 'врач', '+74959451385', 'РФ', 'Москва', 0, '24b463ef8de43e35bba96ff1e78a8978', NULL),
(308, 'zarina.guagova@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$8ybM2xyGC4OhYr48nt95ow$F5nsRKKqVFFMnvwBAqfrFLPN2s4jO7PWv3xP7uOLbH0', 'Скончебасова', 'Зарина', 'Сальбиевна', 'Ординатор', 'Герцена', 'Гематолог', '89184281019', 'РФ', 'Москва', 1, '01f58c869e7910528cd48b7217c715b0', 1),
(309, 'polikarpovmd@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$nX5dOGj5BE3ylyXBnb3HjA$3W1gbTGFni2tzboK1XiRea0//dSDr0BNGEUZ5kNbBnM', 'Поликарпов', 'Александр', 'Димитриевич', 'Гематология', 'КНИИГИПК', 'Врач гематолог', '9123742466', 'Россия', 'Киров', 1, '0e8d3500c2ed5d3b20957103accd0118', NULL),
(310, 'nyuta.mikheeva.88@mail.ru', '[\"ROLE_USER\"]', '$2y$13$/rdN72JBuTKfwlVumnuRhekJMnNfVMqGDZhTkezp3CZm6TqR6zJLe', 'Гончарук', 'Анна', 'Александровна', 'Врач-гематолог', 'СПбГБУЗГБN15', 'Гематолог', '89117814436', 'Санкт-Петербург', 'Санкт-Петербург', 1, '55a8752eb8e08bba0fe5745abba90b9d', NULL),
(311, 'a.amosova@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zLGMyMQdHRqgdLeecWDKdA$nOY75BjMPwwhvfGH/1iWClZ59OuhD/7oL2bbvDoP+m4', 'Крайзман', 'Алина', 'Алексеевна', 'Гематология', 'ФГБУ НМИЦ Гематологии МЗ РФ', 'врач-гематолог', '9850989098', 'Россия', 'Москва', 1, 'e3c4fd3efcc0a614a15134e738a8202c', NULL),
(312, 'loginova.nasty86@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eNuI941cvAqdF5a0kZJ6cA$xWC7QTxfORulkfJwYXlzRdCgnr4KwZJlb9IDwz6hUW4', 'Логинова', 'Анастасия', 'Владимировна', 'Терапия', 'ООО \"МЕДГАРД ОРЕНБУРГ\"', 'Терапевт', '89225432452', 'Россия', 'Оренбург', 0, '91d04d4dab65bf39bade0a3fa10546d8', 1),
(313, 'gaytum@mail.ru', '[\"ROLE_USER\"]', '$2y$13$luqguOO2.j7BRX6OtuO00OF2.i/nf8x0yVFr/MnwmRwtQbSwcdGU2', 'Тумян', 'Гаяне', 'Сергеевна', 'онкология', 'ФГБУ НМИЦ онкологии им. Н.Н. Блохина', 'Зав. отделением химиотерапии гемобластозов', '89035964357', 'Россия', 'Moscow', 1, 'ccb2b7fe7d2a198d8f5fc4060133f1ad', NULL),
(314, 'ledibozz@list.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$llEjFWAlNoY31UFKmwTLpA$DOppMKj8/Kmht3KcI0GECNVpfCZsPKBlQy+L4l/XPtI', 'Любимова', 'Татьяна', 'Игоревна', 'Акушерство и гинекология', 'ФКУЗ «ГВКГ войск национальной гвардии России»', 'Старший врач акушер- гинеколог', '89031445497', 'Россия', 'Москва', 1, '388be593cd29fae1b8215a4c5778aea6', NULL),
(315, 'pokachalova_mv@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$rXeLAH0ujvJCsaj4RW8HHA$s36MgF5c2qN5H5oS1iTgLytJmpa7d5Rwk6US5cA2JLk', 'Чифранова', 'Мария', 'Викторовна', 'Онколог', 'НФГБУЗККОД', 'Врач', '+79039431738', 'Рф', 'Новокузнецк', 1, 'a7d14722f7b055c72e5b74e04fed7945', NULL),
(316, 'vedhaemo@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Aau27Bgzf0OjT9VCVJDtzg$CKQdb00pUUuhnSlLndtnnbsRJqCjzINSuRif4NTIBT0', 'Ведь', 'Вера', 'Владимировна', 'Морфология онко-гематология', 'Областная клинич. больница', 'Врач КДЛ', '89158268407', 'Россия', 'Иваново', 1, '7702ae99dad4cf96b20d4f9e47255185', NULL),
(317, 'freya2077@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$4d2XqLKEW5wGnaQer07cXw$+E0DcBlIBMJ7/RCYJSoZRmpVdtlVpFByL4c6nEoXwes', 'Садчикова', 'Галина', 'Дмитриевна', 'Гематологии', 'ОКБ', 'Врач', '9055003239', 'Россия', 'Владимир', 0, 'c05888fab2a64b73581a358d78404aeb', NULL),
(318, 'nkatargin@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$l7GG4l2pVoox+0HtDHpAbw$j4DBEXuSL0eC1tnbrOlOER7DnE6AhKKhPYTkp8p8mKU', 'Катаргин', 'Николай', 'Геннадьевич', 'Онколог', 'Фгкуз гвкг фсвнг', 'Врач онколог приёмного отделения', '+79055380564', 'Российская Федерация', 'Балашиха', 1, 'bcb30c6b8614cf55b2bdafdf96871b82', NULL),
(319, 'fazilatdr@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$myum0TA2QpmgwQ2XgBJP5g$Z2PQXuWOYlElSd390bLy1wQ+GDRBUFfbXFTt5rZGJKk', 'Камолова', 'Фазилатхон', 'Шарабиддиновна', 'Онкология', 'НМИЦ онкологии им Н.Н.Блохина', 'Аспирант', '792685222887', 'Россия', 'Москва', 1, 'e21992d919a5bff3508b54d90ac607ff', NULL),
(320, 'doctor8511@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$3qlrmhVpBHlI5aUy4BYwDQ$xUpvuz5LN2y3jX/oMSYk7Sh+JlPKNbsFJo0reo7hdro', 'Авксентюк', 'Алексей', 'Владимироович', 'Терапевт', 'Abbvie', 'MSL', '+79139878943', 'Russia', 'Novosibirsk', 1, '4e7151c1fe94438bc77ac67fb20eb9d5', NULL),
(321, 'diana.ibragimova.1997@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$EaMpdIMIK68vxg+yCgCIkA$AyBpxiwtskvi6LiPjsvrbGZLqufLZ+N+E+rIcUppQDk', 'Ибрагимова', 'Диана', 'Зелимхановна', 'Гематология', 'ВМА', 'Ординатор', '89289558911', 'Россия', 'Санкт Петербург', 0, '895679866ac6508ed916555c5085120e', NULL),
(322, 'oksa.petrova@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$/2ar+FMwr09PFmS8sPHRkA$wTdfVharWQ+3NSxHOYQtBdoYmCptN0Rw9cumnGkUoo8', 'Петрова', 'Оксана', 'Рафхатовна', 'Гематология', 'Военно-медицинская академия', 'Врач-гематолог', '89618098941', 'Россия', 'Санкт-Петербург', 0, 'b4032c7a331a2059fb45f9ab950fcff1', NULL),
(323, 'eye1970@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$RGXqpTcNXQSBwweYRQSD5w$n4J08AkVDGn9DpJgj30pjTEICR04jG48mL0ZjKR1rKE', 'Эйсмонт', 'Юрий', 'Евгеньевич', 'Клинический фармаколог', 'ЭббВи', 'Менеджер', '+79119932841', 'Россия', 'Санкт Петербург', 1, 'af86ca06a96f1566dce2556ac2a2216a', NULL),
(324, 'strizhevsky@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$3mZbmh2gDYEoZTH9DU1NWu3qwd9kvrnSe82Yg59pVfvmdZFCEMs3q', 'Попова', 'Ольга', 'Алексеевна', 'онколог', 'NN Blokhin Cancer Research Centre', 'сборщик котов к корзину', '+79154327879', 'Россия', 'Moscow', 1, 'f92c5f7260ddd607d0e03df8be828caf', NULL),
(325, 'sabantsevdgb@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$8Q7JX3F3EBNLM/2xmAzr8.xrq1KXSbvFumBCyyXJ5OYn4CvhD36CO', 'Сабанцев', 'Степан', 'Леонидович', 'гематология', 'ГБУ РМЭ \"ЙДГБ им. Л.И. Соколовой\"', 'врач-гематолог', '89063358457', 'Россия', 'йошкар-ола', 1, 'e93811d70a9c33ed103a34257d9c3f93', NULL),
(326, 'strukovaav@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Kz1OqqYWRqOWuR0KNPUn7O/6pktsfApa/XlfC.ET0k5/xnzWVfxiO', 'Тишина', 'Анна', 'Викторовна', 'онкология', 'ФГБУ НМИЦ онкологии МЗ РФ', 'врач-онколог', '89885711891', 'Россия', 'Ростов-на-Дону', 1, 'd5604cc6b16b431c9862cfdbdd910ac7', NULL),
(327, 'olga.schatunova2016@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eiKCrJXQqZ2TA1vj4uN8BQ$xjXwVR8e3CAxi12pfsfuxWhoxXQicOpiV5INnuzTPM8', 'Шатунова', 'Ольга', 'Игоревна', 'патологическая анатомия', 'ГАУЗ СО \"Свердловское областное патологоанатомическое бюро\"', 'зав. отделением общей патологии №4 (ИГХ-лаборатория)', '8-908-914-73-70', 'Россия', 'Екатеринбург', 0, 'a7484808cec56aefc197d0cd71de8445', NULL),
(328, 'vv3@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$TPwCXgu4q04yaZoA/b6NbA$gfZgX97FjYgSaySVbGJ6ATt6fwVkzeRAaX15O3/Fq9U', 'Лунин', 'Владимир', 'Владимирович', 'Гематология', 'МНИОИ им П А Герцена', 'врач', '89261080304', 'Россия', 'Москва', 1, '2d17a1bd95a1431f06811cc604bfc6ef', NULL),
(329, 'liziuk_burtseva@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$FAEXJxkpV2ahwDoB9FwEQw$wqxsw/YnHaOBHtAEtQTnkKJzv57SFrnHjVd4jGNBHOc', 'Бурцева', 'Елизавета', 'Алексеевна', 'гематология', 'ФГБОУ ВО РостГМУ МЗ РФ', 'врач-гематолог', '89054268576', 'Россия', 'Ростов-на-Дону', 1, '8ee0ee2eab582a71c4e514f161fde8ae', NULL),
(330, 'md.savostina@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$J9zh93dJLoFVBjYpQstqgg$BPpCWLZsDYL4NQ9wi47aSdyqQk+8qp+za79wV4QFoJw', 'Савостина', 'Наталья', 'Александровна', 'врач', 'ФКБУ ЦКБ с поликлиникой', 'онколог', '89099400605', 'Россия', 'Москва', 1, '27dfcd4d96a04c9c951a0f41483a93f0', NULL),
(331, 'klop1708@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$l2iIhs5fJDqmc1tV9nPkWg$qQxR69wASR6hR3nfd8Vm/8DFpwbSmXFU1v0RIqtFncM', 'Наумова', 'Наталья', 'Николаевна', 'онколог', 'ГБУЗ СО ТГКБ№5', 'заведующая отделением', '+8(902) 376-9108', 'россия', 'Тольятти', 0, '07ce1b0f9e9eddb274b36fba0392f25f', NULL),
(332, 'almyashev_2005@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$EJlpUuMFqsBjYPgCdMqL9w$JwH5DzXbSn63VyXvSdUKR9iMnIY7hB3KA5S3URAwKYQ', 'Альмяшев', 'Али', 'Закирович', 'онкология', 'ФГБОУ ВО \"МГУ им. Н.П. Огарева\"', 'заведующий кафедрой онкологии', '+7 927 187 08 97', 'Россия', 'Саранск', 0, '385e1376aa49e280a4e7bf05f714657c', NULL),
(333, 'victortom26@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$cxBX3h6GM2oWvL72zMU+ig$XXhnLsIcqwR75xsq67nU8LNV7oQpau6wjIwAlRKjIuA', 'Tomacinschii', 'Victor', 'Vladimir', 'Hematology', 'Nicolae Testemitanu State University of Medicine and Pharmacy of the Republic of Moldova', 'university assistant', '+37369754013', 'Moldova', 'Chisinau', 1, '74bf723d4cf60a85d088a97f3e9fb81c', NULL),
(334, 'leno4ka19@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y1b09RjhBAqWzQz2ON7Bmw$pWN0Fty//lwiqAac5NCMGfMA6L4I/Ce14eq5qRkXRr8', 'Covalschi', 'Elena', 'Pavel', 'Hematolog', 'IMSP IO', 'Medic', '069632795', 'Republica Moldova', 'Chisinau', 1, 'b7e95cb0c33f7d956eb232013b0db803', NULL),
(335, 'Natasha22v@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$8vHKUsvcA7Ly3S/FRYuWn.Gcx/nXDMrpBgYGZIu6GWoi1C9F0gxIG', 'Виноградова', 'Наталья', 'Николаевна', 'онколог', 'ФГБУ ЦКБП', 'Врач', '8903 165 33 36', 'РФ', 'Москва', 0, 'c8ad6c0dbef60448c81038d27b5ef82d', NULL),
(336, 'viktorya_lukina@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$be4eWGRAHxK/P1RBQV2DZA$zl5TFv9HDDETFgZAteyOdonn+CoJPw1CDD0DScx/DrM', 'Лукина', 'Виктория', 'Анатольевна', 'гематология', 'ООО', 'врач', '89832440504', 'Russia', 'Иркутск', 0, '8485b2eb24fa4c5f0211a362c58f73bd', NULL),
(337, '4363174@mail.ru', '[\"ROLE_USER\"]', '$2y$13$SBD25kEZmtfUXlptXO3UKufoFOzC5cvCp7tpwA59K0rqf7EiW/FHi', 'Охотина', 'Марина', 'Александровна', 'Онкология', 'ГБУЗ НО ЦГБ г. Арзамаса', 'Заведущая онкологическим отделением', '89875319514', 'РФ', 'Арзамас', 1, '3e8c578cc70f2ebd32bc87a32a210f75', NULL),
(338, 'cojocari.med@gmail.com', '[\"ROLE_USER\"]', '$2y$13$t2fKTVA1QTNXWDokvCNJQ.u2c2kTRUdoiSmx2lIbx.hc0s37UFXou', 'Sușchevici', 'Marina', 'Dumitru', 'Гематолог', 'Онкологический Институт', 'Интерн', '+37360214965', 'Молдова', 'Кишинев', 1, '18af0e7137ab57bbb73e332865bd6920', NULL),
(339, 'hematolog.trizna@gmail.com', '[\"ROLE_USER\"]', '$2y$13$8.lM0Tx0FsXlNJaYtxm08.uOh8ffU7P3kZL80GFbW4ISBNn5mVOHW', 'Тризна', 'Ксения', 'Борисовна', 'гематология', 'ОГАУЗ ТОКБ', 'врач-гематолог', '9131059550', 'Россия', 'Томск', 1, '4bbbebf2de05f1d25f893d67d91b7260', NULL),
(340, 'irina.maslova@sanofi.com', '[\"ROLE_USER\"]', '$2y$13$Xa.s5ewvtb/ZefjI6xp4gehO7rrMu72sAzwg9BUrwykarw.k6w71y', 'Маслова', 'Ирина', 'Сергеевна', 'гематология', 'Санофи', 'Менеджер', '89166852212', 'Россия', 'Москва', 1, 'b383e53eb2cc5848ca3a6475176a8c7c', NULL),
(341, 'av-artur@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$IwJUi7tld+bF+jjlrNcl3w$p8iAyjWviC1Wwb8/QKgxiD3fAwrwylx7TAzUBP/WX7c', 'Саркисян', 'Артур', 'Андраникович', 'Гематология', 'ГКБ им С.П. Боткина', 'Врач-ординатор', '89180270160', 'Россия', 'Москва', 0, '3880be5217fadcf7d8bbc866f5d9ab9a', 1),
(342, 'perigen@mail.ru', '[\"ROLE_USER\"]', '$2y$13$WIRXr1igteO.XKpfSoqTUeVA/yZA1lbFkorzbYPfAe26syya69F5W', 'Перепелицына', 'Ирина', 'Геннадьевна', 'патологическая анатомия', 'БУЗ ОО КОД', 'патологоанатом', '89136478807', 'Россия', 'Омск', 1, '1c0fc2559d3c1b05cb48f77303fc58dc', NULL),
(343, 'shamanskybmt@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JZgsX1ImD9a8XJocyHoYTQ$2tOd3P4Bij3ieeCYbOC1C+OKrM0o4GCB6Hy+8Taw3rg', 'Шаманский', 'Сергей', 'Викторович', 'гематология', 'ФГБУ \"ЦКБ с поликлиникой\" УДПРФ', 'заведующий отделением', '+7(495)530-02-42', 'РФ', 'Москва', 1, '6926d1a51c75576c8ebd164d4ac5af9a', NULL),
(345, 'skorpon_72_27@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$9/LM7y0q91h1V6LRz0apAg$w70QqeAcmgF/X1+qfz154gqCXP6D0+hs0aCa/qNrugY', 'Bekisheva', 'Aigul', 'Nurpapaevna', 'патологическая анатомия', 'НЦПДХ', 'врач', '+777715013400', 'Казахстан', 'Алматы', 0, '39a8a580853a9872465a746fe5df2a6c', NULL),
(346, 'test5@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$PhHYv6+Zkt3HnZ1DGDa9rg$N5Z+MXbwXd/9HW9mocCpeN2pq6VaMaK0C1B6nD6X0PI', 'Демина', 'Е.', 'А.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '90b2c5ed086a1dd69e59391e262fd100', NULL),
(347, 'test6@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JRSPU4WOfQ67oH72HUT7tg$aKyUCcFlbtlu45i/NugCbiamdhfEPyb8eLMO59o0rSw', 'Ковригина', 'А.', 'М.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '39e826c98e5b9c6ea2b9e371cf26f8c8', 1),
(348, 'test7@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$I64CnWUM9X6V8cGB9LcSzA$4JObj3MDyjjsZqbsHXJ03EVVTtsj2S3+ScoLTuClhIk', 'Нестерова', 'Е.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '4bcd205167643aef9a3a52a78cf4f352', 1),
(349, 'test8@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uSIEZuXAOj8SC8qjIMQE0A$08pUFfArlUe2orcnQnBOOjgUxv6nJk5vwA++9E3WKQ4', 'Gianluca', 'Gaidano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '7f12eaf8924c02c465b7bba13c8c7664', NULL),
(350, 'test9@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$J+4uDjTiZfaSRVwI5Iiqrg$j0VmDJ/RVoskAAY/gk8rAbkxd2dFBr2vuVAkUjWGVJ4', 'Кравченко', 'С.', 'К.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'c9448e35bfbbe4cf10c990227fdba91a', NULL),
(351, 'test10@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$yoDoNtLK0MwHL999/vCM3w$XFIKIkxfgyWjpG9MfyXpMKBilP3u3V5UEWL2gH8p2Zg', 'Хусаинова', 'Г.', 'Н.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '375b4031f990443efa6b60ec944b4be9', 1),
(352, 'test11@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zNCG6Qz1nZAL0kkl050kCA$YeYcn71nFIfFKuGwwV/+n0w6U1ky0bKLFpRVaHo2UkA', 'Саржевский', 'В.', 'О.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '0e8e759eb1d548cfffdb02db7302c8ab', 1),
(353, 'test12@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eZSdY49vPCnDmyLXTeB/sw$xS9j2R4hJRVbV99JW9IYOBmW/7RJV/+fAPBVk8tbwOA', 'Иванова', 'М.', 'О.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '36480981a6f4b1aaefcf4dbea0df3c53', NULL),
(354, 'test13@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Ufi7XKvpnnMi3EI2HirQ9w$7N8grM3YZK0c/3ev8hPd2ZKZK2ZWcyRqhfLu3Zeu2Wg', 'Пискунова', 'И.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '7634395fdc614e700d687308d6904bfb', NULL),
(355, 'test14@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MVEP0GEkLy14y+8XhmIamQ$Dw+DZB6O+qprSq4enY/gjZnfNK3vsWDhegXBA49gtC0', 'Бялик', 'Т.', 'Е.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'd70bdf788954f70be1e58cc439f8555c', NULL),
(356, 'test15@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$c98CmGFYyUZDKwnAga8TWg$JUo56Jual7Ul/QfK4UXblGNbyuLluVDBwNijmdggNbw', 'Валиахметова', 'Ч.', 'Х.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '07fc56e126f3a21df780a839e71af835', NULL),
(357, 'test16@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$9w9kXISJvp8haBWlrSDgig$FRxviygkW0XA+XG9kBvUR38CTWhVvH5VYhVnHJ/sYDQ', 'Стадник', 'Е.', 'А.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2f9f826979bbb56c7fad8b0c1ae00469', NULL),
(358, 'test17@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$0X39wMXXbsKIMSE4Hoa6/g$aHpSdn4Ug9FXr9gu8nd4CsRq/ztkfrYkn0ICWzguhOw', 'Бессмельцев', 'С.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'a4a80d70eb6f4f2d28eeefd9d76b1ef3', NULL),
(359, 'test18@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$R3pCwlh/4eQWGahzc7y+rw$uAsToeoAD4vPEXFvnaNkEmJql1T2VDP97TnGOWDwDo0', 'Жеребцова', 'В.', 'А.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '581c17274bf232e2074c79a4c35b5fe3', NULL),
(360, 'test19@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UWHLyNOpIsKZb38W2dawEw$7tO9QUSvIpoi+n5iQ8ryM7vyLhxeSFYBzkVp9kdwkTo', 'Скворцова', 'Н.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '75732cc793147071b24a2cf8829ed9d0', 1),
(361, 'test20@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$k41+0CmDjUJ5+teoALfzNw$iw1J+/Q9W81D7pjWNKRJi8yXDiOEe8npbSPVOvVoXXs', 'Соловьев', 'М.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'c4a406a2e2019e8665e7fd9763fdec73', NULL),
(362, 'test21@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$8lS3u6SqIEyI+5ZsMDM5+A$/z3aaHwiht/9KdWY4kJK7N5AaCxgf6Ckinb2mU+57y4', 'Клиточенко', 'Т.', 'Ю.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'e696c7fbccf675f28bbad9db87125969', NULL),
(363, 'test22@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oY0ICU3WOFVeC8Ad3YInIA$KSNa/Z8M9XUoJoAfotMsKr/CprFwzamz+kh/otK+5g4', 'Семочкин', 'С.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '83983c27c8d1ea4b5b4e28a5f63a8659', NULL),
(364, 'test23@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$GPsQe3UR0d2JWzDNMlLDEQ$x2njcNZNelEPKWu9awJ2vRlW/iCnTRNhZ4pWciVxXF8', 'Гарифуллин', 'А.', 'Д.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '96889ca64e8eb516139a944ddf414a58', 1),
(365, 'test24@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+YWZ9n8CZEIZqc/UXkbj6A$4Rdx2CC9lmHBQupMBzxFq8ZLVSXJRbGIEDzejUDFff4', 'Лучинин', 'А.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '854d9531ccacf5753fc90e687d4f8d2f', 1),
(366, 'test25@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$rJ/RBM7KBQ5E8mcOs8haAQ$SrZrTTnCBJjChQ+NjST+CS8tdYqeFq5zKy4WYrg/lp4', 'Воробьев', 'В.', 'И.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '315863743c45fa6c5b147ba458af5e1a', NULL),
(367, 'test26@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$u8Tr5xQZE3srTzAQ86G4xw$jLepYaKL7WCCdnTmUhMcbUR1dXjsjQkgQhsS9Q4sXxM', 'Зубкова', 'Е.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'e21c79cc5df076e05101978016db11a7', 1),
(368, 'test27@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$XA+QekFuvKVoCIiIbj3/eA$STHhYauUbljqfLFjv6B77kb8kmG3uD4qsELCT0ch1wo', 'Бабичева', 'Л.', 'Г.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'f842452a68bfdaa14b08c04649e8e3c2', NULL),
(369, 'test28@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$u9GpvK6r1e/YGjogReXw4g$BVwD0+5lFqyPsHU1Fkx1SkDUH9lCyYxlI3PY2lGHxt8', 'Рябчикова', 'В.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'c5c14707046b223470a83d11cd5baa6d', NULL),
(370, 'test29@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dY+5aUD05bhcg8/EBFc9eA$iY9spz5+l+/4nliRgcyLhCFGhSMnOnK1PO66I+3lh3w', 'Данилова', 'М.', 'А.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'e0f10b4af53382031bd9c2d1484dc719', NULL),
(371, 'test30@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$3uDGfzw3yNLoW4QC89VuyA$S/jeLyaLhQlj4GL/VrESJy+ZqYkmEsXH1+ltSkAzZz8', 'Самойлова', 'О.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '8411422333993dcd75cd52c7129bc627', 1),
(372, 'test31@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MXarud6hpKa59onh/kPFTQ$XZNg0yU1MHq8qfvBZ+pt0ZF8/8nB75AbdRfXGGWuGYw', 'Поддубная', 'И.', 'В.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '1c5346e73b8a9ca4084fe05fcb9b5723', 1),
(373, 'test32@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$EDlq1cVGdJOChyU7y9ap7g$EkgTrF12G8ZFwUj0zrXIpwd5zTsefUsagtFaFansuxM', 'Менделеева', 'Л.', 'П.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '65cd86da151717f49a21064d247eba0b', 1),
(374, 'test33@lymphorum.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$le2Wb6r1XmxyuaO6txVbJQ$60ioQFZKxSZ4jRjyQ9Q1AjaDS/lhGmHudtDxhDdpqq4', 'Тумян', 'Г.', 'С.', NULL, NULL, NULL, NULL, NULL, NULL, 0, '8fbd5ee987f9f28cefb51ec2629a63f1', 1),
(375, 'micromay@mail.ru', '[\"ROLE_USER\"]', '$2y$13$zNSQi.cawugblmw6EaFeeewqDMY6LlWuTZiIMR9S2aygOxCl5aYvy', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', '88008008080', 'Test', 'Test', 1, 'ea7995b1f9ecce55179098100270faa9', NULL),
(376, 'tchagor@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$mCGQ/soxP8kLXIVYAwllRuwGvvRmvzvuxxPj5U9pbSojyCLjMuKVu', 'Чагорова', 'Татьяна', 'Владиславовна', 'гематология', 'ГБУЗ \"Областной онкологический диспансер\"', 'зав.гематологическим отделением', '89053672147', 'Россия', 'Пенза', 1, '9ffee69e5f30a4a2c7485ccdbccb17af', NULL),
(377, 'kazarina.ev@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$/k4zE/RUG.VRIZ2quhKCg.u5ah74VEpxk0Bdw4DIXzSRakoceN4am', 'Казарина', 'Евгения', 'Валерьевна', 'Нефролог', 'ФГБУ НМИЦ гематологи МЗ РФ', 'Врач', '+79035432167', 'Россия', 'Москва', 1, 'b94fb69ef455d116ba026473dd2de9d0', NULL),
(378, 'dimka.c93@icloud.com', '[\"ROLE_USER\"]', '$2y$13$.aFu6JC.10.8CgG1RFArDOlWhI.P/U5KCv85KP8oHCfsbEEW1cNiK', 'Смуров', 'Дмитрий', 'Дмитриевич', 'Патологическая анатомия', 'ГБУЗ НСО ГНОКБ', 'Врач-патологоанатом', '89237024344', 'Россия', 'Новосибирск', 1, '9dc79527f5f4b4ccbf4e8f75760131c1', NULL),
(379, 'Orionova1989@mail.ru', '[\"ROLE_USER\"]', '$2y$13$DgIzwRRExv/WSMohl3p.4OgGig3JsuscUcTsbSUn35Q2Ypiu0YO9y', 'Орионова', 'Ева', 'Игоревна', 'Гематология', 'АРКОД им. М. Х. Ашхамафа', 'Врач-гематолог', '89529704377', 'Россия', 'Майкоп', 1, '2f646a5384c4b9d682b23caceaabd28a', NULL),
(380, 'modoeva@mail.ru', '[\"ROLE_USER\"]', '$2y$13$RfddE2JzGho0xB8mwUPpge0ExkSMyjKb4lOA2IBzQmUBDCMBGCmDi', 'Модоева', 'Ульяна', 'Станиславовна', 'Гематология', 'ГБУЗ ИООД', 'Врач- гематолог', '+79021792081', 'Россия', 'Иркутск', 1, 'a0b98ef339679609fa728b720e76c8b2', NULL),
(381, 'dr.tanya2002@gmail.com', '[\"ROLE_USER\"]', '$2y$13$j9VWSEbgi4YqIPthHkqKD.uoxAqgIcnsibyn9aPRjxR14sTDaf3Em', 'Харченко', 'Татьяна', 'Михайловна', 'Онкология, ультразвуковая диагностика', 'ОГБ', 'Онколог', '+79100033685', 'Россия', 'Белгород', 0, 'd88141157250ff14918ac2e0e85ee099', NULL);
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `surname`, `name`, `patronymic`, `specialization`, `job`, `position`, `phone`, `country`, `city`, `is_verified`, `secret`, `is_attend`) VALUES
(382, 'dr.shpirina@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$e5ZwdviE3qG5ReWWpJurBw$SXOX+syqDFFVT4/8QAXXrInLsLYHALX1m1CPtZnknX4', 'Шпирина', 'Татьяна', 'Алексеевна', 'Гематология', 'ГБУЗ РК \"КРОКД имени В.М. Ефетова\"', 'Врач-гематолог', '+79787204223', 'Россия', 'Симферополь', 1, '4bc3682188989841595cf690451a9be9', NULL),
(383, 'nastena.voronko.90@mail.ru', '[\"ROLE_USER\"]', '$2y$13$Ffw/wQyRZ0cOWhC4TscriOEuKuOP9.sYD1HkuHeFJy3vr1k37rxcW', 'Музафарова', 'Анастасия', 'Сергеевна', 'врач гематолог', 'Сургутская окружная клиническая больница', 'врач гематолог', '89171021228', 'россия', 'сургут', 1, '61f41098666ab04735cbf52db5b110c9', NULL),
(384, 'trev1979br@mail.ru', '[\"ROLE_USER\"]', '$2y$13$ZC3vRjqLqg1hSNLX4RyYuevaiPJniQopPctMyHoqTCGWLUbFQ6e2K', 'Тришкина', 'Екатерина', 'Владиславовна', 'Радиотерапия', 'ФГБУ \"РНЦРХТ им. Ак. А.М. Гранова\" Минздрава России', 'Радиотерапевт', '89215523101', 'Россия', 'Санкт-Петербург', 1, 'bf8b74cfe15bcf7707886719588654b0', NULL),
(385, 'anna.sentsova1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$vZVNPW2fTL90fSmlL.bsq.Gxd3TN595JCpIoAKO5Eu.SBgVHJfwm6', 'Сенцова', 'Анна', 'Вадимовна', 'Гематология', 'Астра Зенека', 'КАМ', '89857201330', 'РФ', 'Москва', 0, 'c03168bd1ea193d3f37e0665560beaed', NULL),
(386, 'jalbalidia27@gmail.com', '[\"ROLE_USER\"]', '$2y$13$xeJf1/D5KjvfBqQB4NAMM.6BNpVx9dKwjN.hyMzPiL0G.y2ciXGbW', 'Jalbă', 'Lidia', 'Mihail', 'Medic', 'Institutul oncologic Chișinău', 'Hematolog', '069270466', 'Republica Moldova', 'Chișinău', 1, '9c40a24e2ea55903117b61c8ae687b87', NULL),
(387, 's.semochkin@gmail.com', '[\"ROLE_USER\"]', '$2y$13$LophU52Chh6t6nHt0.zwrOoublKtFLMdaMqVziszM4xosbdYwW98m', 'Семочкин', 'Сергей', 'Вячеславович', 'гематолог', 'ФГБУ НМИЦ радиологии Минздрава России', 'г.н.с.', '+79150162734', 'Россия', 'Moscow', 1, 'bc13e5eee2f96e919fadbc16121711d0', NULL),
(388, 'skorpion_72_27@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$n65t4wbpi1P1kMK561BmBg$IYN+x9JDQ2KkpHHw6SySXceEoiRXFqmWrd8qK+tzDF4', 'Бекишева', 'Айгуль', 'Нурпапаевна', 'патологическая анатомия', 'НЦПДХ', 'врач', '+77715013400', 'Казахстан', 'Алматы', 1, '496c000e5b0df0082790496f549a0e95', NULL),
(389, 'anna_spornik@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$AfbilKn8IV6KABPIeE6zcQ$bmSbWdqqVWk6NNJzyU63Wt9baXmvdfX5NHdqJ6lBmg0', 'Спорник', 'Анна', 'Анатольевна', 'Врач-гематолог', 'ГКБ 52', 'Гематолог', '+79623903845', 'Россия', 'Москва', 0, '73313b66a019eac77f976f4059dcfbf1', 1),
(390, 'enzotina@mail.ru', '[\"ROLE_USER\"]', '$2y$13$jWJEHrhMsqBBzfIqT1.kTuEN4afW5KfJzjoEYFEk41/oNl2//plmq', 'Зотина', 'Екатерина', 'Николаевна', 'Гематология', 'ГБУЗ \"ГКБ №52 ДЗМ\"', 'Врач-гематолог', '+79091330839', 'Россия', 'Москва', 1, '843562b196b04d2ffd38e20176b13590', NULL),
(391, 'zulfiya.khabaginova@abbvie.com', '[\"ROLE_USER\"]', '$2y$13$rJMSJeRda73N3cIi//7SGOpF8IOswBscn1zDmxBgrGh5plHKH5fgK', 'Khabaginova', 'Zulfiya', '.', 'гематология', 'abbvie', 'советник', '89661867966', 'РФ', 'Москва', 1, '7fe009ea04414c7d47adb7cef2ee09a5', NULL),
(392, 'laivcher@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$vG6nM06BnUd5nzQKQxTtkQ$txXwdwWb2S7OilsHtAqj7mPHFXY/0tdMN3b8fpQPG14', 'Черкашина', 'Ирина', 'Васильевна', 'ГЕМАТОЛОГ', 'МНИОИ им.П.А.Герцена', 'врач', '+79104768711', 'Россия', 'Москва', 1, '5a929aceffd68543c158721d1f10ab08', NULL),
(393, 'georggam@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$mvYpO8TJKG2w8JcOU69yTg$CaNgFtl9oSS2owfFnR+6YX82Avpb+uNEYuUF+ohx4II', 'Иванова', 'Татьяна', 'Владимировна', 'Гематология', 'ФГБУ \"НМИЦ ГЕМАТОЛОГИИ\" МИНЗДРАВА РОССИИ', 'Зав. Отделением, врач- гематолог', '+79032461186', 'Российская Федерация', 'Москва', 0, '1deedb6b06f23d0b7f963f2666160426', NULL),
(394, 'alevtina_ch@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$8W9m2z3+JOjGmcNMjGldyw$ZgbBZxx0GBKs2Zmawa3tAGSQ8W+za4HwVc7XYnJs4us', 'Червонцева', 'Алевтина', 'Михайловна', 'гематология', 'НМИЦ радиологии', 'научный сотрудник', '89091673127', 'Россия', 'Москва', 1, '0f0c1060596f15cee84e94ece24e7f18', NULL),
(395, 'inkamaeva@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$pri9gtcMs5/pRSIffUbakA$2uQGtubVpavxagJ6xcoEpfcPsJC+EFbsAMgb3YcBtl4', 'Камаева', 'Инна', 'Анатольевна', 'гематология', 'Национальный медицинский исследовательский центр онкологии', 'врач-онколога', '+78918507769', 'Россия', 'Ростов-на-Дону', 1, 'd808a792c9ed24ef7b0d3c4ccee28013', NULL),
(396, 'fmv-74@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$sDwG+maj+4sa8S+FFdc7eQ$3szw58jqDcGebYo2N/JFCAxJiKi/gWh918uI8ws7rEo', 'Фролова', 'Мария', 'Владимировна', 'гематолог', 'БУЗ ВО ВОКБ', 'зав.отделением', '88912339156', 'Россия', 'Вологда', 1, '335353f17041a2aad2c17b097dcd03fc', NULL),
(397, 'najdgel_mgp@mail.ru', '[\"ROLE_USER\"]', '$2y$13$vAVQ/KMSUUrKKA3K0XUphOg9MHKYhVFoERDTkfbQS6hK3BRGr/HcW', 'Мачнева', 'Анна', 'Павловна', 'Сосудистый хирург', 'ЦКБ РЖД', NULL, '89858425980', NULL, 'Москва', 0, '80c234c6301283e75b82928bb3801eb1', 1),
(398, 'dr_che@mail.ru', '[\"ROLE_USER\"]', '$2y$13$b2tGtrrFgkWmQb3yjzrdi.MSiFWMhOHnN7jtvUVLgivoy/g3iqpvO', 'Чернышёв', 'Дмитрий', 'Сергеевич', 'онкология', 'ГБУЗ ЯНАО НЦГБ', 'врач онколог', '+7912 4264858', 'Россия', 'Новый Уренгой', 1, '0e0d99159a107576dc4105f65e043d57', NULL),
(399, 'lalradi@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$s9fL5KIOtF6SKCzOTdRAsw$ZaW9oKrfKQgwFkN0YMQSqNBoe8YGZlu+tFAhdRmoOC0', 'Аль-Ради', 'Любовь', 'Саттаровна', 'гематология', 'ФГБУ НМИЦ гематологии', 'снс', '89166638048', 'Россия', 'Москва', 1, '258f8e14ae4598dd010317a4ab496ea1', NULL),
(400, 'admin@example.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uJ2uoBneQEC45MUW94tQyg$if6gC9ZLV3yx8cJt5ziZ9PKQ9LROfmJySC3P82t57bY', 'Жабская', 'Дарья', NULL, NULL, 'Бристоль Майерс Сквибб', NULL, NULL, NULL, NULL, 0, '4a75007dca4921be017ac0ec559977a5', 1),
(401, 'l.samodelkina@mail.ru', '[\"ROLE_USER\"]', '$2y$13$uvls5VxN64o34nUKgA3e8uJ16MWUEsEm75r3pxB6nJb/KtAiV1IUC', 'Самоделкина', 'Лариса', 'Алексеевна', 'гематолог', 'ГБУЗ НО НОКБ им НА Семашко', 'гематолог', '89103965679', 'РФ', 'Нижний Новгород', 1, '582c3402b36fc4e683e74dce3ed8fd47', NULL),
(402, 'sidleo@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$VVa+xQ2Pwg5rj4pdaKTF8w$fKS0r0eWf/6HmoIAAHi4AhDU+BzoSB13YLvV6D21RhM', 'Филатова', 'Юлия', 'Владимировна', 'Онколог', 'ФГБУ Поликлиника 1 УДП РФ', 'Онколог', '89161857673', 'Россия', 'Москва', 0, 'bbc1283f8dd8d92eb04d81a911b5a4dc', NULL),
(403, 'irina_hem@mail.ru', '[\"ROLE_USER\"]', '$2y$13$IUZUL460eFTs/YqMxaXLruLuDgK6sxhrGpo3Z8AFP.6e2k77ssjI.', 'Матвеева', 'Ирина', 'Викторовна', 'Гематология', 'ГБУЗ МКНЦ им. А.С. Логинова', 'Врач гематолог', '89061665007', 'Россия', 'Москва', 1, '3d39332dc9b52cd585f2d3fa318d18f0', NULL),
(404, 'rubip@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$rcbm4Gi0j5sfpG2cmcswMw$MAxamimSgEXAiMHDzMMgzfDQ2A0tvWy0VeU2dPMshhw', 'Шеина', 'Ирина', 'Петровна', 'гематолог', 'Пермская ККБ', 'гематолог', '8(342)2393100', 'Россия', 'Пермь', 1, 'b9c10cdb527f94cb7ff428a4baa38508', NULL),
(405, 'kanykovaov@mail.ru', '[\"ROLE_USER\"]', '$2y$13$6G3nA3v.NZV6mqfA/jJT4u8PtJ9b2iAxsm1lEMQMV3pJOCa9wIMHO', 'Мересий', 'Олимпиада', 'Валерьевна', 'Гематолог', 'ПККБ', 'Врач', '89027965961', 'Россия', 'Пермь', 1, '70ffbb54bbecc9c5872fde751cdc93cf', NULL),
(406, 'msini@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$y8NYsLDywBKaFeV5c3EAPg$Cnfr2a/IfbaXz4E741uIHYlXYF9HRkuE/mJ/gy/EoY8', 'Синицына', 'Марина', 'Нмиколаева', 'врач-патологоанатом', 'ФГБУ НМИЦ Гематологии МЗ РФ', 'врач-патологоанатом', '916-393-34-42', 'Россия', 'Москва', 1, '38be96d1fb7bf817645de7e5e4668f97', NULL),
(407, 'm.tumanova@mknc.ru', '[\"ROLE_USER\"]', '$2y$13$va8uYWaEMOY0didJ31ZlU.3xV9eS6E.EMAgphez6r75xw5FO2qr3u', 'Туманова', 'Марина', 'Викторовна', 'Гематология', 'ГБУЗ МКНЦ им А.С.Логинова ДЗМ', 'врач гпматолог Д.С.', '89031981472', 'РФ', 'Москва', 0, 'bb2ed57c04d22f0939b04d1682797b12', NULL),
(408, 'shpirko.valerya@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$bY.XgyRz5F9T8jTP2qbpceMqDAKO0io.sMFJg2kooOHAee840aFkq', 'Шпирко', 'Валерия', 'Олеговна', 'Онкология', 'РОНЦ', 'Аспирант', '+79099887058', 'Россия', 'Москва', 0, 'f7b9f695520a9a1904597289d2e90c12', NULL),
(409, 'humira2008@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$XkH7sP0QKsJf7Zl0wAWVng$3O0mEzc6MOP4WBGtGwbv3mYr2UyFOcKb3qiZf91wVwg', 'Smirnova', 'Elena', 'Юрьевна', 'гематология', 'Abbvie', 'медицинский менеджер', '+79037289325', 'Russia', 'Moscow', 1, 'c700473a940baf24986dac5dbd09d1bc', NULL),
(410, 'pastuhovaia@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$DO936FV6zK5ullKtzYAkAg$VTX+w37WSDObMf1Jyi8Yg5oXayPy76OGpaU5nYGKyic', 'Пастухова', 'Ирина', 'Андреевна', 'Гематология', 'Мкнц Логинова', 'Ординатор', '89250732976', 'Рф', 'Москва', 1, 'e96e3f42fc0da7d3e4d2f4cb949fa59c', NULL),
(411, 'dudina_gal@mail.ru', '[\"ROLE_USER\"]', '$2y$13$rFaLLGREIpBpx/Uz9n.H3uecS00DVnkg0Ccf9mj/cx0BgVHP0L3wK', 'Дудина', 'Галина', 'Анатольевна', 'Гематология', 'ГБУЗ МКНЦ им.А.С.Логинова ДЗМ', 'зав.отделением', '89166508577', 'Россия', 'Москва', 1, 'b63e0ccde9c189fc9aa224d346cf4bbe', NULL),
(412, 's.v.minenko@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$s70DbDovK/vdk9q1ww0SsOR15WPmr55zZWOaGwegjpuOm.mr8wnEO', 'миненко', 'светлана', 'миненко', 'гематолог', 'ГБУЗ ГКБ им. Боткина С.П.', 'зав. отделением гематологии', '+79032603120', 'россия', 'москва', 1, '2ac74e490629f5338918450d77bac817', NULL),
(413, 'emma-osipyan@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$zkq7H2DLowSzALP5ZxwS+A$9WiU1IC2oO88KiYXNJiliu6X1JrL4ncbNz3IEOIhFfU', 'Осипьян', 'Эмма', 'Григорьевна', 'гематолог', 'РостГМУ', 'врач', '+79185801616', 'Россия', 'Ростов-на-Дону', 1, '74aa89750ea97d64121289ab5954500e', NULL),
(414, 'elena_yurova83@mail.ru', '[\"ROLE_USER\"]', '$2y$13$MXJstYPIKO3EFYgSyAwM1endZJtoqjRriHcqvTlXG2tGtOaLnVfFS', 'Юрова', 'Елена', 'Викторовна', 'гематология', 'ГКБ им С.П. Боткина', 'гематолог', '89047706583', 'Россия', 'Москва', 0, '6837dea609fc2b1027ec415c58de18d9', NULL),
(415, 'rimashevsk@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6HO5nLmtfe1qMWy9Di0GLA$4CM1nDDtAS6lXMWkITtThrL0LYThL4KVTZAy0Z+zQjE', 'Римашевская', 'Елена', 'Владимировна', 'Гематология', 'РМАНПО', 'Доцент Кафедры Гематологии', '9153068922', 'Россия', 'Москва', 1, 'c9891e20ff9d2439901dce4f19ee2779', 1),
(416, 'grank-elena@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$kraR6PCEDwfeZ3fbFeFf9Q$tj/Lwgd8QbUFrA7cyM50Fqfh4o2d14sZiTQf9vejA1A', 'Гранкина', 'Елена', 'Алексеевна', 'гематолог', 'РостГМУ', 'врач', '+79061803939', 'Россия', 'Ростов-на-Дону', 1, 'ccfc5c18df2427ddd57d7c7123a45be0', NULL),
(417, 'igorevna2004@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$+OI+/ReYM2qw5sA+fBIlsA$Cxp8X9V2bOh4aMuT4YVfqMx+znpH2S9l/dlJXSbssWY', 'Кузуб', 'Екатерина', 'Игоревна', 'гематология', 'ФГБОУ ВО РостГМУ МЗ РФ', 'врач', '+79185964669', 'Россия', 'Ростов-на-Дону г', 1, '4daded31268b8fbf88a632f31c7ba915', NULL),
(418, 'sionikan@amgen.com', '[\"ROLE_USER\"]', '$2y$13$Rg/B3Nk9DZditRru4xiWJe3L2ZDmEUKZrq8FACozTNW425PEDydX.', 'Ionikans', 'Solvita', 'J', 'onco', 'Amgen', 'Mаркетинг', '89626969989', 'РФ', 'СПБ', 1, '80f7849cb7cf25a849b1955589f22f97', NULL),
(419, 'ShelkoplyasovaTV@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$qte1JVfASnwj98zn98/LEQ$kcX5KfHS7VX4TzLVn0KRMPJ+uD/UAErL6xwbnHhHuQM', 'Шелкоплясова', 'Татьяна', 'Владимировна', 'Онкология', 'ГАУЗ ТО МКМЦ Медицинский город', 'Врач онколог', '89292060337', 'Россия', 'Тюмень', 1, 'af5b9d397f07a02e16b379fd1c5f0151', NULL),
(420, 'alen.statsenko@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$wzMoDiv82lN7LNp3yNqLNeTaMF1klQgxZLTsfAnVEIrHnEEtJWgeC', 'Пашнева', 'Елена', 'Александровна', 'гематолгия', 'ГБУЗ ВОКОД', 'врач гематолог', '89053971957', 'Россия', 'г.Волгоград', 1, '46f00ee37f184a75d87abdbf6e27977b', NULL),
(421, 'kopranova@gmail.com', '[\"ROLE_USER\"]', '$2y$13$edHGaohhGBCwND9OyDp2qOPX9dI.hZtxoaGgj6y0hZEfuFhb5yWze', 'Эндакова', 'Анастасия', 'Игоревна', 'гематология', 'ФГБУН КНИИГиПК ФМБА России', 'гематолог', '+79123678861', 'Россия', 'Kirov', 0, 'c808ed3a6131752ba86131acea5fdda5', NULL),
(422, 'strukovsergej@mail.ru', '[\"ROLE_USER\"]', '$2y$13$xVveNBctxD5/wc424SJWMeYAwQdCFGGmvw9Uj02DvPFyEqCWlNo7m', 'Струков', 'Сергей', 'Юрьевич', 'хирургия', 'ММЦ ЦБ Российской Федерации', 'врач- хирург', '+79167170276', 'Россия', 'Москва', 0, '99b20078e3c3fc5583d3756fd6b342d6', NULL),
(423, 'vardanharutyunyan22@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$yPDauU6eYMqZlGZPb0stLQ$X8H4/Rx7ZC9XEiuXnL3Fqok8t8MLzx6DsHhpsYV1Hnw', 'Арутюнян', 'Вардан', 'Грантович', 'Педиатрия узд', 'Дгп 86', 'Врач', '+79671004424', 'Россия', 'МоМосква', 0, '8a3642e0bdc68d8b38747744abaef4a9', 1),
(424, 'nasta2045@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$op4FG8SAy0Z37TaKa/k/IOmmJXzpTAc4TQ4GPDObGLpkqhg96UM7W', 'Жернякова', 'Анастасия', 'Андреевна', 'гематология', 'Роддом 2 на Фурштатской', 'врач', '+79213430105', 'Россия', 'Санкт-Петербург', 1, '80acbf0974dacc1fb86e0945035ffa6c', NULL),
(425, 'doktor.medic@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$o1Osq3dxA.odgU0tCEfmC.fi4JbBxFdWzVwbjGJUqJYNKkA6iiyJO', 'Пышенко', 'Анатолий', 'Анатольевич', 'Онкология', 'Медицинский Центр ООО \"Мединком\"', 'Врач-онколог', '+7 (916) 714-59-39', 'Россия', 'Москва', 1, '4fc9e5f008824254c9c9efd231bfe927', NULL),
(426, 'lera-4512@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$LOpGp0FPySxi/igRx0gKqOujqUEeP9muLR8/eq3rGL0zKMeGqNNLS', 'Турецкова', 'Валерия', 'Вячеславовна', 'Гематология', 'ФГБУ нмиц гематологии', 'Врач', '+79023052896', 'Россия', 'Нижний Новгород', 1, '088aa9d20d25f4911e97ee8c450b7d41', NULL),
(427, 'pelican19822013@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$5ks35W5IgpZLDog5cbyL1A$sZ/g6NIVGd8YonX8c/7V+O2b0gPY7YEVPknHhjvsV8A', 'Мустафина', 'Альбина', 'Вадимовна', 'Гематолог', 'Городская больница 2', 'Гематолог', '89372866616', 'РОССИЯ', 'Набережные Челны', 0, 'b269b4954dda070436ef332dad192bc7', NULL),
(428, 'bazh-inna@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oL0cXxZA6FZrnoiVCg6EGg$Ts+UgBNgOQrQV6I8TbXSsn3vlBNQrPPDPLMlGxOLImQ', 'Бажанова', 'Инна', 'Михайловна', 'Онкогематология', 'АстраЗенека', '.', '89639627360', 'Россия', 'Москва', 0, 'e1f3947e6d8b19c740ba209cc54087e6', 1),
(429, 'test@test.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$RoGyEiVXlnwEIO3fSt/GaQ$KNXMn41kUAuHqHoP1BIxuTNXNhdWRkvpga2ymHVxU0c', 'Экспертам', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'dde0f63e7274ebe6407bfbd801abbacd', 0),
(430, 'anton.emelianov@roche.com', '[\"ROLE_USER\"]', '$2y$13$6Oa.ZSqPQK7VHiOv9NaEQOoiomDsb9DSHOV8pyoM4uYxTtrWH6mx.', 'Емельянов', 'Антон', 'Алексеевич', 'Онко', 'Roche', 'Clinical System Partner', '89055633900', 'РФ', 'Москва', 0, 'fb432877e1ed8bf591ecf1a9393b0401', NULL),
(431, 'maya.firsova@roche.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$i6VtflrfsJL6V/d0u29kgg$hZsHl9OlWcyIM5QYbQwd27X+YqL1UgAk1cTcDKZxk/g', 'Фирсова', 'Майя', 'А', 'Фарм', 'Фарм', 'Ф', '89160202203', 'Россия', 'Москва', 1, '6c98c3fb1fc90e6a87c2060a08da8543', NULL),
(432, 'svetlanagavrilova87@mail.ru', '[\"ROLE_USER\"]', '$2y$13$PdE7XypifbbNxdwzsbLowuGwcF7bFPkJFCEYrCVycqHK3dUriYBMe', 'Гаврилова', 'Светлана', 'Михайловна', 'врач гематолог', 'ГБУЗ ВОКОД', 'врач гематолог', '+79880103949', 'Россия', 'Волгоград', 1, 'defe18fe42ab8a291e71a1018ebca6d4', NULL),
(433, 'konyakhin270556@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WbJYsqShe1S/27AnzzD7vA$iSkZm70wTXuMPFJuiojQjhh9Y3Qge7KASc+YrEah4Gs', 'Коняхина', 'Наталья', 'Никифоровна', 'Воп', 'ГБУЗ щоб', 'Врач', '89096637876', 'Россия', 'Шелково', 0, '9176cb2f7f3efdd2f76c52edf490287e', 1),
(434, 'inegji@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$as3RQQ+tDln28I+jMkd3DA$2t0dz0pZ+Azl02VPPeltgE3hI1T36MUqFhl9FTiWOwI', 'Иванова', 'Екатерина', 'Леонидовна', 'Терапия', 'Поликлиника 212', 'Терапевт', '89150409946', 'Россия', 'Москва', 1, '19a1f9c476bb67c03ae3f47f9e313d3c', 1),
(435, 'iralyss@rambler.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$bSlc5b1UQ6Pm8vJ1csLZCw$uXsVurh/ZIbRJJ0Z7mMqNhy9t+JCcoMUgXiHXbsnDao', 'Лысенко', 'Ирина', 'Борисовна', 'гематология', 'НМИЦ онкологии', 'завотд онкогематологии', '+79061862131', 'Россия', 'Ростов-на-Дону', 1, 'dbc796e3bafbfa458d0148274ead015f', NULL),
(436, 'kozipan@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JIgIOkOslCu9qj4aHSs/bQ$JtHzRFfkYp8IYDF7x883alqrAs/zBPXt6px69KQGibE', 'козлов', 'валентин', 'александрович', 'онкология', 'НМИЦ хирургии имени Вишевского', 'научный сотрудник', '89268661333', 'Россия', 'Москва', 1, '53004f0470d5ed9faacbcc1bc845ef3b', NULL),
(437, 'olga.bogoyavlenskaya@bms.com', '[\"ROLE_USER\"]', '$2y$13$.bFvams1VuJZQIfpp75o3ezSnyBCKrgXRF2KFzRG21T.fxgQyMF5W', 'Bogoyavlenskaya', 'Olga', 'Borisovna', 'medical adviser', 'BMS', 'medical adviser', '+79852477377', 'RF', 'Moscow', 1, '4de7c53b9bb2d50745e3f3ac89646ab5', 1),
(438, 'anna_md@list.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$4l09FOlJxfDmJPBVYnV6UQ$iTLwURHkiEsQp2a4jjXB1RNOzwXbZKaFrRbBGJFQk/Y', 'Кречетова', 'Анна', 'Васильевна', 'Гематолог', 'Roche', 'Medical lead', '89164306018', 'Россия', 'Москва', 1, 'c73f6485a889117f99e835b1027412dd', 1),
(439, 'dmitrownaja@gmail.com', '[\"ROLE_USER\"]', '$2y$13$fIobNFBEUvG.T0U/7o.YI.IYsbAKctPhmbx5qyHXeA34v3TAXWi/i', 'Бежанова', 'Светлана', 'Дмитриевна', 'Патологическая анатомия', 'ФГБУ НМИЦ онкологии им.Н.Н.Блохина', 'врач-патологоанатом', '89169749343', 'Россия', 'Москва', 1, 'd54abc402087fb9d9c049db6db9f7540', NULL),
(440, 'tahikardia03@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$77dN+4fuWNOAQ0iOPIUwmA$1ltRhLRfyUKK2iWvoy5q/vUQX2oDkMQaEVekM9LXRCQ', 'Симонова', 'Мария', 'Владимировна', 'Онкологи', 'ГАУЗ МКМУ Медицинский город', 'Врач', '89222620778', 'Россия', 'Тюмень', 1, '51005b28d7dc755fb9aa536226e70c00', NULL),
(441, 'kovalik_anastasiay22@rambler.ru', '[\"ROLE_USER\"]', '$2y$13$V/Qsdv60Ki6l9EB2ci7C9uT8Kntnu03WwB1z0qJd24gmI2BF8zV/2', 'Ратобольских', 'Анастасия', 'Владтмировна', 'Онкология', 'ГБЗУ ТО МКМЦ Медицинский город', 'Врач онколог', '89224728408', 'Россия', 'Тюмень', 1, 'f862e4ebc8d851d7f8589522ae63e444', NULL),
(442, 'bobrik-1997@invox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$a8N1933WXD7P5//z7HdYEQ$uU7wdJcQAzwZ7Fa60Qu8fztkg3/ypQ8d3KWuc0ya9dU', 'Бобрик', 'Екатерина', 'Николаевна', 'Онкология', 'НМИЦ им Н.Н. Блохина', 'Врач-ординатор', '89772924403', 'Россия', 'Москва', 0, '381e21605eb079ef64cfa21eba8670de', NULL),
(443, 'bobrik-1997@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JyI6L+YAh/rm5IwNFfqUbg$Llig+c5KZAlSbC5TGR/yX380AsMvh0gwN6LwY6wEeOw', 'Бобрик', 'Екатерина', 'Николаевна', 'Онкология', 'НМИЦ им. Н.Н. Блохина', 'Врач-ординатор', '89772924403', 'Россия', 'Москва', 1, '9f4161a3f7ca35741bd4c89b5c4b0fb2', NULL),
(444, 'dokshina.irisha@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$McsPv6tgmL1jD5eNBl6f2g$h1wV0+e2jUjgYnLULmhDrC6xsfib5N/STRIPIlF159Y', 'докшина', 'ирина', 'анатольевна', 'гематология', 'фгбун книигипк фмба россии', 'врач гематолог', '89123615736', 'россия', 'киров', 1, '057356d7bd9ae45501f6459002f48601', NULL),
(445, 'kazzy13@mail.ru', '[\"ROLE_USER\"]', '$2y$13$gumuT85Ae4gyjAx4ODt07.NxRizZWJcpx1T5Ysu6yHNg34gDzOkOq', 'Казарина', 'Анастасия', 'Алексеевна', 'Онкология', 'НМИЦ Блохина', 'Ординатор', '+79203497086', 'Россия', 'Москва', 1, '7306a1d6059b29a5f75c46fc62ac34aa', NULL),
(446, 'rezenkova.o@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$7456tUVgsgF1AI28dqN1WA$eFbgJQcV0oY3O49RJLjWW4kGR3uOl6m+/wJ8u3RfB98', 'Резенкова', 'Ольга', 'Михайлоана', 'Онкология', 'НМИЦ им. Н. Н. Блохина', 'Ординатор', '89611913195', 'Россия', 'Москва', 1, 'c9a1497a468ba14db4f1dece1faf8468', NULL),
(447, 'katy9119@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$3sGUKzNXX4JVAr7iQQLZrw$751t5OZ0RrP1fYicdTtgoKf8opA7l3wl5Nh3Sny7NQk', 'Гринева', 'Екатерина', 'Сергеевна', 'Онкология', 'Обуз ко нкц им. Г.Е.Островерхова', 'Врач-онколош', '89997457746', 'Россия', 'Курск', 1, 'c10cba3d6fd4228ae53689d874325595', NULL),
(448, 'alesia_sh@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Xu2t29gdpxCaBpfrPvqeKw$cAlEZOH02nMDY5PQx6UXfnRA545q7JmqaJShCNe3YYQ', 'Свидерская', 'Алеся', 'Геннадьевна', 'онколог', '1', '1', '1', '1', 'Минск', 1, '5db9604f48bb12be60ce1eebb6e786b1', NULL),
(449, 'kobylkina1983@mail.ru', '[\"ROLE_USER\"]', '$2y$13$J5KKUfp0LTlQaII3PO/FEOvk8KaLqH1N0g1bnUIUMKX6aifzBogUW', 'Опарина', 'Наталья', 'Анатольевна', 'Онкогематология', 'эббви', 'Менеджер', '89139001450', 'Россия', 'Новосибирск', 0, 'a35081512193aa6327f9120ee1335957', NULL),
(450, 'bogatyreva@mrrc.obninsk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$U+7YpCq66Otm3LkcixrwTA$i4UvmaqPHwTePFiB9yi3rxB01JgV6GLLjF9JCRH1zOs', 'Богатырева', 'Татьяна', 'Ивновна', 'онкогематолог', 'Медицинский радиологический научный центр им. А.Ф.Цыба', 'ведущий  научный сотрудник', '+79105995769', 'Россия', 'Обнинск', 1, '2d456d3913209d5d0c2a3baa82ef3494', NULL),
(451, 'yelya.alekberova@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$s/HLiArlaD8Wjz/KW0G6ug$exEeFzcCs4BqJC0YNTFHC76jmyadkCpCDeSB7ozh1Xo', 'Алекберова', 'Эльнара', 'Асиф кызы', 'Онкология', 'Нет', 'Врач - ординатор', '89203427393', 'Россия', 'Москва', 1, 'd6f8406116c1a09d4f8cfd3a7736c969', NULL),
(452, 'Annaa.97@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$sNGew6h8qikXYjT6DQBzweoRoMdrjxvScFGPJoARLGpE3fO4YZMWO', 'Прусова', 'Анна', 'Михайловна', 'Онкология', 'Ронц Блохина', 'Ординатор', '89963542661', 'Россия', 'Балашиха', 0, '4077364e580174f4dcc8a94305484af8', NULL),
(453, 'skkrav@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$A4tyzTibGvkKWv+hhHFtrg$Zu9iKRKfq72EYIXQbwB7/nHU2z1Ig7kpI8dGbmiHxTg', 'Кравченко', 'Сергей', 'Кириллович', 'гематолог', 'ФГБУ НМИЦ Гематологии МЗ РФ', 'зав. отделением', '+79262342246', 'РФ', 'Москва', 1, '23ac24b8deb6601b3eb27cee2f958877', NULL),
(454, 'svetlanashambievna001@qmail.com', '[\"ROLE_USER\"]', '1234567', 'Бабичева', 'Светлана', 'Шхамбиевна', 'Гематология', 'Адыгейский онкодиспансер, гематологическое отделение', 'Зав. Гем. Отд.', '89#64387378', 'Россия', 'Майкоп', 0, 'a63ba68719940eaf5c21d84a9f93def2', 0),
(455, 's.zhernyakov@mail.ru', '[\"ROLE_USER\"]', '$2y$13$sNRFJVsy41eOV4QrcM2yv.ugVdRNHHjszQ031lpdfXvG5aXzGyAhC', 'Жерняков', 'Сергей', 'Евгеньевич', 'Гематолог', 'ГБУЗ СО ЦГБ 7', 'Врач-гематолог', '+79826206887', 'Россия', 'Екатеринбург', 1, 'ead5d13ad3cdfcf1b08930ab774f7863', NULL),
(456, 'shukyurli@bk.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$CtS12RtPJbY376ymz40sUQ$F27HeaYukUIxjGUbgHXPsz8+EVCxC85sDgywe4fdgkc', 'Шукюрли', 'Раван', 'Сейфеддин оглы', 'Онкология', 'ФГБОУ ДПО РМАНПО Минздрава России, ФГБУ «НМИЦ онкологии им. Н.Н. Блохина» Минздрава России', 'Ординатор', '+79032232697', 'Россия', 'Москва', 0, '734a391f54a8a151604bf4d724dc1eb2', NULL),
(457, 'nadezhda.mihailo@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Se3oXUxt5YvsbVld7eQoIQ$1943xhTCgQRCKo9cduCsqZTHC0s/z5o37aXD22rMvcs', 'Михайлова', 'Надежда', 'Васильевна', 'Онколог', 'ГАУЗ РКОД МЗ РТ', 'Врач', '89872393202', 'Россия', 'Казань', 0, '68e204c041ae76f5cc215d22a90961b7', NULL),
(458, 'tatiana.vakulevskaia@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$A77dstMo5PtfMtJXCdFMNg$InFGB6CMM0qpf+bfgJiDz5rUHTAWj/htikIakjghpgU', 'Вакулевская', 'Татьяна', 'Борисовна', 'патологическая анатомия', 'ФГБОУ \"ПИМУ\" Минздрава России', 'ассистент кафедры патологической анатомии', '89527830280', 'Россия', 'Нижний Новгород', 1, '6a3e9722f84d5bdc05fedf6b5113e880', NULL),
(459, 'o4290@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$k27ut5TNWcuywYr0ucA8UeaXzuV4m1IezCGzRTWqQwriVB1hBotqK', 'Калашникова', 'Ольга', 'Брисовна', 'гематология', 'НИИ детской онкологии, гематологии и трансплантологии им. Р.М.Горбачевой Первого Санкт-Петербургского Государственного Медицинского Университета им. акад. И.П.Павлова', 'гематолог', '+79313153079', 'Российская Федерация', 'Санкт-Петербург', 1, '1befcc10ff22cb4458891687843799af', NULL),
(460, 'balamihail@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$pdT4E4V3dMoQlmN4SOnCdeziS9VDLGHmlmTZu.J0ex48QcqDWF1fy', 'Бала', 'Юлия', 'Михайловна', 'гематолог', 'БУЗ ВО ВОКБ №1', 'врач-гематолог', '+79103451187', 'россия', 'Воронеж г', 0, 'd4f5220cc7542fe5511692fe4185ba47', NULL),
(461, 'eugeniaris@mail.ru', '[\"ROLE_USER\"]', '$2y$13$bGdjVonsUMqjWADY5HcpTeILlyW04vHtJfi5qaXjZHFfC9nUt0DCm', 'Рисовер', 'Евгения', 'Юрьевна', 'Гематолог', 'ГАУЗКОКБ', 'Врач', '+79131272524', 'Россия', 'Кемерово', 1, '01d4cf77673ca26f0f3d0275bd996114', NULL),
(462, 'viky.abramowa@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$8dgeApKswUNaFqIVIUy7Eg$R4Xvv/VfFSYBXwZxGuhiJBVkg7o1tcP7BV1cux9zS1U', 'Абрамова', 'Виктория', 'Сергеевна', 'Гематология', 'ГБУЗ ВО ОКБ', 'Врач-гематолог', '+79157678387', 'Россия', 'Владимир', 1, '3da3594e556860860fb6256c7511e390', NULL),
(463, 'ershova-v-a@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oVJ7GjVgPgQlKZmUOvyWpw$fnQdQJ/RYrxY2J5alShGB/r9c7ZJw9Z+PaBgb0+pqCM', 'Ершова', 'Виктория', 'Александровна', 'Гематология', 'ГБУЗ \"ТОКБ ИМ.В.Д.БАБЕНКО\"', 'Врач- гематолог', '89807815889', 'Россия', 'Тамбов', 1, 'b353a8c15fdf6796c32e7131516a7fad', NULL),
(464, 'kondakovae@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$sHJa65lBVTERkPPp5IchkA$JUwGPq47F3tCvK+Xwb4xpC9sb1sqKkLH1BP61aYjb4E', 'Кондакова', 'Елена', 'Викторовна', 'Гематолог', 'ПСПбГМУ им Павлова', 'Врач', '9650094653', 'Россия', 'Санкт-Петербург', 1, 'b37586e4a92e0181ae42fec6fa865a35', NULL),
(465, 'svetlana-lokb@ya.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Mz6y+UOrbBKNS7RI10VRRg$zWeZqHjk80L4LwAbJO5YWYUY1GBP1LIzbqhDhhQtkzs', 'Степанова', 'Светлана', 'Анатольевна', 'гематология', 'ГБУЗ ЛОКБ', 'врач-гематолог', '+79214053369', 'РФ', 'Санкт-Петербург', 0, 'a903a12a9cbbc4c320572b4ebc948e24', NULL),
(466, 'valya.rvv46@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$JAFqFWalDdGbEkhHTRkUQg$tHEFb7QAji3coGezyQ0eqFztZuHgneWO0rtEj840Dc0', 'Рокачевская', 'Валентина', 'Васильевнаа', 'ВОП', 'ГБУЗ МО КГБ', 'Врач', '+79165536511', 'Россия', 'Королёв', 0, 'b2f2266af62a825bfd7e3aecb9c79e8b', 1),
(467, 'vashkina-irina@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$u/bLwDEuQV0vV2m+KBL45g$xHXOhXN+32/nTKFaKLbDNEKCytNqSA9/bFBvuTKCad0', 'Вашкина', 'Ирина', 'Юрьевна', 'Гематолог', 'АстраЗенека', 'ММ', '89055693983', 'РФ', 'Москва', 1, 'c77b550031befe29c7c76b7a8703ac9a', NULL),
(468, 'elenafeds@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$GEqJKhOs5XVhGNVx7oEgYw$3OppWX1EYkosX4q7QWQHobzrDfzGD/ndVPymLb9YS5k', 'Федорова', 'Елена', 'Юрьевна', 'гематология', 'Самара, ул. Ташкентская 159', 'врач-гематолог', '89276571138', 'Россия', 'Самара', 1, 'c35dd092f8258c13460f17d886686087', NULL),
(469, 'slk.19551955@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$73BIK41e4ZUPTmMTacBeCA$5CjKDGID2eOAoI4qQNs0m3CDovIPMrvgUQNiq8SaqEs', 'Свиридова', 'Любовь', 'Кирилловна', 'Воп', 'Гкб 170', 'Врач общей практики', '89175425122', 'Россия', 'Москва', 0, 'ef24160d2942d67a75b2219d622305c3', 1),
(470, 'maregor_pharm@icloud.com', '[\"ROLE_USER\"]', '$2y$13$NsfN3Gi6OrKW2jBnVUvOJ.D7Kp7J9GIrwMOXQCeEOiRm4t6YE7qyK', 'Егорова', 'Мария', 'А', 'Онкология', '.', '.', '9779062425', 'Россия', 'Москва', 1, '699b1cd8d01d792538df6ca2598ed826', NULL),
(471, 'jundra@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$LZtl6IWaug/JHm95C1MJ0A$WHkv6+Bs7dRA0glxEg4xPMbQRAkv4qsYK4QxKsr5lN4', 'Минская', 'Анна', 'Владимировна', 'гематология', 'НП-Астрахань', 'гематолог', '+79275530947', 'Россия', 'Астрахань', 1, '1a48a0951345f26eedb36d9bdf3a4a52', NULL),
(472, 'zanalievazumasia@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$hz7VELJXKxte8STlSffUPw$Z2AN/nR+gCTSv/6Lng/CMSTNrOgNvLHdYAcEBXV46bs', 'Жаналиева', 'Жумасия', 'Нуралиевна', 'Гематология', 'ФГБУ им. Бурназяна', 'Ординатор', '89254594396', 'Россия', 'МосквА', 0, '54de5786600d0569681e53a3e48d5987', 1),
(473, 'doctor-l@inbox.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$3dt6uYN+5as5JpOtr9mgEg$Jk8fwWTpFwg+/kH23vT36N4tkG0Iz3H4RcplL/PeAaw', 'ЛУГОВЕЦ', 'Сергей', 'Григорьевич', 'Воп', 'Гбуз гп 45 дзм', 'Врач', '89035242989', 'Россия', 'Москва', 0, 'd03c08ce83eaa78706b0739889f9a8f5', 1),
(474, 'doktor2012irina@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$/zRKoQxj80jRlmzCjTwiOQ$+3TBOn3O/fXann45JJJDmPRfiBqsBBPStUSaefSBmPU', 'шалашова', 'ирина', 'николаевна', 'онкология', 'ГБЕЗ МО ЧОБ', 'онколог', '79035295704', 'россия', 'чехов', 1, '866dfc8c898fbeef480f481e2d8ca163', NULL),
(475, 'olikzero@yandex.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$v9fGYShrKpX9F8id3Ocp2g$oQ8axAAk8RGrMVYu/7v+c4W+oSQRQ5sAIw+fgJfX+Mg', 'Аржанухина', 'Ольга', 'Юрьевна', 'Гематология', 'Университетская клиническая больница', 'Врачгематолог', '89053218260', 'Россия', 'Саратов', 1, '607aeeb09972aa3400152dd00a35542d', NULL),
(476, 'ilmir6@ya.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZNDY3XmXMt86dxHqXdgMtw$hELiTZlGsAwCP6bg/x81Rnb9l26FJqzIhiwE6p9OzkQ', 'Юлдаш', 'Юлдаш', 'Амир', 'Психолог', 'Онк.дисп.6', 'Мед.психолог', '+79857642911', 'Рф', 'Астрахань', 0, 'a917af193c59db39ce4dabd4194d9c34', 1),
(477, 'ivanchikova_d@mail.ru', '[\"ROLE_USER\"]', '$2y$13$YAEsVNqP.4M9Mj3NFiRjAu/Af.LYI4sZfrMk1oFTpFNkjPURtgZN6', 'Иванчикова', 'Дарья', 'Игоревна', 'Гематолог', 'КГБУЗ ККБ 1', 'Врач гематолог', '89145480040', 'Россия', 'Хабаровск', 0, 'f937ff386cd1f1cb7bd0ae3f8b1ff6ab', NULL),
(478, 'drozdann@mail.ru', '[\"ROLE_USER\"]', '$2y$13$pUzNLSV9.MomiXG.AeSYQ.GDt6HKITnsDkVqtUAiNctRTHVmggcG.', 'Дроздова', 'Анна', 'Сергеевна', 'онколог', 'Москва', 'врач', '+79035095469', 'Россия', 'Moscow', 1, '6ae043ed39eca23b3c79fb6101751c07', NULL),
(479, 'nimgirovam@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$U+6BwhSrzSQRDk19h9M2/w$X7FMm8zqfTV2Cxu91OAuLTP37MM97t9Vse5db6BCnUA', 'Широкова', 'Мария', 'Николаевна', 'Гематолог', 'ГКБ  им. С. П. БОТКИНА', 'Врач', '89275359848', 'Россия', 'Москва', 1, 'a04a575e2ae720de5d3a17f345f2307f', NULL),
(480, 'nastyonka.venzenko@mail.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$cupYFC+RQ0s0hl+udqhClg$lbwjbEpXcDdUsjjQQex5XSBj9sJ3/ziAlIWaCLcgFd4', 'Ковалева', 'Анастасия', 'Васильевна', 'гематология', 'Пермский государственный медицинский университет им. ак. Е.А. Вагнера', 'ординатор', '+79097290654', 'Россия', 'Пермь', 1, 'f178cbb4d7a49d28183ddb05288608b6', NULL),
(481, 'akuzaev@gmail.com', '[\"ROLE_USER\"]', '$2y$13$oehV/prgPUgXk6fEyH1UxuoQ2edmLRmeM5UbeZHhPCl8EgiXeztsC', 'Кузаев', 'Андрей', 'Александрович', 'ИТ', 'ВэллКаст', 'Инженер', '89261160970', 'РФ', 'Москва', 0, '253dcb1ca62b344a3c7529ae1ca4162a', NULL),
(482, 'annaalbitskaya@ya.ru', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$KVakz9/tp3knyAz68bByuw$u4HCImALVJKWhul5K3R72uqgGFaKqe+dWTPgQU3MOIA', 'Альбицкая', 'Анна', 'Юрьевна', 'Гематология', 'РОШ', 'Партнёр по развитию', '9162720587', 'Россия', 'Москва', 0, '0fb87de3dc65610c88367c74edb855b3', NULL),
(483, 'korobitsyna3000@mail.ru', '[\"ROLE_USER\"]', '$2y$13$QO3fQgODtkQKTIKmLA6TIOMthzZF4GDvhnEq/NNbJf8I0Dco/oaI2', 'Коробицына', 'Ольга', 'Валерьевна', 'Гематолог', 'ГБУЗ ЧОкб', 'врач', '+79191266158', 'Рф', 'Челябинск', 1, '1d1962a2241ed7d103002cdd966db361', NULL),
(484, 'drexit@bk.ru', '[\"ROLE_USER\"]', '$2y$13$zZKv0/.mNXQwaP/UHghysOC7zkc8fK4IxHnFFa9eV510FSxlR6s52', 'Vykhodets', 'Tatiana', 'Valerievna', 'PM', 'BMS', 'PM', '89165020959', 'Russia', 'Moscow', 0, '316c8633d44be50f8fc4e5bca709dd11', NULL),
(485, 'ellizzaru@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$b8qROblBrdyBIuVRbnbpL.lLFHFmOBsEEDNyaNGP29L5kt95y9JX2', 'Трофимова', 'Надежда', 'у', 'у', 'РОНЦ', 'врач', '89268350853', 'Россия', '115409', 1, '4ac3a1664b694ff019c520d55b68d94e', NULL),
(486, 'olgamukhortova@yandex.ru', '[\"ROLE_USER\"]', '$2y$13$QVuQ/ikZY7XJ7bTMa6o1JOUeF/aEllphSLyiGTVY3oeDi.9kqb/0S', 'Мухортова', 'Ольга', 'Валентиновна', 'ПЭТ-диагностика', 'ФГБУ НМИЦ ССХ им А.Н.Бакулева МЗ РФ', 'ведущий научный сотрудник отела ядерной диагностики', '89031122208', 'Россия', 'Москва', 0, '130bb51f951d85c91ac3062b50d979a6', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_statistics`
--

CREATE TABLE `user_statistics` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `company_material_id` int DEFAULT NULL,
  `company_video_id` int DEFAULT NULL,
  `broadcast_id` int DEFAULT NULL,
  `is_sponsors` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_statistics`
--

INSERT INTO `user_statistics` (`id`, `company_id`, `company_material_id`, `company_video_id`, `broadcast_id`, `is_sponsors`, `user_id`) VALUES
(366, NULL, NULL, NULL, NULL, 1, 1),
(368, NULL, NULL, NULL, NULL, 1, 1),
(369, NULL, NULL, NULL, NULL, 1, 1),
(370, NULL, NULL, NULL, NULL, 1, 1),
(371, 13, NULL, NULL, NULL, 0, 1),
(372, NULL, NULL, NULL, NULL, 1, 1),
(375, NULL, NULL, NULL, NULL, 1, 1),
(376, NULL, NULL, NULL, NULL, 1, 1),
(403, NULL, NULL, NULL, NULL, 1, 1),
(411, NULL, NULL, NULL, NULL, 1, 1),
(438, NULL, NULL, NULL, NULL, 1, 1),
(439, NULL, NULL, NULL, NULL, 1, 1),
(440, 18, NULL, NULL, NULL, 0, 1),
(441, NULL, NULL, NULL, NULL, 1, 1),
(442, 13, NULL, NULL, NULL, 0, 1),
(443, 12, NULL, NULL, NULL, 0, 1),
(444, NULL, NULL, NULL, NULL, 1, 1),
(461, NULL, NULL, NULL, NULL, 1, 1),
(476, NULL, NULL, NULL, NULL, 1, 1),
(480, NULL, NULL, NULL, NULL, 1, 1),
(481, 13, NULL, NULL, NULL, 0, 1),
(482, 12, NULL, NULL, NULL, 0, 1),
(483, 17, NULL, NULL, NULL, 0, 1),
(484, 10, NULL, NULL, NULL, 0, 1),
(485, NULL, 15, NULL, NULL, 0, 1),
(486, 18, NULL, NULL, NULL, 0, 1),
(487, 11, NULL, NULL, NULL, 0, 1),
(488, 20, NULL, NULL, NULL, 0, 1),
(489, 16, NULL, NULL, NULL, 0, 1),
(515, 13, NULL, NULL, NULL, 0, 54),
(516, NULL, NULL, NULL, NULL, 1, 63),
(517, NULL, NULL, NULL, NULL, 1, 301),
(519, NULL, NULL, NULL, NULL, 1, 71),
(520, NULL, 34, NULL, NULL, 0, 71),
(521, NULL, NULL, NULL, NULL, 1, 54),
(522, NULL, NULL, NULL, NULL, 1, 227),
(523, 21, NULL, NULL, NULL, 0, 227),
(526, NULL, NULL, NULL, NULL, 1, 325),
(527, NULL, NULL, NULL, NULL, 1, 129),
(541, NULL, NULL, NULL, NULL, 1, 260),
(542, 13, NULL, NULL, NULL, 0, 260),
(543, NULL, NULL, NULL, NULL, 1, 254),
(544, 12, NULL, NULL, NULL, 0, 254),
(545, 21, NULL, NULL, NULL, 0, 254),
(546, NULL, 28, NULL, NULL, 0, 254),
(547, NULL, 27, NULL, NULL, 0, 254),
(548, NULL, 27, NULL, NULL, 0, 254),
(549, 21, NULL, NULL, NULL, 0, 254),
(550, NULL, 29, NULL, NULL, 0, 254),
(551, NULL, 29, NULL, NULL, 0, 254),
(554, NULL, NULL, NULL, NULL, 1, 335),
(558, 13, NULL, NULL, NULL, 0, 211),
(559, NULL, NULL, NULL, NULL, 1, 211),
(560, 12, NULL, NULL, NULL, 0, 211),
(561, 17, NULL, NULL, NULL, 0, 211),
(562, NULL, NULL, NULL, NULL, 1, 211),
(563, 17, NULL, NULL, NULL, 0, 211),
(564, NULL, 30, NULL, NULL, 0, 211),
(565, 13, NULL, NULL, NULL, 0, 211),
(566, 17, NULL, NULL, NULL, 0, 211),
(567, NULL, 30, NULL, NULL, 0, 211),
(568, NULL, 34, NULL, NULL, 0, 211),
(569, NULL, 35, NULL, NULL, 0, 211),
(570, 13, NULL, NULL, NULL, 0, 211),
(571, 17, NULL, NULL, NULL, 0, 211),
(572, NULL, NULL, NULL, NULL, 1, 340),
(573, 12, NULL, NULL, NULL, 0, 211),
(574, 12, NULL, NULL, NULL, 0, 211),
(575, 21, NULL, NULL, NULL, 0, 211),
(576, NULL, 28, NULL, NULL, 0, 211),
(577, 21, NULL, NULL, NULL, 0, 211),
(578, NULL, 27, NULL, NULL, 0, 211),
(579, NULL, 29, NULL, NULL, 0, 211),
(580, 21, NULL, NULL, NULL, 0, 211),
(581, 17, NULL, NULL, NULL, 0, 211),
(582, NULL, 30, NULL, NULL, 0, 211),
(583, NULL, 30, NULL, NULL, 0, 211),
(584, NULL, 34, NULL, NULL, 0, 211),
(585, NULL, 35, NULL, NULL, 0, 211),
(587, NULL, 26, NULL, NULL, 0, 211),
(588, NULL, 26, NULL, NULL, 0, 211),
(589, 13, NULL, NULL, NULL, 0, 340),
(590, NULL, NULL, NULL, NULL, 1, 54),
(591, 17, NULL, NULL, NULL, 0, 54),
(592, NULL, 30, NULL, NULL, 0, 54),
(593, 13, NULL, NULL, NULL, 0, 54),
(594, NULL, NULL, NULL, NULL, 1, 343),
(595, 12, NULL, NULL, NULL, 0, 54),
(596, 17, NULL, NULL, NULL, 0, 54),
(597, NULL, 30, NULL, NULL, 0, 54),
(598, NULL, 34, NULL, NULL, 0, 54),
(599, 16, NULL, NULL, NULL, 0, 343),
(600, NULL, 35, NULL, NULL, 0, 54),
(601, NULL, 36, NULL, NULL, 0, 340),
(602, NULL, 37, NULL, NULL, 0, 340),
(603, NULL, NULL, NULL, NULL, 1, 340),
(604, 12, NULL, NULL, NULL, 0, 340),
(605, 17, NULL, NULL, NULL, 0, 340),
(606, NULL, 30, NULL, NULL, 0, 340),
(607, NULL, 34, NULL, NULL, 0, 340),
(608, NULL, 35, NULL, NULL, 0, 340),
(609, NULL, NULL, NULL, NULL, 1, 71),
(610, 17, NULL, NULL, NULL, 0, 71),
(611, NULL, 30, NULL, NULL, 0, 71),
(612, NULL, 34, NULL, NULL, 0, 71),
(613, NULL, 35, NULL, NULL, 0, 71),
(614, 10, NULL, NULL, NULL, 0, 340),
(615, NULL, 15, NULL, NULL, 0, 340),
(616, NULL, NULL, NULL, NULL, 1, 340),
(617, 18, NULL, NULL, NULL, 0, 340),
(618, NULL, 19, NULL, NULL, 0, 340),
(619, 19, NULL, NULL, NULL, 0, 340),
(620, NULL, 32, NULL, NULL, 0, 340),
(621, 21, NULL, NULL, NULL, 0, 340),
(622, NULL, 27, NULL, NULL, 0, 340),
(623, NULL, 28, NULL, NULL, 0, 340),
(624, 20, NULL, NULL, NULL, 0, 340),
(625, NULL, 22, NULL, NULL, 0, 340),
(626, NULL, 25, NULL, NULL, 0, 340),
(627, NULL, 26, NULL, NULL, 0, 340),
(628, NULL, 26, NULL, NULL, 0, 340),
(629, NULL, NULL, NULL, NULL, 1, 211),
(630, NULL, 26, NULL, NULL, 0, 340),
(631, 16, NULL, NULL, NULL, 0, 340),
(632, 11, NULL, NULL, NULL, 0, 340),
(633, NULL, 18, NULL, NULL, 0, 340),
(634, NULL, NULL, NULL, NULL, 1, 195),
(635, NULL, NULL, NULL, NULL, 1, 91),
(636, NULL, NULL, NULL, NULL, 1, 377),
(637, NULL, NULL, NULL, NULL, 1, 84),
(638, NULL, NULL, NULL, NULL, 1, 189),
(639, NULL, NULL, NULL, NULL, 1, 163),
(640, NULL, NULL, NULL, NULL, 1, 206),
(641, 11, NULL, NULL, NULL, 0, 206),
(642, NULL, NULL, NULL, NULL, 1, 325),
(643, NULL, NULL, NULL, NULL, 1, 167),
(644, 11, NULL, NULL, NULL, 0, 167),
(645, NULL, NULL, NULL, NULL, 1, 335),
(646, NULL, NULL, NULL, NULL, 1, 291),
(647, 13, NULL, NULL, NULL, 0, 291),
(648, NULL, NULL, NULL, NULL, 1, 91),
(649, 13, NULL, NULL, NULL, 0, 91),
(650, NULL, NULL, NULL, NULL, 1, 382),
(651, NULL, NULL, NULL, NULL, 1, 385),
(652, NULL, NULL, NULL, NULL, 1, 206),
(653, NULL, NULL, NULL, NULL, 1, 387),
(654, NULL, NULL, NULL, NULL, 1, 188),
(655, NULL, NULL, NULL, NULL, 1, 227),
(656, NULL, NULL, NULL, NULL, 1, 337),
(657, 13, NULL, NULL, NULL, 0, 285),
(658, NULL, 36, NULL, NULL, 0, 285),
(659, NULL, NULL, NULL, NULL, 1, 162),
(660, NULL, NULL, NULL, NULL, 1, 301),
(661, NULL, NULL, NULL, NULL, 1, 107),
(662, NULL, NULL, NULL, NULL, 1, 315),
(663, NULL, NULL, NULL, NULL, 1, 315),
(664, NULL, NULL, NULL, NULL, 1, 97),
(665, NULL, NULL, NULL, NULL, 1, 159),
(666, NULL, NULL, NULL, NULL, 1, 286),
(667, NULL, NULL, NULL, NULL, 1, 148),
(668, 18, NULL, NULL, NULL, 0, 148),
(669, NULL, NULL, NULL, NULL, 1, 148),
(670, 18, NULL, NULL, NULL, 0, 148),
(671, NULL, NULL, NULL, NULL, 1, 102),
(672, NULL, NULL, NULL, NULL, 1, 284),
(673, NULL, NULL, NULL, NULL, 1, 284),
(674, NULL, NULL, NULL, NULL, 1, 71),
(675, 17, NULL, NULL, NULL, 0, 71),
(676, NULL, 30, NULL, NULL, 0, 71),
(677, NULL, NULL, NULL, NULL, 1, 202),
(678, 20, NULL, NULL, NULL, 0, 202),
(679, NULL, 26, NULL, NULL, 0, 202),
(680, 20, NULL, NULL, NULL, 0, 202),
(681, NULL, 26, NULL, NULL, 0, 202),
(682, NULL, 26, NULL, NULL, 0, 202),
(683, NULL, 22, NULL, NULL, 0, 202),
(684, NULL, 25, NULL, NULL, 0, 202),
(685, NULL, NULL, NULL, NULL, 1, 54),
(686, 20, NULL, NULL, NULL, 0, 54),
(687, NULL, 26, NULL, NULL, 0, 54),
(688, NULL, NULL, NULL, NULL, 1, 431),
(689, 20, NULL, NULL, NULL, 0, 431),
(690, NULL, 26, NULL, NULL, 0, 431),
(695, NULL, NULL, NULL, NULL, 1, 431),
(697, NULL, NULL, NULL, NULL, 1, 81),
(698, NULL, NULL, NULL, NULL, 1, 418),
(699, 18, NULL, NULL, NULL, 0, 418),
(700, NULL, NULL, NULL, NULL, 1, 74),
(701, NULL, NULL, NULL, NULL, 1, 1),
(702, NULL, NULL, NULL, NULL, 1, 386),
(712, NULL, NULL, NULL, NULL, 1, 397),
(713, 13, NULL, NULL, NULL, 0, 397),
(714, NULL, NULL, NULL, NULL, 1, 397),
(715, NULL, NULL, NULL, NULL, 1, 443),
(716, 13, NULL, NULL, NULL, 0, 443),
(717, 10, NULL, NULL, NULL, 0, 443),
(718, 19, NULL, NULL, NULL, 0, 443),
(719, NULL, NULL, NULL, NULL, 1, 397),
(720, NULL, NULL, NULL, NULL, 1, 108),
(723, 17, NULL, NULL, NULL, 0, 397),
(724, 10, NULL, NULL, NULL, 0, 397),
(725, 18, NULL, NULL, NULL, 0, 397),
(726, 10, NULL, NULL, NULL, 0, 397),
(727, NULL, 15, NULL, NULL, 0, 397),
(728, NULL, 16, NULL, NULL, 0, 397),
(729, 18, NULL, NULL, NULL, 0, 397),
(730, NULL, 19, NULL, NULL, 0, 397),
(731, NULL, 20, NULL, NULL, 0, 397),
(732, NULL, 21, NULL, NULL, 0, 397),
(733, 19, NULL, NULL, NULL, 0, 397),
(734, NULL, 31, NULL, NULL, 0, 397),
(735, NULL, 32, NULL, NULL, 0, 397),
(736, NULL, 33, NULL, NULL, 0, 397),
(737, 21, NULL, NULL, NULL, 0, 397),
(738, NULL, 27, NULL, NULL, 0, 397),
(739, NULL, 28, NULL, NULL, 0, 397),
(740, NULL, 29, NULL, NULL, 0, 397),
(741, 20, NULL, NULL, NULL, 0, 397),
(742, NULL, 22, NULL, NULL, 0, 397),
(743, NULL, 25, NULL, NULL, 0, 397),
(744, NULL, 25, NULL, NULL, 0, 397),
(745, NULL, 26, NULL, NULL, 0, 397),
(746, NULL, NULL, NULL, NULL, 1, 443),
(747, 16, NULL, NULL, NULL, 0, 397),
(748, 11, NULL, NULL, NULL, 0, 397),
(749, NULL, 17, NULL, NULL, 0, 397),
(750, NULL, 18, NULL, NULL, 0, 397),
(751, NULL, NULL, NULL, NULL, 1, 397),
(752, NULL, NULL, NULL, NULL, 1, 97),
(753, NULL, NULL, NULL, NULL, 1, 271),
(754, 17, NULL, NULL, NULL, 0, 271),
(755, NULL, NULL, NULL, NULL, 1, 97),
(756, NULL, NULL, NULL, NULL, 1, 459),
(769, NULL, NULL, NULL, 1, 0, 199),
(770, 11, NULL, NULL, NULL, 0, 136),
(771, NULL, 17, NULL, NULL, 0, 136),
(772, NULL, 15, NULL, NULL, 0, 136),
(773, NULL, NULL, NULL, 1, 0, 195),
(774, NULL, NULL, NULL, 1, 0, 398),
(775, NULL, NULL, NULL, 1, 0, 208),
(776, NULL, NULL, NULL, 1, 0, 208),
(777, NULL, NULL, NULL, 1, 0, 258),
(778, NULL, NULL, NULL, 4, 0, 468),
(779, NULL, NULL, NULL, 1, 0, 468),
(780, NULL, NULL, NULL, 1, 0, 468),
(781, NULL, NULL, NULL, 1, 0, 199),
(782, NULL, NULL, NULL, 1, 0, 470),
(783, NULL, NULL, NULL, 1, 0, 386),
(784, NULL, NULL, NULL, 1, 0, 470),
(785, NULL, NULL, NULL, 1, 0, 377),
(786, NULL, NULL, NULL, 1, 0, 195),
(787, NULL, NULL, NULL, 1, 0, 195),
(788, NULL, NULL, NULL, 1, 0, 206),
(791, NULL, NULL, NULL, 1, 0, 386),
(794, NULL, NULL, NULL, 1, 0, 241),
(795, NULL, NULL, NULL, 1, 0, 241),
(796, NULL, NULL, NULL, 1, 0, 234),
(797, NULL, NULL, NULL, 1, 0, 98),
(798, NULL, NULL, NULL, 1, 0, 173),
(799, NULL, NULL, NULL, 1, 0, 329),
(800, NULL, NULL, NULL, 1, 0, 238),
(801, NULL, NULL, NULL, 1, 0, 329),
(802, NULL, NULL, NULL, 1, 0, 104),
(803, NULL, NULL, NULL, 1, 0, 236),
(804, NULL, NULL, NULL, 1, 0, 258),
(805, NULL, NULL, NULL, 1, 0, 277),
(807, NULL, NULL, NULL, 1, 0, 437),
(808, NULL, NULL, NULL, 1, 0, 244),
(809, NULL, NULL, NULL, 1, 0, 377),
(810, NULL, NULL, NULL, 1, 0, 314),
(811, NULL, NULL, NULL, 1, 0, 189),
(812, NULL, NULL, NULL, 1, 0, 386),
(813, NULL, NULL, NULL, 1, 0, 291),
(814, NULL, NULL, NULL, 1, 0, 169),
(815, NULL, NULL, NULL, 1, 0, 291),
(816, NULL, NULL, NULL, 1, 0, 54),
(817, NULL, NULL, NULL, 1, 0, 244),
(818, NULL, NULL, NULL, 1, 0, 163),
(819, NULL, NULL, NULL, 1, 0, 195),
(820, NULL, NULL, NULL, 1, 0, 213),
(821, NULL, NULL, NULL, 1, 0, 129),
(822, NULL, NULL, NULL, 1, 0, 314),
(823, NULL, NULL, NULL, 1, 0, 303),
(824, NULL, NULL, NULL, 1, 0, 163),
(825, NULL, NULL, NULL, 4, 0, 54),
(826, NULL, NULL, NULL, 1, 0, 275),
(827, NULL, NULL, NULL, 1, 0, 275),
(828, NULL, NULL, NULL, 1, 0, 129),
(830, NULL, NULL, NULL, NULL, 1, 54),
(831, NULL, NULL, NULL, 1, 0, 129),
(832, NULL, NULL, NULL, 1, 0, 193),
(833, NULL, NULL, NULL, 1, 0, 206),
(834, NULL, NULL, NULL, 1, 0, 314),
(835, NULL, NULL, NULL, 1, 0, 129),
(836, NULL, NULL, NULL, 1, 0, 97),
(837, NULL, NULL, NULL, 1, 0, 158),
(838, NULL, NULL, NULL, 1, 0, 271),
(839, NULL, NULL, NULL, 1, 0, 158),
(840, NULL, NULL, NULL, 1, 0, 303),
(841, NULL, NULL, NULL, 1, 0, 113),
(842, NULL, NULL, NULL, 1, 0, 266),
(843, NULL, NULL, NULL, 1, 0, 390),
(844, NULL, NULL, NULL, 1, 0, 103),
(846, NULL, NULL, NULL, 1, 0, 129),
(847, NULL, NULL, NULL, 1, 0, 129),
(848, NULL, NULL, NULL, 1, 0, 304),
(849, NULL, NULL, NULL, 1, 0, 92),
(850, NULL, NULL, NULL, 1, 0, 234),
(851, NULL, NULL, NULL, 1, 0, 234),
(852, NULL, NULL, NULL, 1, 0, 244),
(853, NULL, NULL, NULL, 1, 0, 300),
(854, NULL, NULL, NULL, 1, 0, 103),
(855, NULL, NULL, NULL, 1, 0, 129),
(856, NULL, NULL, NULL, 1, 0, 129),
(857, NULL, NULL, NULL, 1, 0, 92),
(858, NULL, NULL, NULL, 1, 0, 234),
(859, NULL, NULL, NULL, 1, 0, 234),
(860, NULL, NULL, NULL, 1, 0, 234),
(861, NULL, NULL, NULL, 1, 0, 234),
(862, NULL, NULL, NULL, 1, 0, 234),
(863, NULL, NULL, NULL, 1, 0, 234),
(864, NULL, NULL, NULL, 1, 0, 234),
(865, NULL, NULL, NULL, 1, 0, 234),
(866, NULL, NULL, NULL, 1, 0, 129),
(867, NULL, NULL, NULL, 1, 0, 103),
(868, NULL, NULL, NULL, 1, 0, 129),
(869, NULL, NULL, NULL, 1, 0, 92),
(870, NULL, NULL, NULL, 1, 0, 124),
(871, NULL, NULL, NULL, 1, 0, 124),
(872, NULL, NULL, NULL, 4, 0, 461),
(873, NULL, NULL, NULL, 1, 0, 97),
(874, NULL, NULL, NULL, 1, 0, 266),
(875, NULL, NULL, NULL, 1, 0, 386),
(876, NULL, NULL, NULL, 1, 0, 103),
(877, NULL, NULL, NULL, 1, 0, 334),
(878, NULL, NULL, NULL, 1, 0, 129),
(879, NULL, NULL, NULL, 1, 0, 234),
(880, NULL, NULL, NULL, 1, 0, 163),
(881, NULL, NULL, NULL, 1, 0, 173),
(882, NULL, NULL, NULL, 1, 0, 396),
(883, NULL, NULL, NULL, 1, 0, 129),
(884, NULL, NULL, NULL, 1, 0, 103),
(885, NULL, NULL, NULL, 1, 0, 404),
(886, NULL, NULL, NULL, 1, 0, 103),
(887, NULL, NULL, NULL, 1, 0, 103),
(888, NULL, NULL, NULL, 1, 0, 103),
(889, NULL, NULL, NULL, 1, 0, 108),
(890, NULL, NULL, NULL, 1, 0, 292),
(891, NULL, NULL, NULL, 1, 0, 238),
(892, NULL, NULL, NULL, 1, 0, 450),
(893, NULL, NULL, NULL, 1, 0, 214),
(894, NULL, NULL, NULL, 1, 0, 286),
(895, NULL, NULL, NULL, 1, 0, 286),
(896, NULL, NULL, NULL, 1, 0, 398),
(897, NULL, NULL, NULL, 1, 0, 129),
(898, NULL, NULL, NULL, 1, 0, 470),
(900, NULL, NULL, NULL, 1, 0, 396),
(901, NULL, NULL, NULL, 1, 0, 208),
(902, NULL, NULL, NULL, 1, 0, 286),
(903, NULL, NULL, NULL, 1, 0, 158),
(904, NULL, NULL, NULL, 1, 0, 129),
(905, NULL, NULL, NULL, 1, 0, 129),
(906, NULL, NULL, NULL, 1, 0, 256),
(907, NULL, NULL, NULL, 1, 0, 324),
(908, NULL, NULL, NULL, 1, 0, 208),
(909, NULL, NULL, NULL, 1, 0, 450),
(910, NULL, NULL, NULL, 1, 0, 234),
(911, NULL, NULL, NULL, 1, 0, 234),
(912, NULL, NULL, NULL, 1, 0, 142),
(913, NULL, NULL, NULL, 1, 0, 396),
(914, NULL, NULL, NULL, 1, 0, 403),
(915, NULL, NULL, NULL, 1, 0, 282),
(916, NULL, NULL, NULL, 1, 0, 314),
(917, NULL, NULL, NULL, 1, 0, 314),
(918, NULL, NULL, NULL, 1, 0, 314),
(919, NULL, NULL, NULL, 1, 0, 304),
(920, NULL, NULL, NULL, 1, 0, 92),
(921, NULL, NULL, NULL, 1, 0, 325),
(922, NULL, NULL, NULL, 1, 0, 304),
(923, NULL, NULL, NULL, 1, 0, 195),
(924, NULL, NULL, NULL, 1, 0, 129),
(925, NULL, NULL, NULL, 1, 0, 87),
(926, NULL, NULL, NULL, 1, 0, 208),
(927, NULL, NULL, NULL, 1, 0, 129),
(928, NULL, NULL, NULL, 1, 0, 87),
(929, NULL, NULL, NULL, 1, 0, 267),
(930, NULL, NULL, NULL, 1, 0, 129),
(931, NULL, NULL, NULL, 1, 0, 129),
(932, NULL, NULL, NULL, 1, 0, 87),
(933, NULL, NULL, NULL, 1, 0, 300),
(934, NULL, NULL, NULL, 1, 0, 129),
(935, NULL, NULL, NULL, 1, 0, 387),
(937, NULL, NULL, NULL, 1, 0, 412),
(938, NULL, NULL, NULL, 1, 0, 380),
(939, NULL, NULL, NULL, 1, 0, 129),
(940, NULL, NULL, NULL, 1, 0, 395),
(941, NULL, NULL, NULL, 1, 0, 267),
(942, NULL, NULL, NULL, 1, 0, 206),
(943, NULL, NULL, NULL, 1, 0, 185),
(944, NULL, NULL, NULL, 1, 0, 412),
(946, NULL, NULL, NULL, 1, 0, 266),
(947, NULL, NULL, NULL, 1, 0, 129),
(948, NULL, NULL, NULL, 1, 0, 266),
(949, NULL, NULL, NULL, NULL, 1, 418),
(950, 18, NULL, NULL, NULL, 0, 418),
(951, NULL, NULL, NULL, 1, 0, 102),
(952, 17, NULL, NULL, NULL, 0, 418),
(953, 13, NULL, NULL, NULL, 0, 418),
(954, 19, NULL, NULL, NULL, 0, 418),
(955, NULL, NULL, NULL, 1, 0, 403),
(956, NULL, NULL, NULL, 1, 0, 244),
(957, NULL, NULL, NULL, 1, 0, 286),
(958, NULL, NULL, NULL, 1, 0, 286),
(959, NULL, NULL, NULL, 1, 0, 87),
(960, NULL, NULL, NULL, 1, 0, 398),
(961, NULL, NULL, NULL, 1, 0, 113),
(962, NULL, NULL, NULL, 1, 0, 234),
(963, NULL, NULL, NULL, 1, 0, 267),
(964, NULL, NULL, NULL, 1, 0, 401),
(965, NULL, NULL, NULL, 1, 0, 303),
(966, NULL, NULL, NULL, 1, 0, 403),
(967, NULL, NULL, NULL, 1, 0, 300),
(968, NULL, NULL, NULL, 1, 0, 234),
(969, NULL, NULL, NULL, 1, 0, 234),
(970, NULL, NULL, NULL, 1, 0, 234),
(971, NULL, NULL, NULL, 1, 0, 129),
(972, NULL, NULL, NULL, 1, 0, 206),
(973, NULL, NULL, NULL, 1, 0, 92),
(974, NULL, NULL, NULL, 1, 0, 241),
(975, NULL, NULL, NULL, 1, 0, 386),
(976, NULL, NULL, NULL, 1, 0, 329),
(977, NULL, NULL, NULL, 1, 0, 401),
(978, NULL, NULL, NULL, 1, 0, 458),
(979, NULL, NULL, NULL, 1, 0, 189),
(980, NULL, NULL, NULL, 1, 0, 178),
(981, NULL, NULL, NULL, 1, 0, 458),
(982, NULL, NULL, NULL, 1, 0, 475),
(983, NULL, NULL, NULL, 1, 0, 163),
(984, NULL, NULL, NULL, 1, 0, 178),
(985, NULL, NULL, NULL, 1, 0, 236),
(986, NULL, NULL, NULL, 1, 0, 161),
(987, NULL, NULL, NULL, 1, 0, 92),
(988, NULL, NULL, NULL, 1, 0, 390),
(989, NULL, NULL, NULL, 1, 0, 129),
(990, NULL, NULL, NULL, 1, 0, 97),
(991, NULL, NULL, NULL, 1, 0, 390),
(992, NULL, NULL, NULL, 1, 0, 390),
(993, NULL, NULL, NULL, 1, 0, 163),
(994, NULL, NULL, NULL, 1, 0, 386),
(995, NULL, NULL, NULL, 1, 0, 386),
(996, NULL, NULL, NULL, 1, 0, 300),
(997, NULL, NULL, NULL, 1, 0, 401),
(998, NULL, NULL, NULL, 1, 0, 214),
(999, NULL, NULL, NULL, 1, 0, 387),
(1000, NULL, NULL, NULL, 1, 0, 401),
(1001, NULL, NULL, NULL, 1, 0, 163),
(1002, NULL, NULL, NULL, 1, 0, 258),
(1004, NULL, NULL, NULL, 1, 0, 304),
(1005, NULL, NULL, NULL, 1, 0, 238),
(1006, NULL, NULL, NULL, 1, 0, 129),
(1007, NULL, NULL, NULL, 1, 0, 401),
(1008, NULL, NULL, NULL, 1, 0, 477),
(1009, NULL, NULL, NULL, 1, 0, 330),
(1010, NULL, NULL, NULL, 1, 0, 477),
(1011, NULL, NULL, NULL, 1, 0, 477),
(1012, NULL, NULL, NULL, 1, 0, 256),
(1013, NULL, NULL, NULL, 1, 0, 386),
(1014, NULL, NULL, NULL, 1, 0, 277),
(1015, NULL, NULL, NULL, 1, 0, 129),
(1016, NULL, NULL, NULL, 1, 0, 470),
(1017, NULL, NULL, NULL, 1, 0, 98),
(1018, NULL, NULL, NULL, 1, 0, 455),
(1019, NULL, NULL, NULL, 1, 0, 377),
(1020, NULL, NULL, NULL, 1, 0, 208),
(1021, NULL, NULL, NULL, 1, 0, 129),
(1022, NULL, NULL, NULL, 1, 0, 129),
(1023, NULL, NULL, NULL, 1, 0, 386),
(1024, NULL, NULL, NULL, 1, 0, 386),
(1025, NULL, NULL, NULL, 1, 0, 98),
(1026, NULL, NULL, NULL, 1, 0, 97),
(1027, NULL, NULL, NULL, NULL, 1, 54),
(1028, NULL, NULL, NULL, 1, 0, 129),
(1029, 11, NULL, NULL, NULL, 0, 54),
(1030, NULL, NULL, NULL, 1, 0, 304),
(1031, NULL, NULL, NULL, 1, 0, 98),
(1032, NULL, NULL, NULL, 1, 0, 386),
(1033, NULL, NULL, NULL, 1, 0, 386),
(1034, NULL, NULL, NULL, 1, 0, 413),
(1035, NULL, NULL, NULL, 1, 0, 234),
(1036, NULL, NULL, NULL, 1, 0, 234),
(1037, NULL, NULL, NULL, 1, 0, 234),
(1038, NULL, NULL, NULL, 1, 0, 234),
(1039, NULL, NULL, NULL, 1, 0, 234),
(1040, NULL, NULL, NULL, 1, 0, 234),
(1041, NULL, NULL, NULL, 1, 0, 395),
(1042, NULL, NULL, NULL, 1, 0, 126),
(1043, NULL, NULL, NULL, 1, 0, 254),
(1044, NULL, NULL, NULL, 2, 0, 445),
(1045, NULL, NULL, NULL, 1, 0, 129),
(1046, NULL, NULL, NULL, 1, 0, 450),
(1047, NULL, NULL, NULL, 2, 0, 445),
(1048, NULL, NULL, NULL, 1, 0, 244),
(1049, NULL, NULL, NULL, 1, 0, 98),
(1050, NULL, NULL, NULL, 1, 0, 386),
(1051, NULL, NULL, NULL, 1, 0, 413),
(1052, NULL, NULL, NULL, 1, 0, 304),
(1053, NULL, NULL, NULL, 1, 0, 387),
(1054, NULL, NULL, NULL, 1, 0, 195),
(1055, NULL, NULL, NULL, 1, 0, 129),
(1056, NULL, NULL, NULL, 1, 0, 129),
(1057, NULL, NULL, NULL, 1, 0, 375),
(1058, NULL, NULL, NULL, 1, 0, 214),
(1059, NULL, NULL, NULL, 1, 0, 404),
(1060, NULL, NULL, NULL, 1, 0, 275),
(1061, NULL, NULL, NULL, 1, 0, 314),
(1062, NULL, NULL, NULL, 1, 0, 129),
(1063, NULL, NULL, NULL, 1, 0, 97),
(1064, NULL, NULL, NULL, 1, 0, 129),
(1065, NULL, NULL, NULL, 1, 0, 129),
(1066, NULL, NULL, NULL, 1, 0, 380),
(1067, NULL, NULL, NULL, 1, 0, 129),
(1068, NULL, NULL, NULL, 1, 0, 98),
(1069, NULL, NULL, NULL, 1, 0, 292),
(1070, NULL, NULL, NULL, 1, 0, 386),
(1071, NULL, NULL, NULL, 1, 0, 241),
(1072, NULL, NULL, NULL, 1, 0, 129),
(1073, NULL, NULL, NULL, 1, 0, 129),
(1074, NULL, NULL, NULL, 1, 0, 458),
(1075, NULL, NULL, NULL, 1, 0, 458),
(1076, NULL, NULL, NULL, 1, 0, 275),
(1077, NULL, NULL, NULL, NULL, 1, 334),
(1078, NULL, NULL, NULL, 1, 0, 206),
(1079, NULL, NULL, NULL, 1, 0, 129),
(1080, NULL, NULL, NULL, 1, 0, 129),
(1081, NULL, NULL, NULL, 1, 0, 386),
(1082, NULL, NULL, NULL, 1, 0, 413),
(1083, NULL, NULL, NULL, 1, 0, 386),
(1084, NULL, NULL, NULL, 1, 0, 97),
(1085, NULL, NULL, NULL, 1, 0, 97),
(1086, NULL, NULL, NULL, 1, 0, 97),
(1087, NULL, NULL, NULL, 1, 0, 97),
(1088, NULL, NULL, NULL, NULL, 1, 254),
(1089, 21, NULL, NULL, NULL, 0, 254),
(1090, NULL, 28, NULL, NULL, 0, 254),
(1091, NULL, 27, NULL, NULL, 0, 254),
(1092, NULL, NULL, NULL, 1, 0, 97),
(1093, NULL, NULL, NULL, 4, 0, 158),
(1094, NULL, NULL, NULL, 1, 0, 158),
(1095, NULL, NULL, NULL, 1, 0, 158),
(1096, NULL, NULL, NULL, 1, 0, 450),
(1097, NULL, NULL, NULL, 4, 0, 459),
(1098, NULL, NULL, NULL, 1, 0, 241),
(1100, NULL, NULL, NULL, 1, 0, 195),
(1101, NULL, NULL, NULL, 4, 0, 158),
(1102, NULL, NULL, NULL, 1, 0, 256),
(1103, NULL, NULL, NULL, 1, 0, 199),
(1104, NULL, NULL, NULL, 4, 0, 158),
(1105, NULL, NULL, NULL, 4, 0, 199),
(1106, NULL, NULL, NULL, 4, 0, 241),
(1113, NULL, NULL, NULL, 1, 0, 97),
(1114, NULL, NULL, NULL, 1, 0, 199),
(1115, NULL, NULL, NULL, 4, 0, 97),
(1116, NULL, NULL, NULL, 4, 0, 97),
(1117, NULL, NULL, NULL, 4, 0, 375),
(1118, NULL, NULL, NULL, 1, 0, 380),
(1119, NULL, NULL, NULL, 4, 0, 234),
(1120, NULL, NULL, NULL, 4, 0, 214),
(1121, NULL, NULL, NULL, 1, 0, 264),
(1122, NULL, NULL, NULL, 4, 0, 214),
(1123, NULL, NULL, NULL, 1, 0, 199),
(1124, NULL, NULL, NULL, 1, 0, 264),
(1126, NULL, NULL, NULL, 1, 0, 258),
(1127, NULL, NULL, NULL, 4, 0, 478),
(1128, NULL, NULL, NULL, 4, 0, 199),
(1129, NULL, NULL, NULL, 4, 0, 377),
(1130, NULL, NULL, NULL, 1, 0, 195),
(1131, NULL, NULL, NULL, 1, 0, 396),
(1132, NULL, NULL, NULL, 1, 0, 461),
(1133, NULL, NULL, NULL, 1, 0, 404),
(1134, NULL, NULL, NULL, 4, 0, 461),
(1135, NULL, NULL, NULL, 1, 0, 199),
(1136, NULL, NULL, NULL, 4, 0, 461),
(1137, NULL, NULL, NULL, 4, 0, 396),
(1138, NULL, NULL, NULL, 4, 0, 199),
(1139, NULL, NULL, NULL, 1, 0, 138),
(1140, NULL, NULL, NULL, 1, 0, 238),
(1141, NULL, NULL, NULL, NULL, 1, 238),
(1142, 10, NULL, NULL, NULL, 0, 238),
(1143, 17, NULL, NULL, NULL, 0, 238),
(1144, NULL, NULL, NULL, 1, 0, 267),
(1145, NULL, NULL, NULL, 1, 0, 267),
(1146, NULL, NULL, NULL, 4, 0, 396),
(1149, NULL, NULL, NULL, 1, 0, 405),
(1151, NULL, NULL, NULL, 4, 0, 292),
(1161, NULL, NULL, NULL, NULL, 1, 431),
(1162, NULL, NULL, NULL, NULL, 1, 431),
(1163, 20, NULL, NULL, NULL, 0, 431),
(1164, NULL, NULL, NULL, 1, 0, 431),
(1166, NULL, NULL, NULL, 1, 0, 479),
(1167, NULL, NULL, NULL, 1, 0, 479),
(1168, NULL, NULL, NULL, 4, 0, 480),
(1169, NULL, NULL, NULL, NULL, 1, 480),
(1170, NULL, NULL, NULL, 1, 0, 297),
(1171, NULL, NULL, NULL, 1, 0, 324),
(1172, NULL, NULL, NULL, 4, 0, 324),
(1173, NULL, NULL, NULL, 1, 0, 255),
(1175, NULL, NULL, NULL, NULL, 1, 481),
(1176, 11, NULL, NULL, NULL, 0, 481),
(1177, 13, NULL, NULL, NULL, 0, 481),
(1178, 20, NULL, NULL, NULL, 0, 481),
(1179, NULL, NULL, NULL, 1, 0, 481),
(1180, NULL, NULL, NULL, 4, 0, 481),
(1181, NULL, NULL, NULL, 3, 0, 481),
(1182, NULL, NULL, NULL, 4, 0, 391),
(1183, NULL, NULL, NULL, NULL, 1, 391),
(1184, NULL, NULL, NULL, 1, 0, 324),
(1186, NULL, NULL, NULL, 1, 0, 391),
(1192, NULL, NULL, NULL, 1, 0, 380),
(1193, NULL, NULL, NULL, 1, 0, 324),
(1194, NULL, NULL, NULL, NULL, 1, 71),
(1195, 17, NULL, NULL, NULL, 0, 71),
(1196, NULL, 30, NULL, NULL, 0, 71),
(1197, NULL, NULL, NULL, 3, 0, 481),
(1198, NULL, NULL, NULL, 1, 0, 483),
(1199, NULL, NULL, NULL, NULL, 1, 167),
(1200, 11, NULL, NULL, NULL, 0, 167),
(1201, NULL, NULL, NULL, 4, 0, 481),
(1202, NULL, NULL, NULL, 3, 0, 481),
(1205, NULL, NULL, NULL, 1, 0, 397),
(1208, NULL, NULL, NULL, NULL, 1, 397),
(1210, NULL, NULL, NULL, NULL, 1, 24),
(1211, NULL, NULL, NULL, NULL, 1, 24),
(1212, 16, NULL, NULL, NULL, 0, 24),
(1213, NULL, NULL, NULL, NULL, 1, 397),
(1214, NULL, NULL, NULL, NULL, 1, 397),
(1215, 13, NULL, NULL, NULL, 0, 397),
(1216, NULL, NULL, NULL, NULL, 1, 397),
(1217, NULL, NULL, NULL, 1, 0, 24),
(1218, NULL, NULL, NULL, 1, 0, 24),
(1219, NULL, NULL, NULL, 2, 0, 397),
(1220, NULL, NULL, NULL, 3, 0, 397),
(1221, NULL, NULL, NULL, 1, 0, 195),
(1222, NULL, NULL, NULL, 1, 0, 97),
(1223, NULL, NULL, NULL, NULL, 1, 397),
(1224, NULL, NULL, NULL, NULL, 1, 397),
(1225, NULL, NULL, NULL, NULL, 1, 397),
(1226, 11, NULL, NULL, NULL, 0, 397),
(1227, NULL, NULL, NULL, NULL, 1, 397),
(1228, 18, NULL, NULL, NULL, 0, 397),
(1229, 16, NULL, NULL, NULL, 0, 397),
(1230, NULL, NULL, NULL, 1, 0, 397),
(1231, NULL, NULL, NULL, 1, 0, 89),
(1232, NULL, NULL, NULL, 1, 0, 437),
(1233, NULL, NULL, NULL, NULL, 1, 437),
(1234, 12, NULL, NULL, NULL, 0, 437),
(1235, NULL, NULL, NULL, 1, 0, 437),
(1236, NULL, NULL, NULL, 1, 0, 437),
(1237, NULL, NULL, NULL, 1, 0, 437),
(1238, NULL, NULL, NULL, 4, 0, 478),
(1239, NULL, NULL, NULL, NULL, 1, 485),
(1240, 17, NULL, NULL, NULL, 0, 485),
(1241, NULL, NULL, NULL, 1, 0, 437),
(1242, NULL, NULL, NULL, 1, 0, 437),
(1243, NULL, NULL, NULL, 4, 0, 437),
(1244, NULL, NULL, NULL, NULL, 1, 437),
(1245, 12, NULL, NULL, NULL, 0, 437),
(1246, NULL, NULL, NULL, NULL, 1, 1),
(1247, NULL, NULL, NULL, 1, 0, 1),
(1248, NULL, NULL, NULL, NULL, 1, 24),
(1249, NULL, NULL, NULL, 1, 0, 486),
(1250, NULL, NULL, NULL, 1, 0, 486),
(1251, NULL, NULL, NULL, 1, 0, 486),
(1252, NULL, NULL, NULL, 1, 0, 486),
(1253, NULL, NULL, NULL, 1, 0, 74),
(1254, NULL, NULL, NULL, NULL, 1, 24),
(1255, NULL, NULL, NULL, 1, 0, 195),
(1256, NULL, NULL, NULL, 1, 0, 195),
(1257, NULL, NULL, NULL, NULL, 1, 24);

-- --------------------------------------------------------

--
-- Структура таблицы `visit_control`
--

CREATE TABLE `visit_control` (
  `id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `visit_control`
--

INSERT INTO `visit_control` (`id`, `created_at`, `user_id`) VALUES
(1, '2021-09-08 12:10:46', 24),
(2, '2021-09-08 12:13:53', 24),
(3, '2021-09-08 12:27:53', 24),
(4, '2021-09-08 12:29:55', 24),
(5, '2021-09-08 13:21:18', 24),
(6, '2021-09-08 14:02:56', 24),
(7, '2021-09-08 14:03:23', 24),
(8, '2021-09-08 14:03:29', 24),
(9, '2021-09-08 14:03:55', 24),
(10, '2021-09-08 14:04:27', 24),
(11, '2021-09-08 14:06:23', 24),
(12, '2021-09-08 14:08:34', 24),
(13, '2021-09-08 14:09:22', 24),
(14, '2021-09-17 11:12:12', 91),
(15, '2021-09-17 11:12:13', 91),
(16, '2021-09-17 11:12:13', 91),
(17, '2021-09-17 11:12:13', 91),
(18, '2021-09-17 11:12:14', 91),
(19, '2021-09-17 11:12:14', 91),
(20, '2021-09-17 11:12:14', 91),
(21, '2021-09-17 11:12:14', 91),
(22, '2021-09-17 11:12:15', 91),
(23, '2021-09-17 11:12:16', 91),
(24, '2021-09-17 11:12:16', 91),
(25, '2021-09-17 11:12:18', 91),
(26, '2021-09-17 11:12:18', 91),
(27, '2021-09-17 11:12:18', 91),
(28, '2021-09-17 11:41:55', 137),
(29, '2021-09-17 11:42:15', 320),
(30, '2021-09-17 11:44:42', 386),
(31, '2021-09-17 11:50:25', 195),
(32, '2021-09-17 11:50:27', 206),
(33, '2021-09-17 11:50:36', 24),
(34, '2021-09-17 11:50:36', 159),
(35, '2021-09-17 11:50:36', 241),
(36, '2021-09-17 11:50:39', 80),
(37, '2021-09-17 11:50:42', 253),
(38, '2021-09-17 11:50:42', 132),
(39, '2021-09-17 11:50:44', 238),
(40, '2021-09-17 11:50:44', 80),
(41, '2021-09-17 11:50:45', 129),
(42, '2021-09-17 11:50:45', 183),
(43, '2021-09-17 11:50:48', 185),
(44, '2021-09-17 11:50:49', 80),
(45, '2021-09-17 11:50:53', 102),
(46, '2021-09-17 11:50:56', 80),
(47, '2021-09-17 11:50:57', 382),
(48, '2021-09-17 11:51:03', 189),
(49, '2021-09-17 11:51:04', 277),
(50, '2021-09-17 11:51:06', 292),
(51, '2021-09-17 11:51:06', 178),
(52, '2021-09-17 11:51:08', 260),
(53, '2021-09-17 11:51:08', 173),
(54, '2021-09-17 11:51:10', 80),
(55, '2021-09-17 11:51:11', 245),
(56, '2021-09-17 11:51:18', 80),
(57, '2021-09-17 11:51:23', 314),
(58, '2021-09-17 11:51:24', 335),
(59, '2021-09-17 11:51:26', 80),
(60, '2021-09-17 11:51:28', 303),
(61, '2021-09-17 11:51:32', 291),
(62, '2021-09-17 11:51:38', 126),
(63, '2021-09-17 11:51:41', 97),
(64, '2021-09-17 11:52:16', 104),
(65, '2021-09-17 11:52:16', 104),
(66, '2021-09-17 11:52:17', 104),
(67, '2021-09-17 11:52:17', 104),
(68, '2021-09-17 11:52:17', 104),
(69, '2021-09-17 11:52:17', 104),
(70, '2021-09-17 11:52:18', 104),
(71, '2021-09-17 11:52:20', 104),
(72, '2021-09-17 11:52:20', 104),
(73, '2021-09-17 11:52:21', 303),
(74, '2021-09-17 11:57:10', 430),
(75, '2021-09-17 11:57:12', 430),
(76, '2021-09-17 11:57:13', 430),
(77, '2021-09-17 11:57:13', 430),
(78, '2021-09-17 11:57:14', 430),
(79, '2021-09-17 11:57:14', 430),
(80, '2021-09-17 11:57:14', 430),
(81, '2021-09-17 11:57:14', 430),
(82, '2021-09-17 12:15:15', 286),
(83, '2021-09-17 12:15:18', 286),
(84, '2021-09-17 12:15:20', 286),
(85, '2021-09-17 12:15:20', 286),
(86, '2021-09-17 12:15:20', 286),
(87, '2021-09-17 12:15:20', 286),
(88, '2021-09-17 12:15:23', 286),
(89, '2021-09-17 12:27:03', 386),
(90, '2021-09-17 12:31:31', 173),
(91, '2021-09-17 12:32:37', 387),
(92, '2021-09-17 12:32:38', 195),
(93, '2021-09-17 12:32:44', 253),
(94, '2021-09-17 12:32:48', 185),
(95, '2021-09-17 12:32:48', 129),
(96, '2021-09-17 12:32:50', 238),
(97, '2021-09-17 12:32:51', 183),
(98, '2021-09-17 12:32:52', 102),
(99, '2021-09-17 12:32:52', 438),
(100, '2021-09-17 12:32:56', 314),
(101, '2021-09-17 12:32:57', 206),
(102, '2021-09-17 12:32:57', 181),
(103, '2021-09-17 12:32:57', 390),
(104, '2021-09-17 12:32:59', 335),
(105, '2021-09-17 12:33:01', 430),
(106, '2021-09-17 12:33:03', 97),
(107, '2021-09-17 12:33:05', 277),
(108, '2021-09-17 12:33:06', 260),
(109, '2021-09-17 12:33:06', 382),
(110, '2021-09-17 12:33:07', 244),
(111, '2021-09-17 12:33:07', 241),
(112, '2021-09-17 12:33:08', 266),
(113, '2021-09-17 12:33:09', 435),
(114, '2021-09-17 12:33:10', 340),
(115, '2021-09-17 12:33:15', 126),
(116, '2021-09-17 12:33:21', 81),
(117, '2021-09-17 12:33:22', 80),
(118, '2021-09-17 12:33:23', 378),
(119, '2021-09-17 12:33:25', 80),
(120, '2021-09-17 12:33:29', 425),
(121, '2021-09-17 12:33:32', 334),
(122, '2021-09-17 12:33:32', 291),
(123, '2021-09-17 12:33:38', 242),
(124, '2021-09-17 12:34:08', 104),
(125, '2021-09-17 12:34:08', 104),
(126, '2021-09-17 12:34:11', 303),
(127, '2021-09-17 13:03:10', 436),
(128, '2021-09-17 13:03:11', 436),
(129, '2021-09-17 13:03:11', 436),
(130, '2021-09-17 13:03:11', 436),
(131, '2021-09-17 13:03:16', 436),
(132, '2021-09-17 13:06:33', 386),
(133, '2021-09-17 13:08:25', 108),
(134, '2021-09-17 13:11:36', 80),
(135, '2021-09-17 13:11:36', 159),
(136, '2021-09-17 13:11:37', 378),
(137, '2021-09-17 13:11:37', 241),
(138, '2021-09-17 13:11:39', 100),
(139, '2021-09-17 13:11:41', 80),
(140, '2021-09-17 13:11:42', 387),
(141, '2021-09-17 13:11:43', 24),
(142, '2021-09-17 13:11:45', 304),
(143, '2021-09-17 13:11:47', 260),
(144, '2021-09-17 13:11:48', 384),
(145, '2021-09-17 13:11:49', 183),
(146, '2021-09-17 13:11:52', 390),
(147, '2021-09-17 13:11:53', 181),
(148, '2021-09-17 13:11:54', 80),
(149, '2021-09-17 13:11:56', 314),
(150, '2021-09-17 13:11:56', 178),
(151, '2021-09-17 13:11:57', 382),
(152, '2021-09-17 13:11:59', 181),
(153, '2021-09-17 13:12:00', 335),
(154, '2021-09-17 13:12:04', 206),
(155, '2021-09-17 13:12:04', 129),
(156, '2021-09-17 13:12:04', 274),
(157, '2021-09-17 13:12:05', 266),
(158, '2021-09-17 13:12:05', 277),
(159, '2021-09-17 13:12:12', 189),
(160, '2021-09-17 13:12:14', 181),
(161, '2021-09-17 13:12:16', 239),
(162, '2021-09-17 13:12:17', 436),
(163, '2021-09-17 13:12:17', 436),
(164, '2021-09-17 13:12:17', 436),
(165, '2021-09-17 13:12:18', 436),
(166, '2021-09-17 13:12:18', 436),
(167, '2021-09-17 13:12:18', 436),
(168, '2021-09-17 13:12:18', 436),
(169, '2021-09-17 13:12:18', 436),
(170, '2021-09-17 13:12:19', 436),
(171, '2021-09-17 13:12:19', 195),
(172, '2021-09-17 13:12:19', 436),
(173, '2021-09-17 13:12:19', 195),
(174, '2021-09-17 13:12:20', 436),
(175, '2021-09-17 13:12:20', 436),
(176, '2021-09-17 13:12:20', 436),
(177, '2021-09-17 13:12:20', 436),
(178, '2021-09-17 13:12:20', 436),
(179, '2021-09-17 13:12:20', 436),
(180, '2021-09-17 13:12:21', 436),
(181, '2021-09-17 13:12:21', 436),
(182, '2021-09-17 13:12:21', 436),
(183, '2021-09-17 13:12:22', 382),
(184, '2021-09-17 13:12:32', 113),
(185, '2021-09-17 13:12:33', 242),
(186, '2021-09-17 13:12:35', 98),
(187, '2021-09-17 13:13:00', 425),
(188, '2021-09-17 13:13:07', 328),
(189, '2021-09-17 13:13:10', 303),
(190, '2021-09-17 13:13:11', 104),
(191, '2021-09-17 13:14:53', 137),
(192, '2021-09-17 13:17:47', 107),
(193, '2021-09-17 13:17:47', 107),
(194, '2021-09-17 13:17:48', 107),
(195, '2021-09-17 13:17:48', 107),
(196, '2021-09-17 13:17:48', 107),
(197, '2021-09-17 13:17:48', 107),
(198, '2021-09-17 13:17:49', 107),
(199, '2021-09-17 13:17:49', 107),
(200, '2021-09-17 13:17:50', 107),
(201, '2021-09-17 13:17:57', 107),
(202, '2021-09-17 13:17:57', 107),
(203, '2021-09-17 13:17:58', 107),
(204, '2021-09-17 13:17:58', 107),
(205, '2021-09-17 13:19:05', 245),
(206, '2021-09-17 13:54:06', 421),
(207, '2021-09-17 13:54:06', 421),
(208, '2021-09-17 13:54:06', 421),
(209, '2021-09-17 13:54:06', 421),
(210, '2021-09-17 13:54:06', 421),
(211, '2021-09-17 13:54:07', 421),
(212, '2021-09-17 13:54:07', 421),
(213, '2021-09-17 13:54:07', 421),
(214, '2021-09-17 13:54:07', 421),
(215, '2021-09-17 13:54:07', 421),
(216, '2021-09-17 13:54:07', 421),
(217, '2021-09-17 13:54:08', 421),
(218, '2021-09-17 13:54:08', 421),
(219, '2021-09-17 13:54:08', 421),
(220, '2021-09-17 13:54:09', 421),
(221, '2021-09-17 13:54:09', 421),
(222, '2021-09-17 13:54:09', 421),
(223, '2021-09-17 13:54:09', 421),
(224, '2021-09-17 13:54:09', 421),
(225, '2021-09-17 13:54:09', 421),
(226, '2021-09-17 13:54:09', 421),
(227, '2021-09-17 13:54:09', 421),
(228, '2021-09-17 13:54:10', 421),
(229, '2021-09-17 13:54:10', 421),
(230, '2021-09-17 13:54:10', 421),
(231, '2021-09-17 13:54:10', 421),
(232, '2021-09-17 13:54:10', 421),
(233, '2021-09-17 13:54:11', 421),
(234, '2021-09-17 13:54:11', 421),
(235, '2021-09-17 13:54:11', 421),
(236, '2021-09-17 13:54:12', 421),
(237, '2021-09-17 13:54:12', 421),
(238, '2021-09-17 15:14:39', 201),
(239, '2021-09-17 15:14:42', 455),
(240, '2021-09-17 15:15:26', 201),
(241, '2021-09-17 15:36:17', 386),
(242, '2021-09-17 15:36:22', 382),
(243, '2021-09-17 15:36:43', 382),
(244, '2021-09-17 15:36:51', 382),
(245, '2021-09-17 15:40:32', 173),
(246, '2021-09-17 15:40:46', 195),
(247, '2021-09-17 15:41:13', 403),
(248, '2021-09-17 15:41:24', 206),
(249, '2021-09-17 15:41:42', 378),
(250, '2021-09-17 15:41:42', 378),
(251, '2021-09-17 15:41:42', 378),
(252, '2021-09-17 15:41:42', 378),
(253, '2021-09-17 15:41:42', 378),
(254, '2021-09-17 15:41:42', 378),
(255, '2021-09-17 15:41:42', 378),
(256, '2021-09-17 15:41:43', 378),
(257, '2021-09-17 15:41:43', 378),
(258, '2021-09-17 15:41:43', 173),
(259, '2021-09-17 15:41:43', 378),
(260, '2021-09-17 15:41:43', 183),
(261, '2021-09-17 15:41:43', 435),
(262, '2021-09-17 15:41:43', 387),
(263, '2021-09-17 15:41:43', 129),
(264, '2021-09-17 15:41:44', 183),
(265, '2021-09-17 15:41:44', 129),
(266, '2021-09-17 15:41:44', 435),
(267, '2021-09-17 15:41:47', 435),
(268, '2021-09-17 15:41:47', 435),
(269, '2021-09-17 15:41:53', 107),
(270, '2021-09-17 15:41:54', 375),
(271, '2021-09-17 15:41:57', 246),
(272, '2021-09-17 15:41:58', 314),
(273, '2021-09-17 15:41:59', 260),
(274, '2021-09-17 15:42:00', 135),
(275, '2021-09-17 15:42:02', 241),
(276, '2021-09-17 15:42:03', 126),
(277, '2021-09-17 15:42:06', 398),
(278, '2021-09-17 15:42:17', 403),
(279, '2021-09-17 15:42:21', 185),
(280, '2021-09-17 15:42:22', 277),
(281, '2021-09-17 15:42:23', 328),
(282, '2021-09-17 15:42:23', 104),
(283, '2021-09-17 15:42:26', 24),
(284, '2021-09-17 15:42:27', 437),
(285, '2021-09-17 15:42:28', 81),
(286, '2021-09-17 15:42:28', 303),
(287, '2021-09-17 15:42:29', 159),
(288, '2021-09-17 15:42:33', 406),
(289, '2021-09-17 15:42:38', 335),
(290, '2021-09-17 15:42:39', 178),
(291, '2021-09-17 15:42:40', 241),
(292, '2021-09-17 16:00:27', 98),
(293, '2021-09-17 16:00:32', 98),
(294, '2021-09-17 16:00:33', 98),
(295, '2021-09-17 16:00:34', 98),
(296, '2021-09-17 16:00:35', 98),
(297, '2021-09-17 16:00:39', 98),
(298, '2021-09-17 16:00:44', 98),
(299, '2021-09-17 16:00:44', 98),
(300, '2021-09-17 16:00:44', 98),
(301, '2021-09-17 16:00:45', 98),
(302, '2021-09-17 16:00:47', 98),
(303, '2021-09-17 16:00:47', 98),
(304, '2021-09-17 16:00:47', 98),
(305, '2021-09-17 16:00:47', 98),
(306, '2021-09-17 16:00:48', 98),
(307, '2021-09-17 16:00:51', 98),
(308, '2021-09-17 16:01:20', 98),
(309, '2021-09-17 16:01:20', 98),
(310, '2021-09-17 16:01:20', 98),
(311, '2021-09-17 16:01:20', 98),
(312, '2021-09-17 16:01:21', 98),
(313, '2021-09-17 16:01:21', 98),
(314, '2021-09-17 16:01:22', 98),
(315, '2021-09-17 16:01:22', 98),
(316, '2021-09-17 16:01:23', 98),
(317, '2021-09-17 16:01:23', 98),
(318, '2021-09-17 16:01:26', 98),
(319, '2021-09-17 16:01:26', 98),
(320, '2021-09-17 16:01:26', 98),
(321, '2021-09-17 16:01:27', 98),
(322, '2021-09-17 16:01:28', 98),
(323, '2021-09-17 16:01:33', 98),
(324, '2021-09-17 16:01:36', 98),
(325, '2021-09-17 16:01:36', 98),
(326, '2021-09-17 16:01:36', 98),
(327, '2021-09-17 16:01:37', 98),
(328, '2021-09-17 16:01:38', 98),
(329, '2021-09-17 16:01:38', 98),
(330, '2021-09-17 16:01:38', 98),
(331, '2021-09-17 16:01:38', 98),
(332, '2021-09-17 16:01:41', 98),
(333, '2021-09-17 16:01:41', 98),
(334, '2021-09-17 16:01:42', 98),
(335, '2021-09-17 16:01:43', 98),
(336, '2021-09-17 16:01:46', 98),
(337, '2021-09-17 16:02:24', 98),
(338, '2021-09-17 16:02:48', 98),
(339, '2021-09-17 16:02:51', 98),
(340, '2021-09-17 16:02:56', 98),
(341, '2021-09-17 16:02:58', 98),
(342, '2021-09-17 16:02:58', 98),
(343, '2021-09-17 16:02:58', 98),
(344, '2021-09-17 16:02:58', 98),
(345, '2021-09-17 16:02:58', 98),
(346, '2021-09-17 16:03:15', 98),
(347, '2021-09-17 16:03:16', 98),
(348, '2021-09-17 16:17:49', 108),
(349, '2021-09-17 16:23:09', 386),
(350, '2021-09-17 16:27:32', 173),
(351, '2021-09-17 16:27:39', 195),
(352, '2021-09-17 16:28:40', 378),
(353, '2021-09-17 16:28:44', 183),
(354, '2021-09-17 16:28:46', 173),
(355, '2021-09-17 16:28:47', 304),
(356, '2021-09-17 16:28:47', 304),
(357, '2021-09-17 16:28:50', 277),
(358, '2021-09-17 16:28:52', 236),
(359, '2021-09-17 16:28:57', 375),
(360, '2021-09-17 16:28:57', 314),
(361, '2021-09-17 16:28:58', 302),
(362, '2021-09-17 16:29:02', 206),
(363, '2021-09-17 16:29:09', 377),
(364, '2021-09-17 16:29:09', 377),
(365, '2021-09-17 16:29:09', 169),
(366, '2021-09-17 16:29:09', 377),
(367, '2021-09-17 16:29:11', 129),
(368, '2021-09-17 16:29:21', 275),
(369, '2021-09-17 16:29:21', 398),
(370, '2021-09-17 16:29:22', 189),
(371, '2021-09-17 16:29:25', 135),
(372, '2021-09-17 16:29:25', 437),
(373, '2021-09-17 16:29:26', 387),
(374, '2021-09-17 16:29:28', 241),
(375, '2021-09-17 16:29:28', 24),
(376, '2021-09-17 16:29:29', 178),
(377, '2021-09-17 16:29:30', 303),
(378, '2021-09-17 16:29:30', 159),
(379, '2021-09-17 16:29:30', 245),
(380, '2021-09-17 16:29:33', 185),
(381, '2021-09-17 16:29:34', 249),
(382, '2021-09-17 16:29:38', 335),
(383, '2021-09-17 16:29:45', 104),
(384, '2021-09-17 16:29:45', 104),
(385, '2021-09-17 16:29:45', 104),
(386, '2021-09-17 16:29:45', 104),
(387, '2021-09-17 16:29:45', 104),
(388, '2021-09-17 16:29:45', 104),
(389, '2021-09-17 16:29:45', 104),
(390, '2021-09-17 16:29:45', 104),
(391, '2021-09-17 16:29:45', 104),
(392, '2021-09-17 16:29:45', 104),
(393, '2021-09-17 16:29:46', 104),
(394, '2021-09-17 16:29:46', 104),
(395, '2021-09-17 16:29:46', 104),
(396, '2021-09-17 16:29:46', 104),
(397, '2021-09-17 16:29:46', 104),
(398, '2021-09-17 16:35:23', 406),
(399, '2021-09-17 16:35:23', 406),
(400, '2021-09-17 16:35:24', 406),
(401, '2021-09-17 16:35:25', 406),
(402, '2021-09-17 16:35:25', 406),
(403, '2021-09-17 16:35:25', 406),
(404, '2021-09-17 16:35:26', 406),
(405, '2021-09-17 16:35:26', 406),
(406, '2021-09-17 16:35:27', 406),
(407, '2021-09-17 16:35:27', 406),
(408, '2021-09-17 16:35:27', 406),
(409, '2021-09-17 16:35:29', 406),
(410, '2021-09-17 16:35:29', 406),
(411, '2021-09-17 16:35:29', 406),
(412, '2021-09-17 16:56:30', 458),
(413, '2021-09-17 17:13:16', 403),
(414, '2021-09-17 17:13:16', 403),
(415, '2021-09-17 17:13:16', 403),
(416, '2021-09-17 17:13:17', 403),
(417, '2021-09-17 17:13:17', 403),
(418, '2021-09-17 17:13:17', 403),
(419, '2021-09-17 17:13:17', 403),
(420, '2021-09-17 17:13:29', 173),
(421, '2021-09-17 17:13:33', 403),
(422, '2021-09-17 17:14:14', 195),
(423, '2021-09-17 17:14:42', 173),
(424, '2021-09-17 17:14:45', 183),
(425, '2021-09-17 17:14:47', 304),
(426, '2021-09-17 17:14:47', 304),
(427, '2021-09-17 17:14:53', 236),
(428, '2021-09-17 17:14:56', 181),
(429, '2021-09-17 17:14:59', 206),
(430, '2021-09-17 17:15:02', 97),
(431, '2021-09-17 17:15:04', 292),
(432, '2021-09-17 17:15:09', 169),
(433, '2021-09-17 17:15:21', 275),
(434, '2021-09-17 17:15:21', 378),
(435, '2021-09-17 17:15:23', 377),
(436, '2021-09-17 17:15:27', 304),
(437, '2021-09-17 17:15:32', 241),
(438, '2021-09-17 17:15:33', 80),
(439, '2021-09-17 17:15:33', 387),
(440, '2021-09-17 17:15:48', 104),
(441, '2021-09-17 17:15:48', 104),
(442, '2021-09-17 17:16:29', 303),
(443, '2021-09-17 17:29:30', 108),
(444, '2021-09-17 17:33:57', 437),
(445, '2021-09-17 17:33:58', 437),
(446, '2021-09-17 17:33:59', 437),
(447, '2021-09-17 17:33:59', 437),
(448, '2021-09-17 17:33:59', 437),
(449, '2021-09-17 17:34:00', 437),
(450, '2021-09-17 18:29:29', 406),
(451, '2021-09-17 18:29:29', 406),
(452, '2021-09-17 18:29:31', 406),
(453, '2021-09-17 18:29:31', 406),
(454, '2021-09-18 08:36:12', 436),
(455, '2021-09-18 09:03:15', 386),
(456, '2021-09-18 09:08:33', 437),
(457, '2021-09-18 09:08:44', 275),
(458, '2021-09-18 09:08:46', 213),
(459, '2021-09-18 09:08:47', 398),
(460, '2021-09-18 09:08:54', 303),
(461, '2021-09-18 09:09:00', 291),
(462, '2021-09-18 09:09:06', 189),
(463, '2021-09-18 09:09:11', 104),
(464, '2021-09-18 09:09:19', 98),
(465, '2021-09-18 09:09:26', 244),
(466, '2021-09-18 09:09:28', 169),
(467, '2021-09-18 09:09:31', 314),
(468, '2021-09-18 09:09:32', 24),
(469, '2021-09-18 09:09:45', 386),
(470, '2021-09-18 09:10:00', 329),
(471, '2021-09-18 09:10:04', 377),
(472, '2021-09-18 09:10:27', 471),
(473, '2021-09-18 09:22:54', 234),
(474, '2021-09-18 09:22:54', 234),
(475, '2021-09-18 09:22:54', 234),
(476, '2021-09-18 09:22:54', 234),
(477, '2021-09-18 09:22:54', 234),
(478, '2021-09-18 09:35:41', 458),
(479, '2021-09-18 10:01:56', 201),
(480, '2021-09-18 10:04:16', 386),
(481, '2021-09-18 10:08:46', 195),
(482, '2021-09-18 10:08:48', 108),
(483, '2021-09-18 10:09:33', 437),
(484, '2021-09-18 10:09:41', 398),
(485, '2021-09-18 10:09:41', 329),
(486, '2021-09-18 10:09:43', 103),
(487, '2021-09-18 10:09:43', 314),
(488, '2021-09-18 10:09:46', 213),
(489, '2021-09-18 10:09:56', 189),
(490, '2021-09-18 10:10:00', 275),
(491, '2021-09-18 10:10:05', 241),
(492, '2021-09-18 10:10:05', 129),
(493, '2021-09-18 10:10:08', 386),
(494, '2021-09-18 10:10:12', 199),
(495, '2021-09-18 10:10:14', 450),
(496, '2021-09-18 10:10:31', 334),
(497, '2021-09-18 10:10:31', 214),
(498, '2021-09-18 10:10:31', 334),
(499, '2021-09-18 10:10:31', 334),
(500, '2021-09-18 10:10:31', 334),
(501, '2021-09-18 10:10:32', 334),
(502, '2021-09-18 10:10:32', 334),
(503, '2021-09-18 10:10:32', 206),
(504, '2021-09-18 10:10:32', 206),
(505, '2021-09-18 10:10:32', 241),
(506, '2021-09-18 10:10:32', 214),
(507, '2021-09-18 10:10:32', 169),
(508, '2021-09-18 10:10:32', 334),
(509, '2021-09-18 10:10:32', 241),
(510, '2021-09-18 10:10:32', 206),
(511, '2021-09-18 10:10:32', 169),
(512, '2021-09-18 10:10:32', 334),
(513, '2021-09-18 10:10:32', 169),
(514, '2021-09-18 10:10:32', 258),
(515, '2021-09-18 10:10:32', 258),
(516, '2021-09-18 10:10:32', 206),
(517, '2021-09-18 10:10:33', 334),
(518, '2021-09-18 10:10:33', 334),
(519, '2021-09-18 10:10:33', 241),
(520, '2021-09-18 10:10:33', 334),
(521, '2021-09-18 10:10:34', 258),
(522, '2021-09-18 10:10:34', 258),
(523, '2021-09-18 10:10:34', 206),
(524, '2021-09-18 10:10:34', 334),
(525, '2021-09-18 10:10:34', 258),
(526, '2021-09-18 10:10:48', 377),
(527, '2021-09-18 10:10:57', 396),
(528, '2021-09-18 10:11:16', 471),
(529, '2021-09-18 10:11:46', 468),
(530, '2021-09-18 10:23:36', 234),
(531, '2021-09-18 10:23:36', 234),
(532, '2021-09-18 10:23:36', 234),
(533, '2021-09-18 10:23:36', 234),
(534, '2021-09-18 10:23:36', 234),
(535, '2021-09-18 10:23:36', 234),
(536, '2021-09-18 10:23:36', 234),
(537, '2021-09-18 10:23:36', 234),
(538, '2021-09-18 10:23:37', 234),
(539, '2021-09-18 10:23:37', 234),
(540, '2021-09-18 10:23:37', 234),
(541, '2021-09-18 10:23:37', 234),
(542, '2021-09-18 10:23:37', 234),
(543, '2021-09-18 10:36:41', 458),
(544, '2021-09-18 10:40:57', 201),
(545, '2021-09-18 11:02:45', 471),
(546, '2021-09-18 11:03:26', 468),
(547, '2021-09-18 11:05:15', 386),
(548, '2021-09-18 11:09:55', 108),
(549, '2021-09-18 11:10:04', 195),
(550, '2021-09-18 11:10:27', 185),
(551, '2021-09-18 11:10:32', 291),
(552, '2021-09-18 11:10:39', 158),
(553, '2021-09-18 11:10:41', 267),
(554, '2021-09-18 11:10:43', 304),
(555, '2021-09-18 11:10:44', 304),
(556, '2021-09-18 11:10:45', 304),
(557, '2021-09-18 11:10:45', 304),
(558, '2021-09-18 11:10:47', 213),
(559, '2021-09-18 11:10:48', 304),
(560, '2021-09-18 11:10:48', 304),
(561, '2021-09-18 11:10:48', 189),
(562, '2021-09-18 11:10:52', 398),
(563, '2021-09-18 11:10:53', 214),
(564, '2021-09-18 11:10:57', 87),
(565, '2021-09-18 11:10:58', 396),
(566, '2021-09-18 11:11:01', 329),
(567, '2021-09-18 11:11:01', 303),
(568, '2021-09-18 11:11:09', 24),
(569, '2021-09-18 11:11:11', 258),
(570, '2021-09-18 11:11:16', 314),
(571, '2021-09-18 11:11:18', 334),
(572, '2021-09-18 11:11:19', 199),
(573, '2021-09-18 11:11:19', 129),
(574, '2021-09-18 11:11:20', 241),
(575, '2021-09-18 11:11:20', 98),
(576, '2021-09-18 11:11:22', 24),
(577, '2021-09-18 11:11:23', 241),
(578, '2021-09-18 11:11:27', 169),
(579, '2021-09-18 11:11:31', 206),
(580, '2021-09-18 11:11:32', 377),
(581, '2021-09-18 11:11:33', 386),
(582, '2021-09-18 11:11:48', 102),
(583, '2021-09-18 11:13:47', 266),
(584, '2021-09-18 11:24:46', 234),
(585, '2021-09-18 11:24:46', 234),
(586, '2021-09-18 11:24:46', 234),
(587, '2021-09-18 11:24:46', 234),
(588, '2021-09-18 11:24:46', 234),
(589, '2021-09-18 11:24:47', 234),
(590, '2021-09-18 11:24:47', 234),
(591, '2021-09-18 11:24:47', 234),
(592, '2021-09-18 11:38:38', 458),
(593, '2021-09-18 11:41:44', 471),
(594, '2021-09-18 11:46:23', 468),
(595, '2021-09-18 11:46:24', 468),
(596, '2021-09-18 11:46:26', 468),
(597, '2021-09-18 11:56:27', 386),
(598, '2021-09-18 12:00:51', 195),
(599, '2021-09-18 12:01:25', 185),
(600, '2021-09-18 12:01:35', 292),
(601, '2021-09-18 12:01:38', 158),
(602, '2021-09-18 12:01:42', 387),
(603, '2021-09-18 12:01:43', 178),
(604, '2021-09-18 12:01:48', 398),
(605, '2021-09-18 12:01:51', 329),
(606, '2021-09-18 12:01:54', 189),
(607, '2021-09-18 12:01:54', 271),
(608, '2021-09-18 12:02:00', 304),
(609, '2021-09-18 12:02:00', 304),
(610, '2021-09-18 12:02:01', 304),
(611, '2021-09-18 12:02:07', 396),
(612, '2021-09-18 12:02:07', 390),
(613, '2021-09-18 12:02:07', 267),
(614, '2021-09-18 12:02:08', 244),
(615, '2021-09-18 12:02:09', 386),
(616, '2021-09-18 12:02:09', 104),
(617, '2021-09-18 12:02:10', 199),
(618, '2021-09-18 12:02:14', 275),
(619, '2021-09-18 12:02:15', 236),
(620, '2021-09-18 12:02:16', 314),
(621, '2021-09-18 12:02:18', 214),
(622, '2021-09-18 12:02:20', 98),
(623, '2021-09-18 12:02:23', 253),
(624, '2021-09-18 12:02:28', 206),
(625, '2021-09-18 12:02:30', 258),
(626, '2021-09-18 12:02:33', 213),
(627, '2021-09-18 12:02:34', 334),
(628, '2021-09-18 12:02:43', 256),
(629, '2021-09-18 12:02:56', 450),
(630, '2021-09-18 12:11:07', 108),
(631, '2021-09-18 12:11:16', 475),
(632, '2021-09-18 12:15:37', 234),
(633, '2021-09-18 12:15:37', 234),
(634, '2021-09-18 12:15:37', 234),
(635, '2021-09-18 12:15:37', 234),
(636, '2021-09-18 12:15:37', 234),
(637, '2021-09-18 12:15:37', 234),
(638, '2021-09-18 12:15:37', 234),
(639, '2021-09-18 12:15:37', 234),
(640, '2021-09-18 12:15:37', 234),
(641, '2021-09-18 12:15:37', 234),
(642, '2021-09-18 12:15:37', 234),
(643, '2021-09-18 12:15:37', 234),
(644, '2021-09-18 12:15:37', 234),
(645, '2021-09-18 12:15:37', 234),
(646, '2021-09-18 12:15:37', 234),
(647, '2021-09-18 12:15:37', 234),
(648, '2021-09-18 12:15:38', 234),
(649, '2021-09-18 12:15:38', 234),
(650, '2021-09-18 12:15:38', 234),
(651, '2021-09-18 12:15:38', 234),
(652, '2021-09-18 12:15:38', 234),
(653, '2021-09-18 12:15:38', 234),
(654, '2021-09-18 12:15:38', 234),
(655, '2021-09-18 12:15:42', 234),
(656, '2021-09-18 12:15:42', 234),
(657, '2021-09-18 12:15:42', 234),
(658, '2021-09-18 12:15:42', 234),
(659, '2021-09-18 12:15:42', 234),
(660, '2021-09-18 12:15:42', 234),
(661, '2021-09-18 12:15:42', 234),
(662, '2021-09-18 12:15:42', 234),
(663, '2021-09-18 12:15:42', 234),
(664, '2021-09-18 12:15:42', 234),
(665, '2021-09-18 12:15:42', 234),
(666, '2021-09-18 12:15:42', 234),
(667, '2021-09-18 12:15:42', 234),
(668, '2021-09-18 12:15:42', 234),
(669, '2021-09-18 12:15:42', 234),
(670, '2021-09-18 12:15:42', 234),
(671, '2021-09-18 12:15:42', 234),
(672, '2021-09-18 12:15:42', 234),
(673, '2021-09-18 12:15:47', 234),
(674, '2021-09-18 12:15:47', 234),
(675, '2021-09-18 12:15:47', 234),
(676, '2021-09-18 12:15:47', 234),
(677, '2021-09-18 12:15:47', 234),
(678, '2021-09-18 12:15:47', 234),
(679, '2021-09-18 12:15:47', 234),
(680, '2021-09-18 12:15:47', 234),
(681, '2021-09-18 12:15:47', 234),
(682, '2021-09-18 12:15:47', 234),
(683, '2021-09-18 12:15:47', 234),
(684, '2021-09-18 12:15:47', 234),
(685, '2021-09-18 12:15:47', 234),
(686, '2021-09-18 12:15:47', 234),
(687, '2021-09-18 12:15:47', 234),
(688, '2021-09-18 12:15:48', 234),
(689, '2021-09-18 12:15:48', 234),
(690, '2021-09-18 12:15:48', 234),
(691, '2021-09-18 12:15:48', 234),
(692, '2021-09-18 12:15:48', 234),
(693, '2021-09-18 12:15:48', 234),
(694, '2021-09-18 12:29:39', 458),
(695, '2021-09-18 12:35:31', 386),
(696, '2021-09-18 12:40:08', 195),
(697, '2021-09-18 12:40:23', 185),
(698, '2021-09-18 12:40:37', 158),
(699, '2021-09-18 12:40:44', 398),
(700, '2021-09-18 12:40:51', 387),
(701, '2021-09-18 12:41:01', 396),
(702, '2021-09-18 12:41:01', 206),
(703, '2021-09-18 12:41:07', 390),
(704, '2021-09-18 12:41:08', 189),
(705, '2021-09-18 12:41:09', 386),
(706, '2021-09-18 12:41:10', 236),
(707, '2021-09-18 12:41:16', 314),
(708, '2021-09-18 12:41:16', 275),
(709, '2021-09-18 12:41:20', 98),
(710, '2021-09-18 12:41:25', 241),
(711, '2021-09-18 12:41:27', 303),
(712, '2021-09-18 12:41:27', 169),
(713, '2021-09-18 12:41:28', 213),
(714, '2021-09-18 12:41:30', 214),
(715, '2021-09-18 12:41:37', 450),
(716, '2021-09-18 12:41:43', 102),
(717, '2021-09-18 12:41:58', 129),
(718, '2021-09-18 12:42:08', 377),
(719, '2021-09-18 12:45:54', 455),
(720, '2021-09-18 12:54:39', 234),
(721, '2021-09-18 12:54:39', 234),
(722, '2021-09-18 12:54:39', 234),
(723, '2021-09-18 12:54:39', 234),
(724, '2021-09-18 12:54:39', 234),
(725, '2021-09-18 12:54:39', 234),
(726, '2021-09-18 12:54:39', 234),
(727, '2021-09-18 12:54:39', 234),
(728, '2021-09-18 12:54:39', 234),
(729, '2021-09-18 12:54:40', 234),
(730, '2021-09-18 12:54:40', 234),
(731, '2021-09-18 12:54:40', 234),
(732, '2021-09-18 12:54:40', 234),
(733, '2021-09-18 12:54:40', 234),
(734, '2021-09-18 12:59:10', 468),
(735, '2021-09-18 12:59:17', 471),
(736, '2021-09-18 13:08:39', 458),
(737, '2021-09-18 13:46:29', 471),
(738, '2021-09-18 13:58:47', 158),
(739, '2021-09-18 13:59:02', 206),
(740, '2021-09-18 13:59:18', 398),
(741, '2021-09-18 13:59:30', 199),
(742, '2021-09-18 13:59:31', 256),
(743, '2021-09-18 13:59:46', 303),
(744, '2021-09-18 13:59:48', 377),
(745, '2021-09-18 13:59:49', 256),
(746, '2021-09-18 14:00:12', 256),
(747, '2021-09-18 14:02:03', 24),
(748, '2021-09-18 14:02:04', 24),
(749, '2021-09-18 14:02:06', 24),
(750, '2021-09-18 14:02:06', 24),
(751, '2021-09-18 14:19:07', 471),
(752, '2021-09-18 14:26:40', 458),
(753, '2021-09-18 14:40:31', 386),
(754, '2021-09-18 14:45:17', 195),
(755, '2021-09-18 14:45:43', 185),
(756, '2021-09-18 14:45:44', 277),
(757, '2021-09-18 14:45:44', 185),
(758, '2021-09-18 14:45:51', 178),
(759, '2021-09-18 14:45:59', 396),
(760, '2021-09-18 14:46:00', 104),
(761, '2021-09-18 14:46:01', 104),
(762, '2021-09-18 14:46:05', 24),
(763, '2021-09-18 14:46:07', 390),
(764, '2021-09-18 14:46:08', 450),
(765, '2021-09-18 14:46:10', 386),
(766, '2021-09-18 14:46:12', 189),
(767, '2021-09-18 14:46:13', 387),
(768, '2021-09-18 14:46:18', 214),
(769, '2021-09-18 14:46:19', 102),
(770, '2021-09-18 14:46:28', 199),
(771, '2021-09-18 14:46:32', 398),
(772, '2021-09-18 14:46:37', 241),
(773, '2021-09-18 14:46:49', 275),
(774, '2021-09-18 15:13:04', 458),
(775, '2021-09-18 15:13:23', 386),
(776, '2021-09-18 15:18:18', 195),
(777, '2021-09-18 15:18:52', 178),
(778, '2021-09-18 15:18:58', 206),
(779, '2021-09-18 15:18:59', 396),
(780, '2021-09-18 15:19:01', 98),
(781, '2021-09-18 15:19:03', 304),
(782, '2021-09-18 15:19:05', 277),
(783, '2021-09-18 15:19:06', 390),
(784, '2021-09-18 15:19:08', 214),
(785, '2021-09-18 15:19:09', 386),
(786, '2021-09-18 15:19:17', 450),
(787, '2021-09-18 15:19:23', 102),
(788, '2021-09-18 15:19:27', 199),
(789, '2021-09-18 15:19:30', 275),
(790, '2021-09-18 15:19:30', 398),
(791, '2021-09-18 15:19:35', 129),
(792, '2021-09-18 15:19:36', 189),
(793, '2021-09-18 15:20:17', 256),
(794, '2021-09-18 15:20:53', 24),
(795, '2021-09-18 15:20:54', 24),
(796, '2021-09-18 15:20:56', 24),
(797, '2021-09-18 15:20:56', 24),
(798, '2021-09-18 15:20:57', 24),
(799, '2021-09-18 15:20:57', 24),
(800, '2021-09-18 15:20:58', 24),
(801, '2021-09-18 15:20:58', 24),
(802, '2021-09-18 15:20:59', 24),
(803, '2021-09-18 15:28:35', 185),
(804, '2021-09-18 15:28:36', 185),
(805, '2021-09-18 15:28:36', 185),
(806, '2021-09-18 15:28:36', 185),
(807, '2021-09-18 15:28:37', 185),
(808, '2021-09-18 15:28:38', 185),
(809, '2021-09-18 15:28:38', 185),
(810, '2021-09-18 15:28:38', 185),
(811, '2021-09-18 15:28:38', 185),
(812, '2021-09-18 15:28:39', 185),
(813, '2021-09-18 15:28:39', 185),
(814, '2021-09-18 15:28:39', 185),
(815, '2021-09-18 15:28:39', 185),
(816, '2021-09-18 15:28:42', 185),
(817, '2021-09-18 15:28:45', 185),
(818, '2021-09-18 15:28:45', 185),
(819, '2021-09-18 15:28:46', 185),
(820, '2021-09-18 15:28:50', 185),
(821, '2021-09-18 15:28:50', 185),
(822, '2021-09-18 15:28:51', 185),
(823, '2021-09-18 15:28:53', 185),
(824, '2021-09-18 15:28:53', 185),
(825, '2021-09-18 15:28:54', 185),
(826, '2021-09-18 15:28:54', 185),
(827, '2021-09-18 15:28:54', 185),
(828, '2021-09-18 15:28:54', 185),
(829, '2021-09-18 15:28:54', 185),
(830, '2021-09-18 15:28:58', 185),
(831, '2021-09-18 15:29:52', 271),
(832, '2021-09-18 15:29:54', 271),
(833, '2021-09-18 15:45:59', 108),
(834, '2021-09-18 15:46:04', 458),
(835, '2021-09-18 18:56:10', 292),
(836, '2021-09-18 18:56:11', 292),
(837, '2021-09-18 18:56:11', 292),
(838, '2021-09-18 18:56:12', 292),
(839, '2021-09-18 18:56:12', 292),
(840, '2021-09-18 18:56:12', 292),
(841, '2021-09-18 18:56:12', 292),
(842, '2021-09-18 18:56:12', 292),
(843, '2021-09-18 18:56:12', 292),
(844, '2021-09-18 18:56:13', 292),
(845, '2021-09-18 18:56:13', 292);

-- --------------------------------------------------------

--
-- Структура таблицы `vote`
--

CREATE TABLE `vote` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `poster_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_880E0D76E7927C74` (`email`);

--
-- Индексы таблицы `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DADD4A25537A1329` (`message_id`),
  ADD KEY `IDX_DADD4A25A76ED395` (`user_id`);

--
-- Индексы таблицы `answer_speaker`
--
ALTER TABLE `answer_speaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_33C51410A76ED395` (`user_id`),
  ADD KEY `IDX_33C51410D04A0F27` (`speaker_id`),
  ADD KEY `IDX_33C51410CAF8A031` (`chatroom_id`),
  ADD KEY `IDX_33C51410B79E90AF` (`question_speaker_id`);

--
-- Индексы таблицы `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `company_material`
--
ALTER TABLE `company_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_642960F8979B1AD6` (`company_id`);

--
-- Индексы таблицы `company_video`
--
ALTER TABLE `company_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3B367849979B1AD6` (`company_id`);

--
-- Индексы таблицы `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6BD307F9D1C3019` (`participant_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D79F6B11A76ED395` (`user_id`),
  ADD KEY `IDX_D79F6B11CAF8A031` (`chatroom_id`);

--
-- Индексы таблицы `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2D710CF284624602` (`poster_category_id`);

--
-- Индексы таблицы `poster_category`
--
ALTER TABLE `poster_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `question_speaker`
--
ALTER TABLE `question_speaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75590E7CA76ED395` (`user_id`),
  ADD KEY `IDX_75590E7CD04A0F27` (`speaker_id`),
  ADD KEY `IDX_75590E7CCAF8A031` (`chatroom_id`);

--
-- Индексы таблицы `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7B85DB61A76ED395` (`user_id`),
  ADD KEY `IDX_7B85DB61CAF8A031` (`chatroom_id`);

--
-- Индексы таблицы `theses`
--
ALTER TABLE `theses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Индексы таблицы `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_45B44DCE979B1AD6` (`company_id`),
  ADD KEY `IDX_45B44DCEFAD914F7` (`company_material_id`),
  ADD KEY `IDX_45B44DCE31561523` (`company_video_id`),
  ADD KEY `IDX_45B44DCE9C7E80E0` (`broadcast_id`),
  ADD KEY `IDX_45B44DCEA76ED395` (`user_id`);

--
-- Индексы таблицы `visit_control`
--
ALTER TABLE `visit_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BB52288CA76ED395` (`user_id`);

--
-- Индексы таблицы `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A108564A76ED395` (`user_id`),
  ADD KEY `IDX_5A1085645BB66C05` (`poster_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `answer_speaker`
--
ALTER TABLE `answer_speaker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `company`
--
ALTER TABLE `company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `company_material`
--
ALTER TABLE `company_material`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `company_video`
--
ALTER TABLE `company_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `poster`
--
ALTER TABLE `poster`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `poster_category`
--
ALTER TABLE `poster_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `question_speaker`
--
ALTER TABLE `question_speaker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `speaker`
--
ALTER TABLE `speaker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `theses`
--
ALTER TABLE `theses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=487;

--
-- AUTO_INCREMENT для таблицы `user_statistics`
--
ALTER TABLE `user_statistics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1258;

--
-- AUTO_INCREMENT для таблицы `visit_control`
--
ALTER TABLE `visit_control`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=846;

--
-- AUTO_INCREMENT для таблицы `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_DADD4A25537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  ADD CONSTRAINT `FK_DADD4A25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `answer_speaker`
--
ALTER TABLE `answer_speaker`
  ADD CONSTRAINT `FK_33C51410A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_33C51410B79E90AF` FOREIGN KEY (`question_speaker_id`) REFERENCES `question_speaker` (`id`),
  ADD CONSTRAINT `FK_33C51410CAF8A031` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`),
  ADD CONSTRAINT `FK_33C51410D04A0F27` FOREIGN KEY (`speaker_id`) REFERENCES `speaker` (`id`);

--
-- Ограничения внешнего ключа таблицы `company_material`
--
ALTER TABLE `company_material`
  ADD CONSTRAINT `FK_642960F8979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Ограничения внешнего ключа таблицы `company_video`
--
ALTER TABLE `company_video`
  ADD CONSTRAINT `FK_3B367849979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307F9D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`);

--
-- Ограничения внешнего ключа таблицы `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B11A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D79F6B11CAF8A031` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`);

--
-- Ограничения внешнего ключа таблицы `poster`
--
ALTER TABLE `poster`
  ADD CONSTRAINT `FK_2D710CF284624602` FOREIGN KEY (`poster_category_id`) REFERENCES `poster_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `question_speaker`
--
ALTER TABLE `question_speaker`
  ADD CONSTRAINT `FK_75590E7CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_75590E7CCAF8A031` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`),
  ADD CONSTRAINT `FK_75590E7CD04A0F27` FOREIGN KEY (`speaker_id`) REFERENCES `speaker` (`id`);

--
-- Ограничения внешнего ключа таблицы `speaker`
--
ALTER TABLE `speaker`
  ADD CONSTRAINT `FK_7B85DB61A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_7B85DB61CAF8A031` FOREIGN KEY (`chatroom_id`) REFERENCES `chat_room` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD CONSTRAINT `FK_45B44DCE31561523` FOREIGN KEY (`company_video_id`) REFERENCES `company_video` (`id`),
  ADD CONSTRAINT `FK_45B44DCE979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `FK_45B44DCE9C7E80E0` FOREIGN KEY (`broadcast_id`) REFERENCES `chat_room` (`id`),
  ADD CONSTRAINT `FK_45B44DCEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_45B44DCEFAD914F7` FOREIGN KEY (`company_material_id`) REFERENCES `company_material` (`id`);

--
-- Ограничения внешнего ключа таблицы `visit_control`
--
ALTER TABLE `visit_control`
  ADD CONSTRAINT `FK_BB52288CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `FK_5A1085645BB66C05` FOREIGN KEY (`poster_id`) REFERENCES `poster` (`id`),
  ADD CONSTRAINT `FK_5A108564A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
