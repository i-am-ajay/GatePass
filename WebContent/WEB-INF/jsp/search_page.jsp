<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Details</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
</head>
<body>
	<!-- Login Support -->
	<%
		boolean flag = false;
		// Login logic, if session is not set ask user to login.
		HttpSession session1 = request.getSession();
		boolean loggedIn = false;
		try{
			loggedIn = (Boolean)session1.getAttribute("isLogged");
		}
		catch(NullPointerException ex){
			response.sendRedirect("login_page?page=redirect:search");
			return;
		}
		if(loggedIn == false){
			response.sendRedirect("login_page?page=redirect:search");
			return;
		}
	%>
	<div class="container">
	<%@ include file="header.jsp"%>
		<div class="mt-3">&nbsp;</div>
		<div class="mt-4">
		<form class="form-group mb-4" action="processed_search">
		<div class="row">
			<div class="col-6 form-group">
				<label for="name_id" class="font-weight-bold">Name</label>
				<input type="text" name="name" id="name_id" class="form-control form-control-sm" />
			</div>
			<div class="col-6 form-group">
					<label for="department_id" class="font-weight-bold">Contact</label>
					<input type="text" class="form-control form-control-sm" id="contact_id" name="contact" /></div>
		</div>
		<div class="row">
			<div class="col-6 form-group">
				<label for="company_id" class="font-weight-bold">Company</label>
				<input type="text" name="company" id="company_id" class="form-control form-control-sm" />
			</div>
			<div class="col-6 form-group">
				<label for="date_id" class="font-weight-bold">Date</label>
				<input type="date" name="date" id="date_id" class= "form-control form-control-sm" />
			</div>
		</div>
		<div>
		<div class="row">
			<div class="col form-group">
				<label for="department_id" class="font-weight-bold">Visiting Department</label>
				<input type="text" class="form-control form-control-sm" id="department_id" name="department" /></div>
		</div>
		<div class="row ">
			<div class="col">
				<input type="submit" class="btn btn-sm btn-block btn-secondary w-75 m-auto" value="Search" />
			</div>
		</div>
		</div>
		</form>
		<!-- Result Table -->
		<table class="table table-sm table-striped">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Name</th>
		      <th scope="col">Address</th>
		      <th scope="col">Contact</th>
		      <th scope="col">Company</th>
		      <th scope="col">Visiting Department</th>
		      <th scope="col">Visit Time</th>
		      <th scope="col">Person Image</th>
		      <th scope="col">Id Image</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr>
		  </tbody>
		</table>
	</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/bootstrap.min.js"></script>

</body>
</html>