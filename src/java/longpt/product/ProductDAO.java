/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import longpt.utils.DBUtils;

/**
 *
 * @author Long Pham
 */
public class ProductDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<ProductDTO> getAllProduct() throws NamingException, SQLException {
        List<ProductDTO> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT productID, productName, quantity, price, description FROM tblProduct";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                ProductDTO product = new ProductDTO(productID, productName, description, quantity, price);
                list.add(product);
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
        return list;
    }

    public List<ProductDTO> searchByName(String search) throws NamingException, SQLException {
        List<ProductDTO> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT productID, productName, quantity, price, description FROM tblProduct WHERE productName LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                ProductDTO product = new ProductDTO(productID, productName, description, quantity, price);
                list.add(product);
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
        return list;
    }

    public ProductDTO searchByID(String id) throws SQLException, NamingException {
        ProductDTO pro = null;
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT productID, productName, quantity, price, description FROM tblProduct "
                    + "WHERE productID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                pro = new ProductDTO(productID, productName, description, quantity, price);
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
        return pro;
    }
}
