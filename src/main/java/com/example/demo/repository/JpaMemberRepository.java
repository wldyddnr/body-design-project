package com.example.demo.repository;

import com.example.demo.domain.Member;

import javax.persistence.EntityManager;
import java.util.Optional;

public class JpaMemberRepository implements MemberRepository{

    private final EntityManager em;

    public JpaMemberRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public int save(Member member) {
        em.persist(member);
        return 0;
    }

    @Override
    public Member findById(String id) {
        Member member = em.find(Member.class, id);
//        return Optional.ofNullable(member);
        return member;
    }

    @Override
    public int updateInfo(Member member) {
        return 0;
    }

    @Override
    public int deleteMember(Member member) {
        return 0;
    }

    @Override
    public Member findByEmailAndName(String email, String name) {
        return null;
    }
}
