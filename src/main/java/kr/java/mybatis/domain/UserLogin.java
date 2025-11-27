package kr.java.mybatis.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data // Lombok
// getter, setter, 기본생성자, toString.
public class UserLogin {
    private Long id;
    private String username;
    private String password; // <- 평문저장 X
    private LocalDateTime createdAt;

    // 1:1 관계 설정
    private UserInfo userInfo;
}


