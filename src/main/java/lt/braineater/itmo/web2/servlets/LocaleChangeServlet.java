package lt.braineater.itmo.web2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Locale;

import java.io.IOException;

public class LocaleChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String language = request.getParameter("lang");

        Locale locale = switch (language) {
            case "en" -> new Locale("en");
            case "lt" -> new Locale("lt", "LT");
            default -> new Locale("ru", "RU");
        };

        request.setAttribute("locale", locale);
        request.getRequestDispatcher("/index.jsp").forward(request, response);//тут проблема с адресом
    }
}
