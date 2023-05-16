package com.example.demo.member.domain;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
public class Member {

    private String id;
    private String name;
    private String password;
    private String email;
}
