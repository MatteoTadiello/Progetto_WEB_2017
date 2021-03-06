/*
 * Cinema Universe - Reservation System
 * Copyright (C) 2018 Domenico Stefani, Ivan Martini, Matteo Tadiello
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * See <http://www.gnu.org/licenses/>.
 */
package it.unitn.disi.cinema.servlets;

import it.unitn.disi.cinema.common.MailSender;
import it.unitn.disi.cinema.dataaccess.DAO.DAOFactory;
import it.unitn.disi.cinema.dataaccess.DAO.UtenteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author domenico
 */
public class RestoreServlet extends HttpServlet {

    private final boolean MAIL_DEBUG = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/JSP/restorepage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        PrintWriter out;
        if (MAIL_DEBUG) {
            out = response.getWriter();
        }

        String email = request.getParameter("email");

        UtenteDAO utd = DAOFactory.getUtenteDAO();
        try {
            if ((email != null) && (utd.isUsed(email))) {
                if (MAIL_DEBUG) {
                    out.println("Ready to send message...");
                }
                session.removeAttribute("restoreErrorMessage");
                MailSender.sendPassword(utd.getUtenteByEmail(email).getPassword(), email);
                if (MAIL_DEBUG) {
                    out.println("Message Send.....");
                }

                if (!MAIL_DEBUG) {
                    request.getRequestDispatcher("/JSP/restoresuccesspage.jsp").forward(request, response);
                }
            } else {
                session.setAttribute("restoreErrorMessage", "Errore, la mail specificata non risulta iscritta");
                response.sendRedirect(request.getContextPath() + "/restore.do");
            }
        } catch (SQLException ex) {
            System.err.println("Errore, impossibile ottenere info sull'utente");
            ex.printStackTrace();
        } catch (Exception ex) {
            System.err.println("Errore, impossibile inviare la password");
            ex.printStackTrace();
        }
    }

}
