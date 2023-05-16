package com.example.demo.member.controller;

import com.example.demo.member.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import java.util.Random;

@Controller
public class EmailController {

    private EmailService emailService;

    @Autowired
    public EmailController(EmailService emailService) {
        this.emailService = emailService;
    }

    

    //메일보내기
    @GetMapping("/mailCheck")
    @ResponseBody
    public String sendmail(String email) throws MessagingException {
        StringBuffer emailcontent = new StringBuffer();
        String key = certified_key();
        emailcontent.append(key);
        emailService.sendMail(email, "이메일 인증", "인증번호는 "+emailcontent.toString()+"입니다."); //메일발송
        return key;
    }

    //인증번호 생성 메소드
    private String certified_key() {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;

        do {
            num = random.nextInt(75) + 48;
            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char) num);
            } else {
                continue;
            }

        } while (sb.length() < 10);
        return sb.toString();
    }
}
