package com.example.demo.member.controller;

import com.example.demo.member.domain.Member;
import com.example.demo.member.service.EmailService;
import com.example.demo.member.service.MemberService;
import com.example.demo.metabolism.service.MetabolismService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("member")
public class MemberController {

    private final MemberService memberService;
    private final EmailService emailService;
    private final MetabolismService metabolismService;

    @Autowired
    public MemberController(MemberService memberService, EmailService emailService, MetabolismService metabolismService) {
        this.memberService = memberService;
        this.emailService = emailService;
        this.metabolismService = metabolismService;
    }

    //로그인페이지
    @GetMapping("/loginForm")
    public String loginForm() {
        return "LoginForm";
    }


    //로그인처리
    @PostMapping("/login")
    public String login(Model model, Member member) {
        Member loginMember = memberService.login(member.getId());
        if (loginMember == null) {
            model.addAttribute("member", null);
            return "LoginFail";
        } else if (!loginMember.getPassword().equals(member.getPassword())) {
            model.addAttribute("member", null);
            return "LoginFail";
        }
        model.addAttribute("member", loginMember);

        System.out.println(loginMember.toString());
        return "LoginSuccess";
    }

    //회원가입 페이지
    @GetMapping("/joinForm")
    public String joinForm() {
        return "JoinForm";
    }

    //회원가입 처리
    @PostMapping("/join")
    public String join(Member member) {
        memberService.join(member);
        return "JoinSuccess";
    }

    //비밀번호 찾기 페이지
    @GetMapping("/findPassword")
    public String findPassword() {
        return "FindPasswordForm";
    }

    // 아이디 찾기 페이지
    @GetMapping("/findId")
    public String findId() {
        return "FindIdForm";
    }

    //아이디 중복확인 ajax
    @GetMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam String id) {
        System.out.println(id);
        return memberService.checkId(id);
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(SessionStatus session) {
        session.setComplete();
        return "LoginForm";
    }

    //회원정보 페이지
    @GetMapping("/memberInfo")
    public String memberInfo() {
        return "MemberInfoForm";
    }

    //회원정보 수정
    @PostMapping("/updateInfo")
    public String updateInfo(Member member, Model model) {
        memberService.updateInfo(member);
        model.addAttribute("member", member);
        return "UpdateSuccess";
    }

    //비밀번호 수정 페이지
    @GetMapping("/updatePasswordForm")
    public String updatePasswordForm() {
        return "UpdatePassword";
    }

    //비밀번호 수정 처리
    @PostMapping("updatePassword")
    public String updatePassword(HttpSession session, Model model, @RequestParam String newPassword) {
        Member member = (Member) session.getAttribute("member");
        member.setPassword(newPassword);
        memberService.updateInfo(member);
        model.addAttribute("member", member);
        return "UpdateSuccess";
    }

    //회원탈퇴
    @GetMapping("deleteMember")
    public String deleteMember(HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        memberService.deleteMember(member.getId());
        metabolismService.deleteMetabolism(member.getId());
        return "DeleteSuccess";
    }

    //비밀번호 찾기 처리
    @PostMapping("findPassword")
    public String findPassword(String email, String id) throws MessagingException {
        Member member = memberService.findPassword(id);
        if (member != null) {
            StringBuffer emailcontent = new StringBuffer();
            emailcontent.append(member.getPassword());
            emailService.sendMail(email, "비밀번호 찾기", member.getName() + "님의 비밀번호는 " + emailcontent.toString() + "입니다.");
            return "FindSuccess";
        }
        return "FindFail";
    }

    //아이디 찾기 처리
    @PostMapping("findId")
    public String findId(String email, String name) throws MessagingException {
        Member member = memberService.findId(email, name);
        if (member != null) {
            StringBuffer emailcontent = new StringBuffer();
            emailcontent.append(member.getId());
            emailService.sendMail(email, "아이디 찾기", member.getName() + "님의 아이디는 " + emailcontent.toString() + "입니다");
            return "FindSuccess";
        }
        return "FindFail";

    }
}
