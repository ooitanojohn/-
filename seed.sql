--
-- テーブル作成、データ登録SQLファイル
-- adminユーザで使用
-- コマンド: mysql -u admin -p board --default-character-set=utf8 < "./seed.sql"
--
-- @author Syuto Niimi

-- テーブル削除
DROP TABLE IF EXISTS res;
DROP TABLE IF EXISTS users;

-- ユーザ
CREATE TABLE users
(
	id varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'ユーザID兼ログインID',
  	name varchar(191) DEFAULT 'マツコ・デラックス' COMMENT 'ハンドルネーム',
	password varchar(255) NOT NULL COMMENT 'パスワード',
	auth tinyint(1) UNSIGNED DEFAULT 1 NOT NULL COMMENT '権限 :0=管理者 :1=一般',
	PRIMARY KEY (id)
) COMMENT = 'ユーザ';

-- Re:テーブル
-- レス先本文はajaxでクリック時取得
-- コメント1 対 レス多
CREATE TABLE `res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'コメントかレスID',
  `content` text COLLATE utf8mb4_bin NOT NULL COMMENT '本文',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '投稿日時',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'ユーザID兼ログインID',
  `res_id` int(11) unsigned NOT NULL COMMENT 'レス先ID : 0=コメント id=レス',
  PRIMARY KEY (`id`),
  KEY `res_id_index` (`res_id`),
  KEY `user_id_index` (`user_id`),
  CONSTRAINT `res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_bbs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='掲示板'

-- トランザクション開始 トランザクションは動いてるシステムでいい
BEGIN;

-- ユーザデータ挿入
INSERT INTO users (id, password, auth) VALUES ('aiueo', 'pass', '1');
INSERT INTO users (id, password, auth) VALUES ('apple', 'pass', '1');
INSERT INTO users (id, password, auth) VALUES ('polca', 'pass', '1');

-- コメントデータ挿入
INSERT INTO res (content, user_id , res_id) VALUES ('cm1', 'aiueo', '0');
INSERT INTO res (content, user_id , res_id) VALUES ('res1', 'apple', '1');
INSERT INTO res (content, user_id , res_id) VALUES ('cm2', 'polca', '3');
INSERT INTO res (content, user_id , res_id) VALUES ('res2', 'polca', '2');

-- コミット
COMMIT;
