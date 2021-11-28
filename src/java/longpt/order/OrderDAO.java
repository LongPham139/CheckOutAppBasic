/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import longpt.utils.DBUtils;

/**
 *
 * @author Long Pham
 */
public class OrderDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String getLastOrder() throws NamingException, SQLException {
        String lastOrder = "";
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT TOP 1 oderID, stt FROM tblOrder ORDER BY stt DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                lastOrder = rs.getString("oderID");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return lastOrder;
    }

    public boolean insertOrder(OrderDTO order) throws SQLException, NamingException {
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            String sql = "INSERT INTO tblOrder(oderID, userID, time, total, stt, address, phone) "
                    + "VALUES(?,?,?,?,?,?,?) ";
            ps = con.prepareStatement(sql);
            ps.setString(1, order.getOderID());
            ps.setString(2, order.getUserID());
            ps.setString(3, order.getTime());
            ps.setFloat(4, order.getTotal());
            ps.setInt(5, order.getStt());
            ps.setString(6, order.getAddress());
            ps.setString(7, order.getPhone());
            check = ps.executeUpdate() > 0 ? true : false;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public String generateOderID(String oderID) {
        String newCh = "";
        String tmp[] = oderID.split("-");
        String id = tmp[0];
        String time = tmp[1];
        String stt = tmp[2];
        int count = Integer.parseInt(stt) + 1;
        newCh = id + "-" + time + "-" + count;

        return newCh;
    }

    public int countUp() throws NamingException, SQLException {
        int count = 0;
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT TOP 1 stt FROM tblOrder ORDER BY stt DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt("stt");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }

}
