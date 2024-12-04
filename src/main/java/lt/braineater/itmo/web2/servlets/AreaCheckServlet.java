package lt.braineater.itmo.web2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lt.braineater.itmo.web2.utils.*;
import org.json.JSONObject;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Optional;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Optional<Point> point = Validator.validateParams(
                request.getParameter("x"),
                request.getParameter("y"),
                request.getParameter("r"));

        var session = request.getSession();
        var data = (AttemptsData) session.getAttribute("data");
        if (data == null) {
            data = new AttemptsData();
            session.setAttribute("data", data);
        }

        if (point.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Ваши параметры - инвалиды");
        } else {
            var startTime = System.currentTimeMillis();

            boolean hit = Calculator.calcHit(point.get());

            var attempt = new Attempt(
                point.get().x(),
                point.get().y(),
                point.get().r(),
                hit,
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now()),
                String.format( "%.4f", (double) (System.currentTimeMillis() - startTime)/1000)
            );

            JSONObject jsonResponse = new JSONObject()
                    .put("x", attempt.x())
                    .put("y", attempt.y())
                    .put("r", attempt.r())
                    .put("hit", attempt.hit())
                    .put("currTime", attempt.currTime())
                    .put("execTime", attempt.execTime());

            data.addAttempt(attempt);
            session.setAttribute("data", data);
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_CREATED);
            response.getWriter().write(jsonResponse.toString());
            response.getWriter().flush();
//            request.setAttribute("x", attempt.x());
//            request.setAttribute("y", attempt.y());
//            request.setAttribute("r", attempt.r());
//            request.setAttribute("hit", attempt.hit());
//            request.setAttribute("currTime", attempt.currTime());
//            request.setAttribute("execTime", attempt.execTime());

            //var dispatcher = request.getRequestDispatcher("/index.jsp");
            //dispatcher.forward(request, response);
        }
    }
}
