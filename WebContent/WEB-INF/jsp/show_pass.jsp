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
			<form class="form-inline mb-4 m-auto" action="pass">
			
			<div class="form-group border p-5 m-auto">
	    		<label for="name_id" class="font-weight-bold p-3 m-2">Pass No</label>
	    		<input type="text" id="pass_id" name="pass_no" class="form-control form-control-sm p-2  m-2">
	    		<input type="submit" value = "Show Pass" class="btn btn-sm btn-secondary p-2  m-2">
  			</div>
			
			<!--  
			<div class="border p-3">
				<div class="row m-auto form-group">
					<div class="col-3 m-auto">
						<label for="name_id" class="font-weight-bold">Pass No</label>
						<input type="text" name="pass_no" id="pass_id" class="form-control form-control-sm" />
					</div>
				</div>
				<div class="row m-auto">
					<div class="col-3 m-auto">
						<input type="submit" value = "Show Pass" class="btn btn-block mt-3">
						<!-- data-toggle="modal" data-target="#pass" 
					</div>
				</div>
				</div>
				-->
			</form>
			</div>
		</div>
			<!-- Modal For Pass -->
			
		<div class="modal fade" id="pass_modal" tabindex=-1 role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-lg w-100">
    		<div class="modal-content">
      			<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalLabel">Visitor Pass : ${pass_visitor[0].toString()}</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
	        		</button>
      			</div>
      	
				<div class="modal-body">
				      	
					<!-- Name & Contact -->
					<div class="row">
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-2 pl-2">
							Name</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
							${pass_visitor[2].toString()}</div>
						<div
							class="div-2 col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">Contact</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">${pass_visitor[4].toString()}</div>
					</div>

					<!--  Company Details -->
					<div class="row">
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							Company</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
							${pass_visitor[6].toString()}</div>
						<div
							class="div-2 col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">Address</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">${pass_visitor[3].toString()}</div>
					</div>
					<!-- Visit Reason -->
					<div class="row">
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							Visit Reason</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
							${pass_visitor[7].toString()}</div>
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							Visit Time</div>
						<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
							${pass_visitor[8].toString()} ${pass_visitor[9].toString()}</div>
					</div>
			
					<!-- Display Image and Time -->
					<div class="row">
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2 ">
							Person Image </div>
						<div class="col-md-4 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							<img 
								src="${pageContext.request.contextPath}/static_resource/images/${pass_visitor[10].toString()}" 
								width=200
								height=200 />
						</div>
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2 ">
							Id Image </div>
						<div class="col-md-4 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							<img 
								src="${pageContext.request.contextPath}/static_resource/images/${pass_visitor[11].toString()}" 
								width=200
								height=200 />
						</div>
					</div>
				</div>
				    
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
   			</div>
  			</div>
		</div>	
			
		
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/bootstrap.min.js"></script>
		
	<script>
		var passNoValue = ${pass_no}
		if(passNoValue != 0){
			$('#pass_modal').modal();
		}
	</script>

</body>
</html>