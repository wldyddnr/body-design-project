package com.example.demo.metabolism.service;

import com.example.demo.metabolism.domain.Metabolism;
import com.example.demo.metabolism.repository.JdbcMetabolismRepository;
import com.example.demo.metabolism.repository.MetabolismRepository;
import com.example.demo.metabolism.repository.MybatisMetabolismRepository;
import org.springframework.stereotype.Service;

@Service
public class MetabolismService {

    private final MetabolismRepository metabolismRepository;


    public MetabolismService(MybatisMetabolismRepository metabolismRepository) {
        this.metabolismRepository = metabolismRepository;
    }

    public int insertMetabolicInfo(Metabolism metabolism) {
        return metabolismRepository.save(metabolism);
    }

    public Metabolism getMetabolicInfoById(String mid) {
        return metabolismRepository.findById(mid);
    }

    public int updateMetabolicInfo(Metabolism metabolism) {
        return metabolismRepository.updateInfo(metabolism);
    }

    public int deleteMetabolism(String mid){
        return metabolismRepository.deleteMetabolism(mid);}
}
