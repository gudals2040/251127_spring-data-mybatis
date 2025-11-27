-- 존재 시 삭제
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS post_like;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_login;

-- 테이블 생성
-- 로그인 정보 테이블
CREATE TABLE user_login (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 사용자 상세 정보 테이블 (1:1 관계)
CREATE TABLE user_info (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    login_id BIGINT UNIQUE NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (login_id) REFERENCES user_login(id) ON DELETE CASCADE
);

-- 게시글 테이블 (1:N 관계)
CREATE TABLE post (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    author_id BIGINT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    like_count INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES user_info(id) ON DELETE CASCADE
);

-- 게시글 좋아요 테이블 (M:N 관계)
CREATE TABLE post_like (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES post(id) ON DELETE CASCADE,
    UNIQUE KEY uk_user_post (user_id, post_id)
);