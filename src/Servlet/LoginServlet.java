package Servlet;

import DAO.UseraccountDAO;
import entity.Useraccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UseraccountDAO useraccountDAO = new UseraccountDAO();
        if(username != null && !username.isEmpty() && password != null && !password.isEmpty()){
            Useraccount user = useraccountDAO.Usercheck(username, password);
            if(user == null){
                request.setAttribute("errorinfo", "username and password cannot match or user doesn't exist");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else{
//                request.setAttribute("user", user);
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                request.getRequestDispatcher("userShowall.jsp").forward(request, response);
            }

        } else{
            request.setAttribute("errorinfo", "username and password should not be empty");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }


    }

}
