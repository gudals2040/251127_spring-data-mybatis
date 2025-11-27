package kr.java.mybatis.mapper;

import kr.java.mybatis.domain.Post;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {
    // 게시글 작성
    void insertPost(Post post);
}
