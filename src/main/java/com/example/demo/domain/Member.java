package com.example.demo.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
public class Member {

    private String id;
    private String name;
    private String password;
    private String email;
}
