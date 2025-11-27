package kr.java.mybatis.mapper;

import kr.java.mybatis.domain.UserInfo;
import kr.java.mybatis.domain.UserLogin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    // 회원가입
    void insertUserLogin(UserLogin userLogin);
    void insertUserInfo(UserInfo userInfo);
    // 정보조회
    UserLogin findLoginByUsername(String username);
    UserInfo findUserInfoByLoginId(long loginId);
    // 사용자 정보 + 작성 게시글 조회 (1:N 매핑)
    UserInfo findUserWithPosts(long userInfoId);
    // 사용자 정보 + 좋아요 게시글 조회 (M:N 매핑)
    UserInfo findUserWithLikedPosts(long userInfoId);
}
