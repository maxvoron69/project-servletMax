package com.tictactoe;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.tictactoe.Field;
import com.tictactoe.Sign;

@WebServlet(name = "InitServlet", value = "/start")
public class InitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(true);
        Field field = new Field();
        session.setAttribute("field", field);
        session.setAttribute("currentSign", Sign.CROSS);
        try {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendError(500);
        }
    }
}
