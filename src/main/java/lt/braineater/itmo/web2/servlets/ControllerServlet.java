package lt.braineater.itmo.web2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    private final AreaCheckServlet areaCheckServlet = new AreaCheckServlet();
    private final LocaleChangeServlet localeChangeServlet = new LocaleChangeServlet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/calc":
                areaCheckServlet.doGet(request, response);
                break;
            case "/locale":
                localeChangeServlet.doGet(request, response);
                break;
            default:
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
        //response.getWriter().println("ControllerServlet работает!");
    }
}