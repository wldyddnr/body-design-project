package com.example.demo.member.repository;

import com.example.demo.member.domain.Member;

import javax.persistence.EntityManager;

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
    public int deleteMember(String id) {
        return 0;
    }

    @Override
    public Member findByEmailAndName(String email, String name) {
        return null;
    }
}
