package com.example.demo.repository;

import com.example.demo.domain.Metabolism;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;

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
        return null;
    }

    @Override
    public int updateInfo(Metabolism metabolism) {
        return 0;
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
