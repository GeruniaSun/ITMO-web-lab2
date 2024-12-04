<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>

<%@ page import="com.google.gson.Gson" %>

<%@ page import="lt.braineater.itmo.web2.utils.AttemptsData" %>
<%@ page import="lt.braineater.itmo.web2.utils.Attempt" %>

<%
    Locale locale = (Locale) request.getAttribute("locale");
    if (locale == null) {
        locale = new Locale("ru", "RU");
    }
    ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
%>

<%
    AttemptsData attempts = (session.getAttribute("data") == null)
    ? new AttemptsData()
    : (AttemptsData) session.getAttribute("data");
%>

<html>
<head>
    <title>NO MERCY</title>
    <link rel="icon" href="resources/images/favicon.png" type="image/png">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/styles/styles.css">
    <meta charset="UTF-8">
</head>

<body>
<header>
    <div class="hub">
        <a href="https://sp.freehat.cc/episode/season-1/"><h1>Web<span>Lab</span></h1></a>
    </div>
    <div>
        <p><%= bundle.getString("student") %>: <%= bundle.getString("author") %></p>
        <p><%= bundle.getString("group") %>: P3220</p>
        <p><%= bundle.getString("variant") %>: 409910</p>
    </div>
    <nav>
        <ul>
            <li><a href="https://se.ifmo.ru/teacher"><%= bundle.getString("main") %></a></li>
            <li><a href="#grid"><%= bundle.getString("form") %></a></li>
            <li><a href="#footer"><%= bundle.getString("partners") %></a></li>
            <li>
                <form action="/WebLab2/locale" method="GET">
                    <label id="lang_label" for="lang">Language:</label>
                    <select name="lang" id="lang" onchange="this.form.submit()">
                        <option value="en">English</option>
                        <option value="ru">Русский</option>
                    </select>
                </form>
            </li>
        </ul>
    </nav>
</header>
<div id="canvas_container">
    <canvas id="grid" width="800" height="800"></canvas>
    <div id="click_error_div" class="error_label"></div>
    <div id="cringe_area">
        <img src="resources/images/saturday.gif" alt="открытка" width="640" height="480">
    </div>
</div>

<form id="form">
    <div id="x" class="form_answers">
        <label class="form_label">X:</label>
        <button type="button" name="x" class="param_button" value="-3">-3</button>
        <button type="button" name="x" class="param_button" value="-2">-2</button>
        <button type="button" name="x" class="param_button" value="-1">-1</button>
        <button type="button" name="x" class="param_button" value="0">0</button>
        <button type="button" name="x" class="param_button" value="1">1</button>
        <button type="button" name="x" class="param_button" value="2">2</button>
        <button type="button" name="x" class="param_button" value="3">3</button>
        <button type="button" name="x" class="param_button" value="4">4</button>
        <button type="button" name="x" class="param_button" value="5">5</button>
    </div>

    <div class="form_answers">
        <label for="y" class="form_label">Y:</label>
        <input id="y" name="y" min="-5" max="3" class="form_answers" required>
        <span id="y_error_label" class="error_label"><- <%= bundle.getString("input_warning") %></span>
    </div>

    <div id="r" class="form_answers">
        <label class="form_label">R:</label>
        <button type="button" name="r" class="param_button" value="1">1</button>
        <button type="button" name="r" class="param_button" value="2">2</button>
        <button type="button" name="r" class="param_button" value="3">3</button>
        <button type="button" name="r" class="param_button" value="4">4</button>
        <button type="button" name="r" class="param_button" value="5">5</button>
    </div>

    <div class="form_answers">
        <button id="submit_button" type="submit" disabled><%= bundle.getString("submit") %></button>
    </div>
</form>

<div class="container">
    <table id="table">
        <thead>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th><%= bundle.getString("result") %></th>
            <th><%= bundle.getString("current_time") %></th>
            <th><%= bundle.getString("execution_time") %></th>
        </tr>
        </thead>
        <tbody id="tbody">
            <%for (Attempt attempt: attempts.getAttempts()) { %>
                <tr>
                    <td><%=attempt.x()%></td>
                    <td><%=attempt.y()%></td>
                    <td><%=attempt.r()%></td>
                    <td><%=attempt.hit()%></td>
                    <td><%=attempt.currTime()%></td>
                    <td><%=attempt.execTime()%></td>
                </tr>
            <%}%>
        </tbody>
    </table>
    <div id="pagination" class="pagination">
    </div>

    <footer id="footer">
        <p>
            <%= bundle.getString("footer") %>
            <a href="https://www.kickstarter.com/projects/notyourchurchcoffee/not-your-church-coffee-brew-the-unholy?ref=discovery_category&total_hits=4356&category_id=307">
                <%= bundle.getString("link") %></a>
        </p>
        <p>
            <img src="resources/images/itmo.png" alt="логотип ИТМО" width="300px">
        </p>
    </footer>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/scripts/canvas.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/scripts/table.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/scripts/fetch.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/scripts/script.js"></script>
</body>
</html>
