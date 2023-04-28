package com.example.demo.service;

import com.example.demo.domain.Metabolism;
import com.example.demo.repository.JdbcMetabolismRepository;
import com.example.demo.repository.MetabolismRepository;
import org.springframework.stereotype.Service;

@Service
public class MetabolismService {

    private final MetabolismRepository metabolismRepository;


    public MetabolismService(JdbcMetabolismRepository metabolismRepository) {
        this.metabolismRepository = metabolismRepository;
    }

    public int insertMetabolicInfo(Metabolism metabolism) {
        return metabolismRepository.save(metabolism);
    }

    public Metabolism getMetabolicInfoById(String mid) {
        return metabolismRepository.findById(mid);
    }

    public int updateMetaboicInfo(Metabolism metabolism) {
        return metabolismRepository.updateInfo(metabolism);
    }
}
