<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Entered Details</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
<link rel="stylesheet" media="print"
	href="${pageContext.request.contextPath}/static_resource/css/printing.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css//fine_uploader_new.css" />
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
			response.sendRedirect("login_page?page=redirect:processed");
			return;
		}
		if(loggedIn == false){
			response.sendRedirect("login_page?page=redirect:processed");
			return;
		}
	%>
	
	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="mt-3 mb-5">&nbsp;</div>
		<div class="mt-5 ">
			<div class="row text-center mt-1 mb-3 p-2  border">
				<div class="col display-4">GATE PASS FOR VISITOR</div>
			</div>
				<!-- Name & Contact -->
				<div class="row">
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-2 pl-2">
						Name</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
						${visitor.name}</div>
					<div
						class="div-2 col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">Contact</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">${visitor.contact}</div>
				</div>
	
				<!--  Company Details -->
				<div class="row">
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
						Company</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
						${visitor.company}</div>
					<div
						class="div-2 col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">Address</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">${visitor.address}</div>
				</div>
				<!-- Visit Reason -->
				<div class="row">
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
						Visit Department</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
						${visitor_entry.visitReason}</div>
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
						Visit Time</div>
					<div class="col-md-4 col-xs-6 border text-capitalize p-1 pl-5">
						${visitor_entry.visitDate} ${visitor_entry.visitTime}</div>
				</div>
				
				<!-- Visit Reason -->
					<div class="row">
						<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
							Visit Reason</div>
						<div class="col-md-10 col-xs-6 border text-capitalize p-1 pl-5">
							${visitor_entry.reason}</div>
					</div>
				
				<!-- Display Image and Time -->
				<div class="row">
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2 ">
						Person Image </div>
					<div class="col-md-4 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
						<img 
							src="${pageContext.request.contextPath}/static_resource/images/${visitor.imagePath}" 
							width=100
							height=100 />
					</div>
					<div class="col-md-2 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2 ">
						Id Image </div>
					<div class="col-md-4 col-xs-6 border font-weight-bold text-uppercase p-1 pl-2">
						<img 
							src="${pageContext.request.contextPath}/static_resource/images/${visitor.idImagePath}" 
							width=100
							height=100 />
					</div>
					</div>
				</div>
				<div class="row mt-3 mb-3">
				<sf:form action="save" modelAttribute="visitor" method = "Post" class="col m-md-auto m-sm-left" id="form" >
					<input id="saveBtn" type="submit" class="btn btn-block btn-sm btn-secondary w-50 text-center m-sm-auto" 
					 value="Save"/>
				</sf:form>
				<form action="clear" method = "Post" class="col m-md-auto m-sm-left">
					<input type="submit" class="btn btn-block btn-sm btn-secondary w-50 text-center m-sm-auto" value="Clear"/>
				</form>
				</div>
			</div>
			<div>
			</div>
	<script type="text/javascript">
	//IEEF will register a button event handler.
		(function (){
			var btnElement = document.getElementById("saveBtn");
			btnElement.addEventListener("click",function(){
				document.getElementById("form").submit();
				btnElement.disabled = true;
			});
		}());
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/jquery.min.js"> </script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/bootstrap.min.js"></script>
</body>
</html>