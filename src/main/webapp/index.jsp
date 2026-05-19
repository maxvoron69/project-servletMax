<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location='/logic?click=0'"><span class="${data[0].name().toLowerCase()}">${data[0].sign}</span></td>
        <td onclick="window.location='/logic?click=1'"><span class="${data[1].name().toLowerCase()}">${data[1].sign}</span></td>
        <td onclick="window.location='/logic?click=2'"><span class="${data[2].name().toLowerCase()}">${data[2].sign}</span></td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'"><span class="${data[3].name().toLowerCase()}">${data[3].sign}</span></td>
        <td onclick="window.location='/logic?click=4'"><span class="${data[4].name().toLowerCase()}">${data[4].sign}</span></td>
        <td onclick="window.location='/logic?click=5'"><span class="${data[5].name().toLowerCase()}">${data[5].sign}</span></td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'"><span class="${data[6].name().toLowerCase()}">${data[6].sign}</span></td>
        <td onclick="window.location='/logic?click=7'"><span class="${data[7].name().toLowerCase()}">${data[7].sign}</span></td>
        <td onclick="window.location='/logic?click=8'"><span class="${data[8].name().toLowerCase()}">${data[8].sign}</span></td>
    </tr>
</table>

<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner == CROSSES}">
    <h1>CROSSES WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="${winner == NOUGHTS}">
    <h1>NOUGHTS WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="${draw}">
    <h1>IT'S A DRAW</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>