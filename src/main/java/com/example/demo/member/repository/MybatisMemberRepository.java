package com.example.demo.member.repository;

import com.example.demo.member.domain.Member;
import com.example.demo.member.mapper.MemberMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisMemberRepository implements MemberRepository{

    private MemberMapper mapper;

    public MybatisMemberRepository(MemberMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int save(Member member) {
        return mapper.save(member);
    }

    @Override
    public Member findById(String id) {
        return mapper.findById(id);
    }

    @Override
    public int updateInfo(Member member) {
        return mapper.updateInfo(member);
    }

    @Override
    public int deleteMember(String id) {
        return mapper.deleteMember(id);
    }

    @Override
    public Member findByEmailAndName(String email, String name) {
        return mapper.findByEmailAndName(email,name);
    }
}
