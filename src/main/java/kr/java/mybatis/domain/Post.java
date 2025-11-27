package kr.java.mybatis.domain;

import lombok.Data;

@Data
public class Post {
    private Long id;
    private Long authorId; // 작성자 ID -> UserInfoId
    private String title;
    private String content;
    private Integer likeCount; // -> PostLike
    private String createdAt;

    // 1:N 관계 : 작성자 정보
    private UserInfo author;
}
