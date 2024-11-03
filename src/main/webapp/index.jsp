<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>NO MERCY</title>
    <link rel="icon" href="images/favicon.png" type="image/png">
    <meta charset="UTF-8">
</head>

<body>
<header>
    <div class="hub">
        <a href="https://sp.freehat.cc/episode/season-1/"><h1>Web<span>Lab</span></h1></a>
    </div>
    <div>
        <p><c:out value="${messages.student}" />: <c:out value="${messages.author}" /></p>
        <p><c:out value="${messages.group}" />: P3220</p>
        <p><c:out value="${messages.variant}" />: 409910</p>
    </div>
    <nav>
        <ul>
            <li><a href="https://se.ifmo.ru/teacher"><c:out value="${messages.main}" /></a></li>
            <li><a href="#grid"><c:out value="${messages.form}" /></a></li>
            <li><a href="#footer"><c:out value="${messages.partners}" /></a></li>
        </ul>
    </nav>
</header>
<div id="canvas_container">
    <canvas id="grid" width="840" height="640"></canvas>
    <div id="cringe_area">
        <img src="images/saturday.gif" alt="открытка" width="640" height="480">
    </div>
</div>

<form id="form">
    <div id="x" class="form_answers">
        <label class="form_label">X:</label>
        <button type="button" name="x" class="x_button" value="-4">-4</button>
        <button type="button" name="x" class="x_button" value="-3">-3</button>
        <button type="button" name="x" class="x_button" value="-2">-2</button>
        <button type="button" name="x" class="x_button" value="-1">-1</button>
        <button type="button" name="x" class="x_button" value="0">0</button>
        <button type="button" name="x" class="x_button" value="1">1</button>
        <button type="button" name="x" class="x_button" value="2">2</button>
        <button type="button" name="x" class="x_button" value="3">3</button>
        <button type="button" name="x" class="x_button" value="4">4</button>
    </div>

    <div class="form_answers">
        <label for="y" class="form_label">Y:</label>
        <input id="y" name="y" min="-3" max="3" class="form_answers" required>
        <span id="y_error_label" class="error_label"><- <c:out value="${messages.input_warning}" /></span>
    </div>

    <div id="r" class="form_answers">
        <label class="form_label">R:</label>
        <label><input type="checkbox" name="r" value="1"> 1</label>
        <label><input type="checkbox" name="r" value="2"> 2</label>
        <label><input type="checkbox" name="r" value="3"> 3</label>
        <label><input type="checkbox" name="r" value="4"> 4</label>
        <label><input type="checkbox" name="r" value="5"> 5</label>
    </div>

    <div class="form_answers">
        <button id="submit_button" type="submit" disabled><c:out value="${messages.submit}" /></button>
    </div>
</form>

<div class="container">
    <table id="table">
        <thead>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th><c:out value="${messages.result}" /></th>
            <th><c:out value="${messages.current_time}" /></th>
            <th><c:out value="${messages.execution_time}" /></th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
    <div id="pagination" class="pagination">

    </div>

    <footer id="footer">
        <p>
            <c:out value="${messages.footer}" />
            <a href="https://www.kickstarter.com/projects/notyourchurchcoffee/not-your-church-coffee-brew-the-unholy?ref=discovery_category&total_hits=4356&category_id=307">
                <c:out value="${messages.link}" /></a>
        </p>
        <p>
            <img src="images/itmo.png" alt="логотип ИТМО" width="300px">
        </p>
    </footer>
</div>
</body>
</html>
