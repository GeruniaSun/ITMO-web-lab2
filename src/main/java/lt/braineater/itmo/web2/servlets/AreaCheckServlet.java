package lt.braineater.itmo.web2.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lt.braineater.itmo.web2.utils.Calculator;
import lt.braineater.itmo.web2.utils.Point;
import lt.braineater.itmo.web2.utils.Validator;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Optional;
//TODO в js сделать так чтоб x, y, r попадали в таблицу из запроса
//TODO в js считать время
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Optional<Point> point = Validator.validateParams(
                request.getParameter("x"),
                request.getParameter("y"),
                request.getParameter("r"));

        if (point.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Ваши параметры - инвалиды");
        } else {
            boolean hit = Calculator.calcHit(point.get());

            JSONObject jsonResponse = new JSONObject().put("hit", hit);

            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_CREATED);
            response.getWriter().write(jsonResponse.toString());
        }
    }
}
