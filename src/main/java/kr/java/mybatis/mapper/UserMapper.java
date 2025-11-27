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
}
