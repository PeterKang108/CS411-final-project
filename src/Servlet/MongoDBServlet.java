package Servlet;

import DAO.MongoDAO;
import entity.MongoDBresult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name="MongoDBServlet")
public class MongoDBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Mongomethod =(String) request.getParameter("methodType");
        if(Mongomethod.equals("insert")){
            insert(request, response);
        }
        if(Mongomethod.equals("replace")){
            replace(request, response);
        }
        if(Mongomethod.equals("delete")){
            delete(request, response);
        }

    }
    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoDAO dao = new MongoDAO();
        Map<String, String> map = new HashMap<String, String>();
        String user = request.getParameter("username");
        String CPU = request.getParameter("CPU");
        if(CPU == null || CPU.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("CPU", CPU);
        }
        String GPU = request.getParameter("GPU");
        if(GPU == null || GPU.isEmpty()){

        } else{
            map.put("GPU", GPU);
        }
        String GPU2 = request.getParameter("GPU2");
        if(GPU2 == null || GPU2.isEmpty()){

        } else{
            map.put("GPU2", GPU2);
        }
        String Motherboard = request.getParameter("Motherboard");
        if(Motherboard == null || Motherboard.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Motherboard", Motherboard);
        }
        String ComputerCase = request.getParameter("ComputerCase");
        if(ComputerCase == null || ComputerCase.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("ComputerCase", ComputerCase);
        }
        String Memory = request.getParameter("Memory");
        if(Memory == null || Memory.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Memory", Memory);
        }
        String Memory2 = request.getParameter("Memory2");
        if(Memory2 == null || Memory2.isEmpty()){

        } else{
            map.put("Memory2", Memory2);
        }
        String Storage = request.getParameter("Storage");
        if(Storage == null || Storage.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Storage", Storage);
        }
        String Storage2 = request.getParameter("Storage2");
        if(Storage2 == null || Storage2.isEmpty()){

        } else{
            map.put("Storage2", Storage2);
        }
        String Storage3 = request.getParameter("Storage3");
        if(Storage3 == null || Storage3.isEmpty()){

        } else{
            map.put("Storage3", Storage3);
        }
        String Storage4 = request.getParameter("Storage4");
        if(Storage4 == null || Storage4.isEmpty()){

        } else{
            map.put("Storage4", Storage4);
        }
        String Storage5 = request.getParameter("Storage5");
        if(Storage5 == null || Storage5.isEmpty()){

        } else{
            map.put("Storage5", Storage5);
        }
        String Storage6 = request.getParameter("Storage6");
        if(Storage6 == null || Storage6.isEmpty()){

        } else{
            map.put("Storage6", Storage6);
        }
        String Coolingsystem = request.getParameter("Coolingsystem");
        if(Coolingsystem == null || Coolingsystem.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Coolingsystem", Coolingsystem);
        }
        String Powersupply = request.getParameter("Powersupply");
        if(Powersupply == null || Powersupply.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Powersupply", Powersupply);
        }
        dao.insertDocument(map, user);
        request.getRequestDispatcher("userhistory.jsp").forward(request, response);


    }
    private void replace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoDAO dao = new MongoDAO();
        Map<String, String> map = new HashMap<String, String>();
        String id = request.getParameter("id");
        String user = request.getParameter("username");
        String CPU = request.getParameter("CPU");
        if(CPU == null || CPU.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("CPU", CPU);
        }
        String GPU = request.getParameter("GPU");
        if(GPU == null || GPU.isEmpty()){

        } else{
            map.put("GPU", GPU);
        }
        String GPU2 = request.getParameter("GPU2");
        if(GPU2 == null || GPU2.isEmpty()){

        } else{
            map.put("GPU2", GPU2);
        }
        String Motherboard = request.getParameter("Motherboard");
        if(Motherboard == null || Motherboard.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Motherboard", Motherboard);
        }
        String ComputerCase = request.getParameter("ComputerCase");
        if(ComputerCase == null || ComputerCase.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("ComputerCase", ComputerCase);
        }
        String Memory = request.getParameter("Memory");
        if(Memory == null || Memory.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Memory", Memory);
        }
        String Memory2 = request.getParameter("Memory2");
        if(Memory2 == null || Memory2.isEmpty()){

        } else{
            map.put("Memory2", Memory2);
        }
        String Storage = request.getParameter("Storage");
        if(Storage == null || Storage.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Storage", Storage);
        }
        String Storage2 = request.getParameter("Storage2");
        if(Storage2 == null || Storage2.isEmpty()){

        } else{
            map.put("Storage2", Storage2);
        }
        String Storage3 = request.getParameter("Storage3");
        if(Storage3 == null || Storage3.isEmpty()){

        } else{
            map.put("Storage3", Storage3);
        }
        String Storage4 = request.getParameter("Storage4");
        if(Storage4 == null || Storage4.isEmpty()){

        } else{
            map.put("Storage4", Storage4);
        }
        String Storage5 = request.getParameter("Storage5");
        if(Storage5 == null || Storage5.isEmpty()){

        } else{
            map.put("Storage5", Storage5);
        }
        String Storage6 = request.getParameter("Storage6");
        if(Storage6 == null || Storage6.isEmpty()){

        } else{
            map.put("Storage6", Storage6);
        }
        String Coolingsystem = request.getParameter("Coolingsystem");
        if(Coolingsystem == null || Coolingsystem.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Coolingsystem", Coolingsystem);
        }
        String Powersupply = request.getParameter("Powersupply");
        if(Powersupply == null || Powersupply.isEmpty()){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            map.put("Powersupply", Powersupply);
        }
        dao.replaceDocument(map, user, id);
        request.getRequestDispatcher("userhistory.jsp").forward(request, response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoDAO dao = new MongoDAO();
        String id = request.getParameter("id");
        dao.deleteDocument(id);
        request.getRequestDispatcher("userhistory.jsp").forward(request, response);

    }
}
