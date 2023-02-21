package com.example.demo.service;

import com.example.demo.domain.Member;
import com.example.demo.repository.JdbcMemberRepository;
import com.example.demo.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService(JdbcMemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public int join(Member member) {
        return memberRepository.save(member);
    }

    public Member login(String id) {
        return memberRepository.findById(id);
    }

    public int checkId(String id) {
        int result = 0;
        if (memberRepository.findById(id) != null) {
             result = 1;
        }

        return result;
    }

    public int updateInfo(Member member){
        return memberRepository.updateInfo(member);
    }

    public int deleteMember(Member member) {
        return memberRepository.deleteMember(member);
    }

    public Member findPassword(String id) {
        return memberRepository.findById(id);
    }

    public Member findId(String email, String name) {
        return memberRepository.findByEmailAndName(email,name);
    }
}
