/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Long Pham
 */
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class DispatchServlet extends HttpServlet {

    private static final String HOME = "index.jsp";
    private static final String SEARCH_CONTROLLER = "SearchServlet";
    private static final String ADD_CART_CONTROLLER = "AddCartServlet";
    private static final String EDIT_CART_CONTROLLER = "EditCartServlet";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartServlet";
    private static final String INPUT_CART_CONTROLLER = "input.jsp";
    private static final String CHECKOUT_CART_CONTROLLER = "CheckOutCartServlet";
    private static final String LOGIN_CONTROLLER = "LoginServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String button = request.getParameter("btnAction");
            if (button == null) {
                url = HOME;
            } else if (button.equals("Search")) {
                url = SEARCH_CONTROLLER;
            } else if (button.equals("Add To Cart")) {
                url = ADD_CART_CONTROLLER;
            } else if (button.equals("Edit")) {
                url = EDIT_CART_CONTROLLER;
            } else if (button.equals("Remove")) {
                url = REMOVE_CART_CONTROLLER;
            } else if (button.equals("Check Out")){
                url = INPUT_CART_CONTROLLER;
            } else if (button.equals("Login")){
                url = LOGIN_CONTROLLER;
            } else if(button.equals("Save")){
                url = CHECKOUT_CART_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at DispatchServlet: " + e.toString());
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
