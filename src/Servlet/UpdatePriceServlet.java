package Servlet;

import DAO.PartsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdatePriceServlet")
public class UpdatePriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.valueOf(idStr);

        String priceStr = request.getParameter("price");
        double price = Double.valueOf(priceStr);


        PartsDAO dao=new PartsDAO();
        dao.updatePrice(id, price);
        request.getRequestDispatcher("showall.jsp").forward(request, response);
    }
}
