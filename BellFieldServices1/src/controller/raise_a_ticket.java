package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ticket;

/**
 * Servlet implementation class raise_a_ticket
 */
@WebServlet("/raise_a_ticket")
public class raise_a_ticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public raise_a_ticket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String projectName = request.getParameter("projectName");
         String descriptionOfProblem = request.getParameter("descriptionOfProblem");
         String requestedBy = request.getParameter("requestedBy");
         String departmentName = request.getParameter("departmentName");

         if (projectName.isEmpty() || departmentName.isEmpty() || requestedBy.isEmpty() || departmentName.isEmpty()) {
             response.getWriter().print("error");
         } else {
             Ticket ticket = new Ticket(projectName, descriptionOfProblem, requestedBy, departmentName, String.valueOf(new Date().getTime()));
             response.getWriter().print(DAO.DataAccessObject.insertTicket(ticket));
         }	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
