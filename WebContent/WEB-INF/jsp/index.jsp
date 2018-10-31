<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/printing.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css//fine_uploader_new.css" />

</head>
<body>
	<!-- Login Support -->
	
	<!-- Login Support -->
	<%
		boolean flag = false;
		// Login logic, if session is not set ask user to login.
		HttpSession session1 = request.getSession();
		boolean loggedIn = false;
		try{
			System.out.println("Index page is called.");
			loggedIn = (Boolean)session1.getAttribute("isLogged");
		}
		catch(NullPointerException ex){
			System.out.println("Catch Called");
			response.sendRedirect("login_page?page=redirect:/");
			return;
		}
		if(loggedIn == false){
			System.out.println("False block called.");
			response.sendRedirect("login_page?page=redirect:/");
			return;
		}
	%>
	
	
	<!-- navigation bar -->

	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="mt-3">&nbsp;</div>
		<div class="mt-5">
			<!-- Visitor Form -->
			<sf:form action="uploadParser" modelAttribute="visitor" id="qq-form" enctype="multipart/form-data">
					<div class="form-group row">
						<sf:input type="hidden" id="entity_id" path="id" />
						<!-- Full Name -->
						<label for="full_name_id" class="control-label col-3 col-sm-2 font-weight-bold">Full
							Name</label>
						<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
							id="full_name_id" path="name" placeholder="Enter Name" />
						<sf:errors path="name" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div>
					
				<div class="form-group row">
					<!-- Address -->
					<label for="address_id" class="control-label col-3 col-sm-2 font-weight-bold">
						Address</label>
					<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
						id="address_id" name="address" path="address"
						placeholder="Address" />
				</div>

				<div class="form-group row">
					<!-- Contact -->
					<label for="contact_id" class="control-label col-3 col-sm-2 font-weight-bold">Contact</label>
					<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
							id="contact_id" name="contact" path="contact"
							placeholder="#Contact" />
					</div>

					<!-- Company Details -->
					<div class="form-group row">
						<!-- City-->
						<label for="company_id" class="control-label font-weight-bold col-3 col-sm-2">Company</label>
						<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
							id="company_id" name="company" path="company"
							placeholder="Company Name" />
					</div>
					
					<!-- Visit Reason -->
					<div class="form-group row">
						<label for="visitR_id" class="control-label font-weight-bold col-3 col-sm-2">Visiting
							Department</label>
						<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
							id="visitR_id" name="Visit" path="visitReason"
							placeholder="Visit Reason" />
						<sf:errors path="visitReason" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div>
					
					<!-- Send to Photo Click page -->
					
					
					<div class="form-groups row">
						<!-- Submit Button -->
						<div class="col-8 col-md-8 m-md-auto m-sm-left">
						<sf:button id="trigger-upload" type="submit"
							class="btn btn-sm btn-block btn-secondary">Generate</sf:button>
						</div>
					</div>
				</sf:form>
		
		</div>
				
		</div>
		<!-- Response Check -->
		<div>
		<c:forEach var="item" items="${header}">
			<c:out value="${item.key} -> ${item.value}" />
		</c:forEach>
		</div>
		
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/moment.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/fine_uploader.js"></script>
</body>
</html>