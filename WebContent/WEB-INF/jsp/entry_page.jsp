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
			<sf:form action="processed" modelAttribute="visitor">
				<!-- Visit Reason -->
				<div class="form-group row">
					<label for="visitR_id" class="control-label font-weight-bold col-3 col-sm-2">Visiting
						Department</label>
					<sf:input list="deptList" class="form-control form-control-sm col-6 col-md-8"
						id="visitR_id" name="Visit" path="visitReason"
						placeholder="Visit Reason" />
					<sf:errors path="visitReason" element="div"
						cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					<datalist id="deptList">
						<c:forEach var="item" items="${deptList}">
							<option><c:out value="${item}" /></option>
						</c:forEach>
					</datalist>
				</div>
				

				<!-- Visit Timings-->
				<div class="form-group row">
					<label for="vdate_id" class="control-label font-weight-bold col-3 col-sm-2">Visit
						Date</label>
					<sf:input type="date" class="form-control form-control-sm col-6 col-md-8"
						path="visitDate" name="visitDate" placeholder="dd-mm-yyyy"
						id="visitDateId" />
				</div>

				<div class="form-group row">
					<label for="vtime_id" class="control-label font-weight-bold col-3 col-sm-2">Visit
						Time</label>
					<sf:input type="time" class="form-control form-control-sm col-6 col-md-8"
						id="visitTimeId" path="visitTime" name="visitTime"
						placeholder="hh:mm a" />
				</div>
				
				<!-- Send to Photo Click page -->
				
				
				<div class="form-groups row">
					<!-- Submit Button -->
					<div class="col-8 col-md-8 m-md-auto m-sm-left">
					<sf:button type="submit"
						class="btn btn-sm btn-block btn-secondary">Save</sf:button>
					</div>
				</div>
			</sf:form>
		
		</div>
				
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