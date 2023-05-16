package com.example.demo.member.service;

import com.example.demo.member.domain.Member;
import com.example.demo.member.repository.JdbcMemberRepository;
import com.example.demo.member.repository.MemberRepository;
import com.example.demo.member.repository.MybatisMemberRepository;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService(MybatisMemberRepository memberRepository) {
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

    public int deleteMember(String id) {
        return memberRepository.deleteMember(id);
    }

    public Member findPassword(String id) {
        return memberRepository.findById(id);
    }

    public Member findId(String email, String name) {
        return memberRepository.findByEmailAndName(email,name);
    }
}
