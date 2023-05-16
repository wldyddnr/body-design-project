package com.example.demo.member.mapper;

import com.example.demo.member.domain.Member;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberMapper {

    @Insert("insert into member values(#{member.id},#{member.name},#{member.password},#{member.email})")
    int save(@Param("member") Member member);

    @Select("select * from member where id = #{id}")
    Member findById(@Param("id") String id);

    @Update("UPDATE member set name = #{member.name},password = #{member.password} where id = #{member.id}")
    int updateInfo(@Param("member") Member member);

    @Delete("delete from member where id=#{id}")
    int deleteMember(@Param("id") String id);

    @Select("select * from member where email = #{email} and name = #{name}")
    Member findByEmailAndName(@Param("email") String email,@Param("name") String name);
}
