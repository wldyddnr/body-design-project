package com.example.demo.metabolism.controller;

import com.example.demo.member.domain.Member;
import com.example.demo.metabolism.domain.Metabolism;
import com.example.demo.metabolism.service.MetabolismService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MetabolismController {

    private final MetabolismService metabolismService;

    public MetabolismController(MetabolismService metabolismService) {
        this.metabolismService = metabolismService;
    }

    @GetMapping("/metabolismForm")
    public String metabolismForm(HttpSession session, Model model) {

        Member member = (Member) session.getAttribute("member");
        System.out.println("model = " + member);
        Metabolism metabolism = metabolismService.getMetabolicInfoById(member.getId());
        if (metabolism != null) {
            model.addAttribute("metabolism", metabolism);
        }

        return "MetabolismForm";
    }

    @PostMapping("/metabolismUpdate")
    public String metabolismUpdate(HttpSession session, Metabolism metabolism) {

        if (metabolismService.getMetabolicInfoById(metabolism.getMid()) == null) {
            metabolismService.insertMetabolicInfo(metabolism);
        } else {
            metabolismService.updateMetabolicInfo(metabolism);
        }
        session.setAttribute("metabolism", metabolism);
        return "MetabolismForm";
    }
}
