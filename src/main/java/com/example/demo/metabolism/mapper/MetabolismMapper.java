package com.example.demo.metabolism.mapper;

import com.example.demo.metabolism.domain.Metabolism;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MetabolismMapper {

    @Insert("insert into metabolism values(#{metabolism.mid}," +
            "#{metabolism.age}," +
            "#{metabolism.height}," +
            "#{metabolism.weight}," +
            "#{metabolism.gender}," +
            "#{metabolism.activity}," +
            "#{metabolism.basalMetabolicRate}," +
            "#{metabolism.activityMetabolism})")
    int save(@Param("metabolism") Metabolism metabolism);

    @Select("select * from metabolism where mid = #{mid}")
    Metabolism findById(@Param("mid") String mid);

    @Update("UPDATE metabolism set age = #{metabolism.age}," +
            "height = #{metabolism.height}, " +
            "weight = #{metabolism.weight}, " +
            "gender = #{metabolism.gender}, " +
            "activity = #{metabolism.activity}, " +
            "basal_metabolic_rate = #{metabolism.basalMetabolicRate}, " +
            "activity_metabolism = #{metabolism.activityMetabolism} " +
            "where mid = #{metabolism.mid}")
    int updateInfo(@Param("metabolism") Metabolism metabolism);

    @Delete("delete from metabolism where mid=#{mid}")
    int deleteMetabolism(String mid);
}
