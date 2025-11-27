package kr.java.mybatis.service;

import kr.java.mybatis.domain.Post;
import kr.java.mybatis.domain.UserInfo;
import kr.java.mybatis.domain.UserLogin;
import kr.java.mybatis.mapper.PostMapper;
import kr.java.mybatis.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PostService {
    private final PostMapper postMapper;

    @Transactional
    public void createPost(
        long authorId,
        String title,
        String content
    ) {
        Post post = new Post();
        post.setAuthorId(authorId);
        post.setTitle(title);
        post.setContent(content);

        postMapper.insertPost(post);
    }
}
