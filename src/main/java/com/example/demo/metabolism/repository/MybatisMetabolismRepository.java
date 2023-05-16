package com.example.demo.metabolism.repository;

import com.example.demo.metabolism.domain.Metabolism;
import com.example.demo.metabolism.mapper.MetabolismMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisMetabolismRepository implements MetabolismRepository{

    private MetabolismMapper mapper;

    public MybatisMetabolismRepository(MetabolismMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int save(Metabolism metabolism) {
        return mapper.save(metabolism);
    }

    @Override
    public Metabolism findById(String mid) {
        return mapper.findById(mid);
    }

    @Override
    public int updateInfo(Metabolism metabolism) {
        return mapper.updateInfo(metabolism);
    }

    @Override
    public int deleteMetabolism(String mid) {
        return mapper.deleteMetabolism(mid);
    }
}
