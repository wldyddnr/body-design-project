package com.example.demo.member.repository;

import com.example.demo.member.domain.Member;


public interface MemberRepository {

    int save(Member member);
    Member findById(String id);

    int updateInfo(Member member);

    int deleteMember(String id);

    Member findByEmailAndName(String email, String name);
}
