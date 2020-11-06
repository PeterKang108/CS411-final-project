package Servlet;

import DAO.PartsDAO;
import entity.Parts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InsertServlet")
public class InsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.valueOf(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.valueOf(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.valueOf(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");


        PartsDAO dao=new PartsDAO();
        Parts part = new Parts();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        dao.insertParts(part);
        request.getRequestDispatcher("showall.jsp").forward(request, response);
    }
}
