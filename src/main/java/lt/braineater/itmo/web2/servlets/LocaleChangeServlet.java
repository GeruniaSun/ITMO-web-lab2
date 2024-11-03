package lt.braineater.itmo.web2.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ResourceBundle;
import java.util.Locale;

import java.io.IOException;

public class LocaleChangeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getParameter("lang");
        // TODO парс параметра свичом в локаль
        Locale locale = new Locale("RU", "ru");

        ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
        request.setAttribute("bundle", bundle);
        request.setAttribute("locale", locale);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
