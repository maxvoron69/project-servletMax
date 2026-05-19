package com.tictactoe;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logic")
public class LogicServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String clickParam = req.getParameter("click");
        if (clickParam == null || clickParam.isEmpty()) {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        int cellIndex;
        try {
            cellIndex = Integer.parseInt(clickParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect("/start");
            return;
        }

        HttpSession session = req.getSession();
        Field field = (Field) session.getAttribute("field");
        if (field == null) {
            resp.sendRedirect("/start");
            return;
        }

        if (field.getField().get(cellIndex) != Sign.EMPTY) {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        field.getField().put(cellIndex, Sign.CROSS);

        Sign winner = field.checkWin();
        if (winner != Sign.EMPTY) {
            session.setAttribute("winner", winner);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        int emptyIndex = field.getEmptyFieldIndex();
        if (emptyIndex != -1) {
            field.getField().put(emptyIndex, Sign.NOUGHT);

            winner = field.checkWin();
            if (winner != Sign.EMPTY) {
                session.setAttribute("winner", winner);
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }
        } else {
            session.setAttribute("winner", Sign.EMPTY); // Ничья
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
