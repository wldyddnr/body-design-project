package com.example.demo.metabolism.repository;

import com.example.demo.metabolism.domain.Metabolism;

public interface MetabolismRepository {

    int save(Metabolism metabolism);

    Metabolism findById(String mid);

    int updateInfo(Metabolism metabolism);

    int deleteMetabolism(String mid);
}
