/*
 Navicat Premium Data Transfer

 Source Server         : nanocharger-api
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3314
 Source Schema         : nanocharger

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 07/05/2023 23:51:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_company_id` int NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 0, 'Barton-Jakubowski', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (2, 2, 'Feil-Leuschke', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (3, 0, 'Rolfson, Bernhard and Runte', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (4, 5, 'Kovacek, Grady and Bogan', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (5, 6, 'Turcotte-Gislason', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (6, 1, 'Block, Brakus and Halvorson', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (7, 3, 'Jast, Toy and Lubowitz', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (8, 4, 'Mayert Inc', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (9, 0, 'Zemlak PLC', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (10, 9, 'Carter PLC', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (11, 0, 'Collins-Boyer', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (12, 8, 'Kassulke, Rempel and Corwin', '2023-05-02 16:35:03', '2023-05-02 16:35:03');
INSERT INTO `companies` VALUES (13, 1, 'Gulgowski LLC', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (14, 3, 'Hahn Ltd', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (15, 2, 'Berge LLC', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (16, 2, 'Kerluke-Lowe', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (17, 2, 'Cole, Larkin and Dickinson', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (18, 8, 'Cummerata Group', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (19, 0, 'Lockman-Kreiger', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (20, 9, 'Hintz-Prohaska', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (21, 6, 'Davis-Bartell', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (22, 0, 'Ebert, Berge and Denesik', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (23, 7, 'Lubowitz, Schulist and Rodriguez', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (24, 10, 'Kovacek Inc', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (25, 5, 'Lindgren, Ebert and Leffler', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (26, 5, 'Kuhlman Ltd', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (27, 7, 'Wiegand, Ryan and Auer', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (28, 2, 'Russel Ltd', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (29, 3, 'Gleason-Kulas', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (30, 10, 'Feest Group', '2023-05-02 16:35:04', '2023-05-02 16:35:04');
INSERT INTO `companies` VALUES (31, 19, 'Subcompany', '2023-05-07 15:31:43', '2023-05-07 17:07:33');
INSERT INTO `companies` VALUES (32, 0, 'My New Subcompany', '2023-05-07 15:35:02', '2023-05-07 15:35:02');
INSERT INTO `companies` VALUES (33, 0, 'Another Company', '2023-05-07 15:50:17', '2023-05-07 15:50:17');
INSERT INTO `companies` VALUES (34, 0, 'Another Company', '2023-05-07 16:48:34', '2023-05-07 16:48:34');
INSERT INTO `companies` VALUES (35, 0, 'Another Company 01', '2023-05-07 20:37:37', '2023-05-07 20:37:37');
INSERT INTO `companies` VALUES (36, 9, 'Test Company 02', '2023-05-07 20:38:38', '2023-05-07 20:38:38');
INSERT INTO `companies` VALUES (37, 21, 'Test Company 03', '2023-05-07 20:39:00', '2023-05-07 20:39:00');
INSERT INTO `companies` VALUES (38, 100, 'Spencer, Williamson and Dooley', '2023-05-07 20:39:29', '2023-05-07 20:39:29');
INSERT INTO `companies` VALUES (39, 83, 'Sawayn-Zieme', '2023-05-07 20:40:52', '2023-05-07 20:40:52');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_04_27_143035_create_stations_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_04_27_143044_create_companies_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'API TOKEN', '205580ef897b43fe4de347382bb937eaf7f77a6c0a89ce8a1b7d82d97198f282', '[\"*\"]', '2023-05-07 20:37:37', NULL, '2023-05-03 17:24:03', '2023-05-07 20:37:37');

-- ----------------------------
-- Table structure for stations
-- ----------------------------
DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stations
-- ----------------------------
INSERT INTO `stations` VALUES (1, 'Dare-Towne Charger', '61.97164362640635', '26.659094036075672', 20, '9294 Robel Wells\nGutkowskibury, IL 60490', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (2, 'Little, Casper and Marvin Charger', '57.747372538371', '16.599290426807', 30, '1784 Lindsay Isle Suite 203\nAdrielport, VA 83368-8557', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (3, 'Kreiger, Parker and Runolfsson Charger', '57.717926927168', '16.638538659464', 17, '5712 Carter Trace\nNew Dellafurt, DE 71799-4228', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (4, 'Bernier LLC Charger', '61.91511204277228', '26.12250257929054', 5, '407 Cole Rue\nNew Kameron, SD 30722-6037', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (5, 'Beatty-Sporer Charger', '62.07700890768149', '26.134397868052567', 2, '17153 Rosenbaum Dam\nPort Lauriannebury, MA 27840', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (6, 'Collins, Cormier and Weber Charger', '57.85500836351', '16.543529868175', 24, '2726 Weston Views Suite 476\nWest Garnetton, HI 82688', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (7, 'Hartmann, Schimmel and Watsica Charger', '57.752394303466', '16.751051804841', 19, '3170 Mathilde Falls\nNew Lavina, KS 17804', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (8, 'Wilderman-Gulgowski Charger', '57.643834941422', '16.435193971211', 28, '3188 Rodrigo Field Apt. 973\nNorth Olen, MI 97053', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (9, 'Altenwerth and Sons Charger', '57.704656616628', '16.970632437657', 20, '99935 Dangelo Flats\nRutherfordchester, MI 05433-5274', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (10, 'Luettgen-Hahn Charger', '62.07700890768149', '26.134397868052567', 16, '344 Kris Mountain\nGroverchester, AZ 43438', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (11, 'Ankunding-Ondricka Charger', '57.96568515512', '16.862313128847', 16, '175 Beier Track Suite 834\nSchaeferberg, NJ 62127-9893', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (12, 'Smitham-Bayer Charger', '57.702141466796', '16.538195461363', 28, '25980 Rogahn Trail Apt. 447\nHayeston, MI 44091-2822', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (13, 'Green-Russel Charger', '57.935824596866', '16.404385104956', 13, '5853 Delfina Inlet Suite 154\nLake Madie, NJ 96106-5687', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (14, 'Beatty, Sipes and Feil Charger', '57.685327217652', '16.529973098608', 21, '9601 Barrows Fall\nLake Jeradstad, NV 66888-9287', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (15, 'Feest and Sons Charger', '57.569984872318', '16.699019197072', 1, '41892 Lubowitz View\nWest Gabrielle, MN 38131', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (16, 'Ritchie, Carroll and Mayert Charger', '57.968696816003', '16.982614707268', 23, '6136 Heller Motorway Suite 872\nHintzchester, IA 29110', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (17, 'Russel-Schneider Charger', '57.871747687605', '16.596951720656', 15, '7964 Nader Ville Apt. 179\nRohanburgh, MD 15637-9824', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (18, 'Little-Hand Charger', '57.832626995561', '16.767842577313', 4, '884 Beier Pines\nEast Ottisview, ME 38331-9536', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (19, 'Emmerich, Robel and Murazik Charger', '57.629974673543', '16.726976035502', 21, '7658 Oswaldo Island\nNicklausberg, OK 81013-4810', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (20, 'Jacobson Ltd Charger', '57.705197360572', '16.6685865166', 19, '3645 America Meadow\nSouth August, UT 70674-0947', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (21, 'King-Kuhic Charger', '57.774043687871', '16.61144651057', 27, '1420 Ratke Islands Suite 280\nJessiechester, NJ 83678-6810', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (22, 'Sauer-Bins Charger', '57.590230840312', '16.594777602183', 14, '2188 Adan Harbors\nTerrellville, AL 29891-5179', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (23, 'Davis-Trantow Charger', '58.081386872746', '16.544213385752', 6, '573 Lang Light Apt. 029\nNorth Bell, GA 27461', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (24, 'Shanahan and Sons Charger', '62.25265450472472', '25.743974453369567', 13, '43198 Jamil Extension\nPort Judetown, NH 10337-8450', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (25, 'Lubowitz Group Charger', '58.063899660106', '16.574118661289', 8, '52605 Ryleigh Station Suite 415\nWest Catalina, PA 02720-6889', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (26, 'Bechtelar Inc Charger', '57.879509002872', '17.093995530466', 10, '402 Swaniawski Rapid Apt. 028\nLake Kyleburgh, VT 18582-1869', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (27, 'Wolf-Kihn Charger', '57.664635048429', '16.238383681018', 30, '41994 Rocky Road Suite 951\nEast Vincenzo, KY 46105-1497', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (28, 'Mosciski-Welch Charger', '57.838910473613', '16.572573390597', 10, '3639 Lebsack Way Suite 143\nNorth Buddy, SC 51814', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (29, 'Watsica-Quigley Charger', '57.839755624209', '16.003554473539', 1, '42582 Blick Locks\nWest Robb, WA 12738', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (30, 'Fahey LLC Charger', '57.878523850495', '16.238535710983', 29, '1581 Renner Expressway Suite 220\nSouth Wilfridburgh, VT 20691-1128', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (31, 'Nikolaus, Paucek and Bergnaum Charger', '57.828989834859', '16.487695015701', 13, '71389 Senger Rue\nFarrellfort, VT 94450-9141', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (32, 'Collier Group Charger', '57.669445278621', '16.716914334066', 13, '35158 Jacobson Road\nWehnerside, GA 81025', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (33, 'Leffler-Waters Charger', '57.516289943582', '16.040210874577', 6, '76958 Julio Camp\nEast Hobartshire, MT 65376-7325', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (34, 'Purdy, Zulauf and Blanda Charger', '57.774485270012', '16.564362441104', 28, '5732 Hane Loaf\nNew Ginaburgh, FL 23049-4419', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (35, 'Barrows-Paucek Charger', '57.822998953065', '16.887327143819', 21, '83300 Friesen Mews\nKirlinstad, KS 54259', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (36, 'Corkery PLC Charger', '57.819815067315', '16.550904900389', 6, '3050 Jast Run\nNew Kole, IA 36310', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (37, 'Waelchi, Howe and Metz Charger', '57.754657321377', '15.977711793574', 19, '21482 Walsh Island Apt. 034\nGayletown, WA 32981-3084', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (38, 'McGlynn-Dach Charger', '57.686018288491', '16.653270770691', 30, '940 Simonis Overpass\nReichelchester, WA 93012-2038', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (39, 'Hyatt Ltd Charger', '62.25031870905241', '25.74739788535638', 6, '7496 Stevie Tunnel Suite 276\nEastonton, AR 48580', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (40, 'Schroeder Ltd Charger', '57.717876466575', '16.41316166335', 27, '245 Brekke Shores\nSalvadorfurt, ND 25129', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (41, 'Fay-Hoeger Charger', '62.25031870905241', '25.74739788535638', 13, '2382 Roslyn Burg\nPort Noemi, NJ 34904', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (42, 'Morar, Quigley and Reynolds Charger', '57.645730347424', '16.968627662088', 25, '6480 Chris Shore Apt. 284\nPort Vivienne, IA 51959-8347', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (43, 'Ziemann Inc Charger', '62.25031870905241', '25.74739788535638', 23, '7750 Camilla Club Suite 274\nPort Braxton, TN 18247', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (44, 'O\'Conner-Murazik Charger', '57.800634512522', '16.92973968454', 2, '11140 Zella Forks Apt. 587\nWest Korbin, AZ 15321', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (45, 'VonRueden-Conn Charger', '57.826596332273', '16.703002174717', 2, '33003 Emerson Fall\nOberbrunnerfort, OK 66208-0262', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (46, 'Wolf, Donnelly and Cummerata Charger', '57.852837087854', '16.775439053869', 16, '67496 Makenzie Isle\nPort Oswaldborough, AK 15499-1864', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (47, 'Blanda, Bradtke and Balistreri Charger', '57.82093654035', '16.246523244372', 28, '3557 Conn Hills Apt. 391\nPort Delphiaberg, NJ 93187-0109', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (48, 'Bailey LLC Charger', '57.775096698677', '16.638578792511', 24, '859 Theron Estates Apt. 282\nEast Scarlett, RI 06878-9618', '2023-05-02 16:53:05', '2023-05-02 16:53:05');
INSERT INTO `stations` VALUES (49, 'Mitchell Ltd Charger', '57.699850418411', '15.814665069704', 14, '5449 Bergstrom Springs\nPort Faemouth, CA 24156', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (50, 'Pfannerstill, Cronin and Swaniawski Charger', '57.76833084111', '16.635019345092', 15, '1595 Dino Mall Apt. 671\nWildermanfurt, MD 55026-4565', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (51, 'Mosciski and Sons Charger', '57.677166386307', '16.768176626131', 24, '5422 Naomie Heights\nDavisborough, NC 26946', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (52, 'Corwin Ltd Charger', '57.662263523454', '16.758245779574', 22, '25281 O\'Reilly Plains\nPort Meggieburgh, DE 12567', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (53, 'Haley Ltd Charger', '57.836850966756', '16.607591808349', 1, '2614 Torp Keys Apt. 471\nPort Verlie, RI 26128', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (54, 'Abbott-Johnston Charger', '58.033563251209', '16.900971813679', 18, '7822 Grady Mission\nNew Nyasiashire, MT 52095-6312', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (55, 'Macejkovic-Homenick Charger', '57.684304344646', '16.914331926249', 20, '6110 Baumbach Stream\nBoyletown, PA 18657', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (56, 'Mosciski-Dooley Charger', '57.810480114069', '16.527456144915', 2, '3834 Fisher Meadows\nLaurelberg, SC 28166-6411', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (57, 'Bogan-Ruecker Charger', '57.48990719594', '16.858956775946', 10, '58260 Lakin Shore\nHandborough, OR 76536', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (58, 'Krajcik, Erdman and Becker Charger', '57.77743759958', '16.575684162186', 22, '7221 Tracy Curve\nCourtneyhaven, VA 11708-5302', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (59, 'Crooks PLC Charger', '57.619816853685', '16.563903498236', 6, '164 Boyle Island\nHomenickton, NJ 16070', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (60, 'Gerlach-Mueller Charger', '57.67051409616', '16.448381765243', 18, '80714 Tromp Ridge Apt. 658\nIdellville, ME 41277-7085', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (61, 'Jacobs, Wunsch and Bins Charger', '57.655977947265', '16.137882346256', 17, '685 Rempel Place Apt. 415\nEast Phoebe, ME 90200-7196', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (62, 'Hilpert-Oberbrunner Charger', '57.777313829051', '16.600555017628', 13, '497 Donna Knoll\nMcGlynntown, MI 25073-1087', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (63, 'Tromp-Jenkins Charger', '57.899619432986', '16.322358510802', 9, '121 Steuber Summit\nNew Margaritastad, DE 81389-9441', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (64, 'Harber-Bernier Charger', '58.001435428051', '16.429579107348', 2, '6213 Vicenta Walks\nLittelhaven, OR 54650', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (65, 'Okuneva, Ondricka and Bode Charger', '57.816774194035', '16.541134138955', 20, '461 Lehner Hill\nJedediahtown, NY 95792-9713', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (66, 'Jones Ltd Charger', '57.531217831533', '16.860519126417', 24, '585 Lesch Orchard\nRachaelborough, MI 22644', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (67, 'Klocko, Jenkins and Howe Charger', '57.893287996803', '16.574142627132', 24, '77717 Kassulke Roads Apt. 953\nDickihaven, OR 27265', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (68, 'Moen, Lemke and Davis Charger', '57.802865543266', '16.428598575872', 22, '9644 Luisa Underpass\nEast Magali, CO 26141-2325', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (69, 'Lebsack-Murphy Charger', '57.504166685183', '16.65687188943', 20, '2358 Dangelo Way Apt. 646\nNorth Harmony, TN 31427', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (70, 'Hegmann-Moen Charger', '57.84315725735', '16.568606271443', 11, '192 Lafayette Corners\nSwaniawskishire, DE 90962-9294', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (71, 'Rowe, Ratke and Witting Charger', '57.826213239087', '16.67097276651', 3, '8974 Louvenia Summit\nNew Shakiraland, OH 46757-5419', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (72, 'Lockman Ltd Charger', '57.690622134625', '16.408741507877', 10, '169 Antoinette Fords Apt. 093\nLake Otiliafurt, MS 73807-2333', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (73, 'Bosco-Goyette Charger', '57.765597950091', '16.637266118292', 21, '835 Orn Rue\nNew Malikafort, MN 20236', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (74, 'Ryan and Sons Charger', '57.779272444925', '16.592160340537', 18, '1665 Pansy Rapid Suite 829\nNew Daniela, OK 62557', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (75, 'Bayer, West and Lehner Charger', '57.901685302372', '16.654713853719', 2, '93670 Baron Prairie Apt. 377\nLake Stanton, NH 14360', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (76, 'Goldner, McClure and Greenholt Charger', '57.833367124227', '16.625444966042', 14, '336 Davon Trail Suite 325\nLake Nelle, AL 90667', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (77, 'Haag, Senger and Boyle Charger', '57.557026729672', '16.806841709766', 6, '8965 Nathanial Court Apt. 786\nPort Fae, CT 48949-8316', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (78, 'Hegmann-Heaney Charger', '57.810800102011', '16.579571418352', 5, '945 Goodwin Ford\nSouth Alekville, MT 11578-1106', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (79, 'Daugherty, Moen and Sporer Charger', '57.752667287085', '16.628328650858', 10, '750 Reichel Light Suite 644\nLake Josiahside, DE 16230-8603', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (80, 'Bechtelar-Schoen Charger', '57.73747657835', '16.846326019504', 1, '8583 Rosella Springs Apt. 624\nHopeberg, KY 71754-2847', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (81, 'Fritsch, Dach and Gottlieb Charger', '57.741737843997', '16.517664039991', 30, '2189 Grace Mission\nSouth Filomenatown, WI 23202', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (82, 'Strosin LLC Charger', '62.24568766277512', '25.760366609064484', 26, '418 Huel Valley\nPort Merlin, WA 18036-3401', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (83, 'Ferry, O\'Kon and Hirthe Charger', '57.816569387942', '16.447684466452', 18, '8865 Korey Mission Suite 893\nBeierville, KY 18242-7828', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (84, 'Kub Inc Charger', '57.979271400512', '16.591762351681', 8, '113 Hettinger Motorway\nStarkville, WY 01749-9389', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (85, 'Rodriguez, Boehm and Mraz Charger', '57.715054993014', '16.470871550847', 8, '69353 Laurence Extensions\nLangoshport, KY 03507', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (86, 'Macejkovic-Greenfelder Charger', '57.707631073758', '16.827864719692', 5, '540 Linnea Streets Apt. 354\nTurnerland, WI 86124', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (87, 'Krajcik-Towne Charger', '57.854456480534', '16.421432171984', 13, '1031 Kassulke Views\nVeldamouth, OK 46289', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (88, 'Dickinson Ltd Charger', '57.954111760089', '16.833608899057', 21, '83592 Jeramy Islands\nFredericberg, GA 10208', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (89, 'Bayer Group Charger', '57.791103757909', '16.632328214992', 16, '2299 Bruce Meadow Apt. 794\nNew Marcelomouth, PA 75408-7486', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (90, 'Dare, Glover and Altenwerth Charger', '57.759525395965', '16.621870203161', 4, '94768 Kilback Road Apt. 897\nPort Colton, KY 65337', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (91, 'Kilback Group Charger', '57.863255937934', '16.485611754631', 3, '145 Cormier Forest\nPort Arlofort, WI 29660', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (92, 'Greenholt-Strosin Charger', '57.645293646091', '16.492782803765', 29, '1739 Iliana Fort Suite 236\nKeiratown, MS 68934', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (93, 'Cassin-Kassulke Charger', '57.796826319629', '16.556325852717', 6, '225 Shyann Row Suite 475\nLake Elveraport, SC 39109', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (94, 'Tremblay-Kuvalis Charger', '57.949446691103', '17.067435039381', 24, '31405 Alberta Junction Apt. 748\nKreigermouth, NJ 14390-5600', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (95, 'Torp and Sons Charger', '57.896403710287', '16.638998002554', 6, '8764 Libby Trail\nPort Hilarioton, SD 54022-1349', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (96, 'Blanda, Koch and Kertzmann Charger', '57.757756144654', '16.687551666676', 10, '66100 Nedra Flat Suite 574\nHillstown, SD 63588-4378', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (97, 'Eichmann Group Charger', '57.874834329177', '16.619950780426', 8, '568 Brown Extension Apt. 367\nSimonisview, ME 38651', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (98, 'Murazik-Blanda Charger', '57.704987768942', '16.402978808913', 5, '1408 Alexandro Island Suite 391\nKayliefort, MO 31351', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (99, 'Rutherford, Yundt and Ebert Charger', '57.835896182347', '16.784311186932', 8, '242 Wisozk Hills\nEast Kallie, KY 63376', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (100, 'Haley-Windler Charger', '57.687745283394', '17.203007688054', 17, '66990 Leffler Glens\nPort Maurineland, OH 75893', '2023-05-02 16:53:06', '2023-05-02 16:53:06');
INSERT INTO `stations` VALUES (101, 'Towne PLC Charger', '57.775125972437', '16.625068659693', 21, '3932 Hubert Branch\nCalebside, MT 74389-9999', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (102, 'Rodriguez, Zulauf and Gaylord Charger', '57.776671937894', '16.580755318556', 3, '319 Chesley Park Apt. 293\nPort Litzyview, IN 05576', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (103, 'Leannon-D\'Amore Charger', '57.793254083263', '16.663840059282', 26, '33253 Bill Burgs\nJairomouth, VT 30867-8564', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (104, 'Hudson, Deckow and Dickinson Charger', '57.777897820938', '16.590390392674', 21, '95258 Parker Points\nOrvalchester, FL 38042-7316', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (105, 'Kihn LLC Charger', '57.755350614638', '16.609293557263', 26, '973 Alexzander Causeway Apt. 396\nNorth Malikaville, ME 06707-1401', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (106, 'Larkin Group Charger', '57.752299726468', '16.538640368893', 23, '2210 Feest Circle Apt. 295\nNew Jovan, WI 05791', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (107, 'Witting, Baumbach and Upton Charger', '57.776746251488', '16.585652062256', 20, '94069 Cole Land Apt. 739\nSchusterberg, NC 18276-4272', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (108, 'Jacobi, Collier and Ledner Charger', '57.775724136348', '16.604926883309', 17, '5290 Joseph Way\nEast Kamren, ND 09868-3089', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (109, 'Kunde-Dibbert Charger', '57.792959084374', '16.584759027109', 14, '8067 Jedidiah Ramp\nDorthafurt, IA 23921', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (110, 'Hayes Ltd Charger', '57.759247678665', '16.69733724559', 4, '93599 Allison Groves\nEast Edwinaberg, MO 20329-3516', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (111, 'Kozey Group Charger', '57.772307499221', '16.570487284186', 15, '493 Mariana Lodge\nBlickstad, DC 73703', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (112, 'White, Conroy and Gibson Charger', '57.792084557453', '16.585520403532', 14, '13244 Hudson Rapids\nNew Eduardoside, KS 02861', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (113, 'Bergnaum-Jakubowski Charger', '57.758227007475', '16.58424943805', 21, '62841 Johnnie Knoll Suite 046\nWest Niko, DC 59903-2686', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (114, 'Nitzsche, Schaefer and O\'Connell Charger', '57.776281289207', '16.59626402262', 17, '388 Lou Mount\nWest Rosalinda, KS 55555', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (115, 'Larson Ltd Charger', '57.772698867839', '16.597348842918', 21, '625 Mertz Union\nKristophershire, UT 07536', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (116, 'Stehr, Willms and Rohan Charger', '57.732279950822', '16.608530358253', 6, '622 Abernathy Junctions Apt. 813\nHageneshaven, FL 40816', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (117, 'Stokes Ltd Charger', '57.786013256502', '16.57146423654', 2, '836 Antone Tunnel Apt. 463\nLake Zackary, DE 68172', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (118, 'Lesch and Sons Charger', '57.783502127942', '16.647956775573', 2, '854 Bahringer Skyway Apt. 625\nNorth Isabell, CA 47809-4719', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (119, 'Bruen, Homenick and Beatty Charger', '57.771746863383', '16.603043832669', 7, '9106 Doyle Shore\nLake Hermina, NY 22690', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (120, 'Tromp, Doyle and Schamberger Charger', '57.794719665385', '16.58854953726', 12, '65640 Crist Hills Suite 978\nLake Timmy, DC 41547-2350', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (121, 'Weissnat, Schaden and Herzog Charger', '57.76816198127', '16.594826558688', 4, '27814 Marvin Parkways Apt. 303\nEast Forest, IN 89905', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (122, 'Walter Group Charger', '57.759690995488', '16.582441723653', 10, '29011 Buck Extension Suite 054\nPort Caseybury, MD 40581-8589', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (123, 'Gerlach-Brown Charger', '57.782415547287', '16.668099277366', 29, '388 Samir Burgs Apt. 083\nPort Kirstinburgh, FL 37690-2649', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (124, 'Ondricka Ltd Charger', '57.777158666031', '16.59332832822', 15, '9203 Reichert Via\nTamaraton, UT 61356-8626', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (125, 'Shields-Harber Charger', '57.768582701135', '16.59816585992', 24, '19478 Marisa Knoll Suite 608\nSouth Edwinton, NY 82088-1981', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (126, 'Schmitt-Marquardt Charger', '57.735560638155', '16.643034838259', 7, '309 Jaeden Fork Apt. 907\nNew Alene, OR 62704-1222', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (127, 'Gusikowski, O\'Conner and Kreiger Charger', '57.763503067174', '16.609523324218', 5, '81940 Mohammad Mission Suite 247\nMattiefurt, AL 53287', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (128, 'Littel Ltd Charger', '57.779262429224', '16.574306162691', 16, '93710 Medhurst Circles\nNorth Noemie, NJ 89350-2173', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (129, 'Jast, Aufderhar and Hegmann Charger', '57.776767991445', '16.6112068725', 1, '1907 Godfrey Garden Apt. 804\nNew Adolf, HI 80680-4556', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (130, 'Corkery-Kutch Charger', '57.761394581075', '16.625569079915', 30, '51349 Al Gateway\nReingerbury, WV 25376-9905', '2023-05-04 18:26:54', '2023-05-04 18:26:54');
INSERT INTO `stations` VALUES (131, 'Arpasu de jos Station Updated', '45.78015426343593', '24.623000602892088', 1, 'Strada Principală Nr. 214', '2023-05-07 17:46:54', '2023-05-07 17:49:27');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'alexander', 'alexander@localhost.com', NULL, '$2y$10$NQPJF0.CQGhKcvDHNjbjSuiDCCTRnjqTRbDnJgxg8o4kbAVYMPXUG', NULL, '2023-05-03 17:24:03', '2023-05-03 17:24:03');

SET FOREIGN_KEY_CHECKS = 1;
