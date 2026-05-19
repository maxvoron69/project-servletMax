<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Tic-Tac-Toe</title>
    <c:if test="${not empty winner}">
        <div id="modal" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); display: flex; justify-content: center; align-items: center; z-index: 1000;">
            <div style="background: white; padding: 20px; border-radius: 10px; text-align: center; box-shadow: 0 0 15px rgba(0,0,0,0.3);">
                <h2 id="modal-title">Игра окончена!</h2>
                <p id="modal-message"></p>
                <button onclick="window.location.href='/start'" style="padding: 10px 20px; font-size: 16px; border: none; background: #007bff; color: white; border-radius: 5px; cursor: pointer;">
                    Новая игра
                </button>
            </div>
        </div>
        <script>
            let winner = '${winner.sign}';
            let messageEl = document.getElementById('modal-message');
            if (winner === ' ') {
                document.getElementById('modal-title').textContent = 'Ничья!';
                messageEl.textContent = 'Все клетки заполнены.';
            } else {
                document.getElementById('modal-title').textContent = 'Победитель!';
                messageEl.innerHTML = 'Игрок <strong>' + winner + '</strong> победил!';
            }

            // Блокируем клики
            document.querySelectorAll('td').forEach(td => {
                td.onclick = null;
                td.style.cursor = 'default';
                td.title = '';
            });

            // Подсветка выигрышной линии
            const field = [
                '${field.getFieldData()[0].sign}',
                '${field.getFieldData()[1].sign}',
                '${field.getFieldData()[2].sign}',
                '${field.getFieldData()[3].sign}',
                '${field.getFieldData()[4].sign}',
                '${field.getFieldData()[5].sign}',
                '${field.getFieldData()[6].sign}',
                '${field.getFieldData()[7].sign}',
                '${field.getFieldData()[8].sign}'
            ];

            const winLines = [
                [0,1,2], [3,4,5], [6,7,8], // горизонтали
                [0,3,6], [1,4,7], [2,5,8], // вертикали
                [0,4,8], [2,4,6]           // диагонали
            ];

            for (let line of winLines) {
                const [a,b,c] = line;
                if (field[a] !== ' ' && field[a] === field[b] && field[a] === field[c]) {
                    document.querySelectorAll('td')[a].style.backgroundColor = '#90EE90';
                    document.querySelectorAll('td')[b].style.backgroundColor = '#90EE90';
                    document.querySelectorAll('td')[c].style.backgroundColor = '#90EE90';
                    break;
                }
            }
        </script>
    </c:if>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location.href='/logic?click=0'"><c:out value="${field[0].sign}" /></td>
        <td onclick="window.location.href='/logic?click=1'"><c:out value="${field[1].sign}" /></td>
        <td onclick="window.location.href='/logic?click=2'"><c:out value="${field[2].sign}" /></td>
    </tr>
    <tr>
        <td onclick="window.location.href='/logic?click=3'"><c:out value="${field[3].sign}" /></td>
        <td onclick="window.location.href='/logic?click=4'"><c:out value="${field[4].sign}" /></td>
        <td onclick="window.location.href='/logic?click=5'"><c:out value="${field[5].sign}" /></td>
    </tr>
    <tr>
        <td onclick="window.location.href='/logic?click=6'"><c:out value="${field[6].sign}" /></td>
        <td onclick="window.location.href='/logic?click=7'"><c:out value="${field[7].sign}" /></td>
        <td onclick="window.location.href='/logic?click=8'"><c:out value="${field[8].sign}" /></td>
    </tr>
</table>

<script>

</script>

</body>
</html>