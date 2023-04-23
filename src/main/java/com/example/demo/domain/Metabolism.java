package com.example.demo.domain;

import lombok.Data;

@Data
public class Metabolism {

    private String mid;
    private int age;
    private int height;
    private int weight;
    private String sex;
    private int activity;
    private int basalMetabolicRate;
    private int activityMetabolism;
}
