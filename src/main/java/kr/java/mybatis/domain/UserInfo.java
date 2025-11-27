package kr.java.mybatis.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserInfo {
    private Long id;
    private Long loginId; // UserInfo -> PK. (FK)
    private String nickname;
    private String email;
    private LocalDateTime createdAt;

    // 1:1 관계 설정
    private UserLogin userLogin;

    // ...
}


