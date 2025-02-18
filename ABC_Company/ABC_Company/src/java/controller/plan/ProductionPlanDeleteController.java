/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.plan;

import controller.authentication.BaseRBACController;
import dal.ProductionPlanDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.auth.User;

/**
 *
 * @author Golden  Lightning
 */
public class ProductionPlanDeleteController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account) throws ServletException, IOException {
        doAuthorizedPost(request, response, account);
    }
    
    
   
    @Override
protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account) 
            throws ServletException, IOException {
    String planIdStr = request.getParameter("plid");
    if (planIdStr != null) {
        int planId = Integer.parseInt(planIdStr);
        ProductionPlanDBContext dbContext = new ProductionPlanDBContext();
        dbContext.hidePlan(planId);
    }
    response.sendRedirect("list");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
