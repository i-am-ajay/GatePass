<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="sf" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
	
<style type="text/css">
	.modal-dialog{
		width : 360px;
	}
	.modal{
		position : sticky;
	}
</style>
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
			<form class="form-group mb-4" action="search_result">
			<div class="row">
				<div class="col-3 form-group">
					<label for="name_id" class="font-weight-bold">Pass No</label>
					<input type="text" name="pass_no" id="pass_id" class="form-control form-control-sm" />
				</div>
			</div>
			<div class="row">
				<div class="col">
					<input type="submit" class="btn btn-block" value="Show Pass"/>
				</div>
			</div>
			</form>
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