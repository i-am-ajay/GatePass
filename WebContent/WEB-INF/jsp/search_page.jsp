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
	
	<!-- Code to make table header fixed. -->
	.table-fixed tbody {
	height: 200px;
	overflow-y: auto;
	width: 100%;
	}
	.table-fixed thead,
	.table-fixed tbody,
	.table-fixed tr,
	.table-fixed td,
	.table-fixed th {
	display: block;
	}
	.table-fixed tr:after {
	content: "";
	display: block;
	visibility: hidden;
	clear: both;
	}
	.table-fixed tbody td,
	.table-fixed thead > tr > th {
	float: left;
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
		<sf:form class="form-group mb-4" action="search_result">
		<div class="row">
			<div class="col-6 form-group">
				<label for="name_id" class="font-weight-bold">Name</label>
				<input type="text" name="name" id="name_id" class="form-control form-control-sm" />
			</div>
			<div class=" col-6 form-group">
					<label for="contact_id" class="font-weight-bold">Contact</label>
					<input type="text" class="form-control form-control-sm" id="contact_id" name="contact" /></div>
		</div>
		<div class="row">
		<div class="col-2 form-group">
				<label for="gatepass_no" class="font-weight-bold">Pass No</label>
				<input type="text" name="pass_no" id="gatepass_no" class="form-control form-control-sm" />
			</div>
			<div class="col-4 form-group">
				<label for="company_id" class="font-weight-bold">Company</label>
				<input type="text" name="company" id="company_id" class="form-control form-control-sm" />
			</div>
			<div class="col-6 form-group">
				<label for="department_id" class="font-weight-bold">Visiting Department</label>
				<input list="deptList" class="form-control form-control-sm" id="department_id" name="department">
				<datalist id="deptList">
					<core:forEach var="item" items="${deptList}">
						<option><core:out value="${item}"/></option>
					</core:forEach>
				</datalist>
			</div>
		</div>
		<div>
		<div class="row">
			<div class="col-6 form-group">
				<label for="fromdate_id" class="font-weight-bold">From Date</label>
				<input type="date" name="from_date" id="fromdate_id" class= "form-control form-control-sm" value="<%=java.time.LocalDate.now().minusDays(30)%>" />
			</div>
			<div class="col-6 form-group">
				<label for="to_date_id" class="font-weight-bold">To Date</label>
				<input type="date" name="to_date" id="to_date_id" class= "form-control form-control-sm" value= "<%=java.time.LocalDate.now()%>"/>
			</div>
				
		</div>
		<div class="row ">
			<div class="col">
				<input type="submit" class="btn btn-sm btn-block btn-secondary w-75 m-auto" value="Search" />
			</div>
		</div>
		</div>
		</sf:form>
		<!-- Result Table -->
		<table class="table table-sm table-striped m-auto ">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Pass No</th>
		      <th scope="col">Name</th>
		      <th scope="col" class="d-none d-md-table-cell">Address</th>
		      <th scope="col" class="d-none d-md-table-cell">Contact</th>
		      <th scope="col" class="d-none d-md-table-cell">email</th>
		      <th scope="col" class="d-none d-md-table-cell">Company</th>
		      <th scope="col">Visiting Department</th>
		      <th scope="col" class="d-none d-md-table-cell">Visit Time</th>
		      <th scope="col" class="d-none d-md-table-cell">Entry Time</th>
		      <th scope="col" class="d-none d-md-table-cell">Visit Reason</th>
		      <th scope="col">Person Image</th>
		      <th scope="col">Id Image</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<% int counter = 0; %>	
		    	<core:forEach var="visitor" items="${visitorList}">
		    		<%counter += 1; %>
		    		<tr>
		    			<td><%=counter%></td>
		    			<!-- visitor.getVisitorEntryList().get(0). -->
		    			<td><core:out value="${visitor[0].toString()}" /></td>
		    			<td><a href="${pageContext.request.contextPath}/get_visitor?id=${visitor[1].toString()}"><core:out value="${visitor[2].toString()}"/></a></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[3].toString()}"/></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[4].toString()}" /></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[5].toString()}" /></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[6].toString()}" /></td>
		    			<td><core:out value="${visitor[7].toString()}" /></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[8].toString()} ${visitor[9].toString()}" /></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[12].toString().substring(0,16)}" /></td>
		    			<td class="d-none d-md-table-cell"><core:out value="${visitor[13].toString()}" /></td>
		    			<td><img width="60" height="80" src="${pageContext.request.contextPath}/static_resource/images/${visitor[10].toString()}" 
		    				data-toggle="modal" data-target="#personImg<%=counter %>"/></td>
		    			<td><img width="60" height="80" src="${pageContext.request.contextPath}/static_resource/images/${visitor[11].toString()}" 
		    				data-toggle="modal" data-target="#idImg<%=counter %>"/></td>
		    		</tr>
		    		
		    		<!-- Person Image modal  -->
		    		<div class="modal fade" id="personImg<%=counter%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Person Image</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <img src="${pageContext.request.contextPath}/static_resource/images/${visitor[10].toString()}" />
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<!-- Id Image -->
						<div class="modal fade" id="idImg<%=counter%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Id Proof</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <img src="${pageContext.request.contextPath}/static_resource/images/${visitor[11].toString()}" />
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
		    	</core:forEach>
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