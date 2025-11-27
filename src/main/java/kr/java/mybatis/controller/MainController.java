package kr.java.mybatis.controller;

import jakarta.servlet.http.HttpSession;
import kr.java.mybatis.domain.UserInfo;
import kr.java.mybatis.mapper.UserMapper;
import kr.java.mybatis.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// Spring Web MVC
@Controller
@RequestMapping
@RequiredArgsConstructor
public class MainController {
    private final UserService userService;
    private final UserMapper userMapper;

    @GetMapping
    public String index() {
        return "index";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String nickname,
            @RequestParam String email) {
        userService.register(username, password, nickname, email);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session) {
        UserInfo userInfo = userService.login(username, password);
        if (userInfo == null) {
            return "redirect:/login";
        }
        session.setAttribute("loginUser", userInfo);
        return "redirect:/";
    }

    @GetMapping("/profile")
    public String profile(Model model, HttpSession session) {
        UserInfo userInfo = (UserInfo) session.getAttribute("loginUser");
        model.addAttribute("posts", userMapper.findUserWithPosts(userInfo.getId()));
        model.addAttribute("likedPosts",
                userMapper.findUserWithLikedPosts(userInfo.getId()));
        return "profile";
    }
}
