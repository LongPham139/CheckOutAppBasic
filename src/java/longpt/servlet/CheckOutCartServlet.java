/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpt.cart.CartOBJ;
import longpt.detail.DetailDAO;
import longpt.detail.DetailDTO;
import longpt.order.OrderDAO;
import longpt.order.OrderDTO;
import longpt.product.ProductDTO;

/**
 *
 * @author Long Pham
 */
public class CheckOutCartServlet extends HttpServlet {

    private static final String ERROR = "invalid.jsp";
    private static final String SUCCESS = "checkOut.jsp";
    private final static String formatOrderID = "ddMMyyyy";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            OrderDAO orderDao = new OrderDAO();
            DetailDAO detailDao = new DetailDAO();
            long mil = System.currentTimeMillis();
            Date date = new Date(mil);
            SimpleDateFormat formatOrder = new SimpleDateFormat(formatOrderID);
            String strOrder = formatOrder.format(date);
            String timeCurrent = "" + date;
            int count = 1;
            int stt = 0;
            String address = request.getParameter("txtAddress");
            String phone = request.getParameter("txtPhone");
            String orderID = orderDao.getLastOrder();
            float total = (float) session.getAttribute("TOTAL");
            float avg = (float) Math.round(total * 100) / 100;
            if (orderID.isEmpty()) {
                orderID = "C-" + strOrder + "-" + count;
                stt = 1;
            } else if (orderID != null) {
                String newOrID = orderDao.generateOderID(orderID);
                orderID = "" + newOrID;
                stt = orderDao.countUp() + 1;     
            }
            OrderDTO order = new OrderDTO(orderID, "user", timeCurrent, address, phone, avg, stt);
            boolean checkOrder = orderDao.insertOrder(order);
            if(checkOrder){
                session.setAttribute("ORDER", order);
                CartOBJ cart = (CartOBJ) session.getAttribute("CART");
                if(cart != null){
                    for (ProductDTO product : cart.getCart().values()) {
                        String detailID = detailDao.getLastDetail();
                        if(detailID.isEmpty()){
                            detailID = "D-" + "1";
                            stt = 1;
                        } else if(detailID != null){
                            String newDet = detailDao.generateDetailID(detailID);
                            detailID = newDet;
                            stt = detailDao.countUp() + 1;
                        }
                        String proID = product.getProductID();
                        int quantity = product.getQuantity();
                        DetailDTO detail = new DetailDTO(detailID, proID, orderID, quantity, stt);
                        boolean checkDet = detailDao.insertDetail(detail);
                        if(checkDet){
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckOutCartServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
