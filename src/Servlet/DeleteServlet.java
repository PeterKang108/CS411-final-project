package Servlet;

import DAO.PartsDAO;

import java.io.IOException;

public class DeleteServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.valueOf(idStr);

        PartsDAO dao=new PartsDAO();
        dao.deleteParts(id);
        request.getRequestDispatcher("showall.jsp").forward(request, response);

    }
}
