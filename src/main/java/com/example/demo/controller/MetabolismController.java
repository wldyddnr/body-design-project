package com.example.demo.controller;

import com.example.demo.service.MetabolismService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MetabolismController {

    private final MetabolismService metabolismService;

    public MetabolismController(MetabolismService metabolismService) {
        this.metabolismService = metabolismService;
    }

    @GetMapping("/metabolismForm")
    public String metabolismForm() {
        return "MetabolismForm";
    }
}
