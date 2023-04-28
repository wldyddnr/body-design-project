package com.example.demo.repository;

import com.example.demo.domain.Member;
import com.example.demo.domain.Metabolism;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;

@Repository
public class JdbcMetabolismRepository implements MetabolismRepository{
    private final DataSource dataSource;

    public JdbcMetabolismRepository(DataSource dataSource){
        this.dataSource = dataSource;
    };

    @Override
    public int save(Metabolism metabolism) {
        String sql = "insert into metabolism values(?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            System.out.println(metabolism.toString());
            pstmt.setString(1, metabolism.getMid());
            pstmt.setInt(2, metabolism.getAge());
            pstmt.setInt(3, metabolism.getHeight());
            pstmt.setInt(4, metabolism.getWeight());
            pstmt.setString(5,metabolism.getSex());
            pstmt.setInt(6,metabolism.getActivity());
            pstmt.setInt(7,metabolism.getBasalMetabolicRate());
            pstmt.setInt(8,metabolism.getActivityMetabolism());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            throw new IllegalStateException(e);
        } finally {
            close(conn, pstmt, rs);
        }
    }

    @Override
    public Metabolism findById(String mid) {

        String sql = "select * from metabolic where mid = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Metabolism metabolism = new Metabolism();
                metabolism.setMid(rs.getString("mid"));
                metabolism.setAge(rs.getInt("age"));
                metabolism.setHeight(rs.getInt("height"));
                metabolism.setWeight(rs.getInt("weight"));
                metabolism.setSex(rs.getString("sex"));
                metabolism.setActivity(rs.getInt("activity"));
                metabolism.setBasalMetabolicRate(rs.getInt("basal_metabolic_rate"));
                metabolism.setActivityMetabolism(rs.getInt("activity_metabolism"));
                return metabolism;
            }

        } catch (Exception e) {
            throw new IllegalStateException(e);
        } finally {
            close(conn, pstmt, rs);
        }

        return null;
    }

    @Override
    public int updateInfo(Metabolism metabolism) {
        String sql = "UPDATE member set age = ?," +
                "height = ? " +
                "weight = ? " +
                "sex = ? " +
                "activity = ? " +
                "basal_metabolic_rate = ? " +
                "activity_metabolism = ? " +
                "where mid = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, metabolism.getAge());
            pstmt.setInt(2, metabolism.getHeight());
            pstmt.setInt(3, metabolism.getWeight());
            pstmt.setString(4, metabolism.getSex());
            pstmt.setInt(5, metabolism.getActivity());
            pstmt.setInt(6, metabolism.getBasalMetabolicRate());
            pstmt.setInt(7, metabolism.getActivityMetabolism());
            pstmt.setString(8,metabolism.getMid());
            int result = pstmt.executeUpdate();
            return result;


        } catch (Exception e) {
            throw new IllegalStateException(e);
        } finally {
            close(conn, pstmt, null);
        }
    }

    private Connection getConnection() {
        return DataSourceUtils.getConnection(dataSource);
    }

    private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                close(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void close(Connection conn) throws SQLException {
        DataSourceUtils.releaseConnection(conn, dataSource);
    }
}
