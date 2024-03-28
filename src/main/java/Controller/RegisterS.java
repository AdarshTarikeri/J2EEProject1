package Controller;

	import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import model.Registration;
import model.Registration.Forget;
import model.Registration;
	
@WebServlet(name = "Register", urlPatterns = {"/RegisterS"})
	public class RegisterS extends HttpServlet {
	 protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html");
	
	 PrintWriter out = response.getWriter();
	 HttpSession session = request.getSession();
	 Registration reg = new Registration(session);
	 

	 try {
	 
		 if (request.getParameter("register")!= null) {
	 String name = request.getParameter("name");
	 String phone = request.getParameter("phone");
	 String email = request.getParameter("email");
	 String pw = request.getParameter("pw");
	 String cp = request.getParameter("cp");
	 
	 if (pw.equals(cp)) {
	 String status = reg.Registration(name, phone, email, pw);
	 
	 
	 if (status.equals("existed")) {
	 request.setAttribute("status", "Existed record");
	 RequestDispatcher rd1 = request.getRequestDispatcher("/Login.jsp");
	 rd1.forward(request, response);
	 } 
	 
	 else if (status.equals("success")) {
	 request.setAttribute("status", "Successfully Registered");
	 RequestDispatcher rd1 = 
	request.getRequestDispatcher("/Login.jsp");
	 rd1.forward(request, response);
	 } 
	 
	 else if (status.equals("failure")) {
	 request.setAttribute("status", "Registration failed");
	 RequestDispatcher rd1 = request.getRequestDispatcher("/Register.jsp");
	 rd1.forward(request, response);
	 }
	 }
	 } 
		 
		 else if (request.getParameter("login") != null) {
	 String email = request.getParameter("email");
	 String pass = request.getParameter("pw");
	 String status = reg.login(email, pass);
	 
	 
	 if (status.equals("success")) {
	 RequestDispatcher rd1 = request.getRequestDispatcher("/index.jsp");
	 rd1.forward(request, response);
	 } 
	 
	 else if (status.equals("failure")) {
	 request.setAttribute("status", "Login failed");
	 RequestDispatcher rd1 = request.getRequestDispatcher("/Login.jsp");
	 rd1.forward(request, response);
	 }
	 } 
		 
     else if (request.getParameter("logout") != null) {
	 session.invalidate();
	 RequestDispatcher rd1 = request.getRequestDispatcher("/index.jsp");
	 rd1.forward(request, response);
	 }
	 
		 
		 else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
         String name = request.getParameter("name");
         String pno = request.getParameter("pno");
         String email = request.getParameter("email");
         Registration u = new Registration(session);
         String status = u.update(name, pno, email);
         
         
         if (status.equals("success")) {
             request.setAttribute("status", "Profile successfully Updated");
             RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
             rd1.forward(request, response);
         } 
         
         else {
             request.setAttribute("status", "Updation failure");
             RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
             rd1.forward(request, response);
         }
         

 		}
		 
	 }
	  
	 
	 catch (Exception e) {
	 e.printStackTrace();
	 }
	 }
	 
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse 
	response)
	 throws ServletException, IOException {
	 processRequest(request, response);
	 }
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse 
	response)
	 throws ServletException, IOException {
	 processRequest(request, response);
	 }
	 
	 public String getServletInfo() {
	 return "Short description";
	 }
	}

