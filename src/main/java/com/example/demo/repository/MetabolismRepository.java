package com.example.demo.repository;

import com.example.demo.domain.Metabolism;

public interface MetabolismRepository {

    int save(Metabolism metabolism);

    Metabolism findById(String mid);

    int updateInfo(Metabolism metabolism);
}
