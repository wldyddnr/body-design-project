package com.example.demo.controller;

import com.example.demo.service.MetabolismService;
import org.springframework.stereotype.Controller;

@Controller
public class MetabolismController {

    private final MetabolismService metabolismService;

    public MetabolismController(MetabolismService metabolismService) {
        this.metabolismService = metabolismService;
    }
}
