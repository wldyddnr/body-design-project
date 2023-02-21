package com.example.demo.repository;

import com.example.demo.domain.Member;

public interface MemberRepository {

    int save(Member member);
    Member findById(String id);

    int updateInfo(Member member);

    int deleteMember(Member member);

    Member findByEmailAndName(String email, String name);
}
