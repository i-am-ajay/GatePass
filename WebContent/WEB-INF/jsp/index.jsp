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
<title>Enter Visitor Details</title>

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
			loggedIn = (Boolean)session1.getAttribute("isLogged");
		}
		catch(NullPointerException ex){
			System.out.println("Catch Called");
			response.sendRedirect("login_page?page=redirect:/");
			return;
		}
		if(loggedIn == false){
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
			<sf:form action="image_capture" modelAttribute="visitor" id="qq-form" enctype="multipart/form-data">
					<div class="form-group row">
						<sf:input type="hidden" id="entity_id" path="id" />
						<input type="hidden" name="img" value="person_img" />
						<!-- Full Name -->
						<label for="full_name_id" class="control-label col-3 col-sm-2 font-weight-bold">Full
							Name<small class="text-danger">*</small></label>
						<sf:input type="text" class="form-control form-control-sm col-6 col-sm-8"
							id="full_name_id" path="name" placeholder="Enter Name"/>
						<sf:errors path="name" element="div"
							cssClass=" border broder-primary alert alert-danger w-25 mt-1 ml-auto mr-auto p-1 font-weight-light col-6 col-sm-8" />
					</div>
					
				<div class="form-group row">
					<!-- Address -->
					<label for="address_id" class="control-label col-3 col-sm-2 font-weight-bold">
						Address</label>
					<sf:input type="text" class="form-control form-control-sm col-6 col-sm-8"
						id="address_id" name="address" path="address"
						placeholder="Address" />
				</div>

				<div class="form-group row">
					<!-- Contact -->
					<label for="contact_id" class="control-label col-3 col-sm-2 font-weight-bold">Contact<small class="text-danger">*</small></label>
					<sf:input type="text" class="form-control form-control-sm col-6 col-sm-8"
							id="contact_id" name="contact" path="contact"
							placeholder="#Contact"/>
					<sf:errors path="contact" element="div"
							cssClass="alert alert-danger w-25 mt-1 ml-auto mr-auto p-1 font-weight-light col-6 col-sm-8" />
					</div>
					
					<!-- Capture email id -->
					<div class="form-group row">
					<label for="email_id" class="control-label col-3 col-sm-2 font-weight-bold">Email</label>
					<sf:input type="text" class="form-control form-control-sm col-6 col-sm-8"
							id="email_id" name="email" path="email"
							placeholder="email"/>
					<sf:errors path="email" element="div"
							cssClass="alert alert-danger w-25 mt-1 ml-auto mr-auto p-1 font-weight-light col-6 col-sm-8" />
					</div>
					

					<!-- Company Details -->
					<div class="form-group row">
						<!-- City-->
						<label for="company_id" class="control-label font-weight-bold col-3 col-sm-2">Company<small class="text-danger">*</small></label>
						<sf:input type="text" class="form-control form-control-sm col-6 col-md-8"
							id="company_id" name="company" path="company"
							placeholder="Company Name" />
						<sf:errors path="name" element="div"
							cssClass=" border broder-primary alert alert-danger w-25 mt-1 ml-auto mr-auto p-1 font-weight-light col-6 col-sm-8" />
					</div>
					
					<!-- Send to Photo Click page -->
					<div class="form-groups row">
						<!-- Submit Button -->
						<div class="col-8 col-md-8 m-md-auto m-sm-left">
						<sf:button id="trigger-upload" type="submit"
							class="btn btn-sm btn-block btn-secondary">Click Pic</sf:button>
						</div>
					</div>
				</sf:form>
		</div>
		
		
		
		 <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Visitor Gate Pass</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <span class="font-weight-bold">Pass No : </span><span class="font-italic">${new_pass_no}</span> issued to <span class="font-weight-bold">Visitor :</span><span class="font-italic">${visitor_name}</span>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/moment.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/fine_uploader.js"></script>
	
	<script>
		var passNo = "${new_pass_no}";
		if(passNo){
			$('#myModal').modal();
			
		  <% session.setAttribute("new_pass_no",null); 
		  	session.setAttribute("visitor_name",null);
		  %>
		}
	</script>
	
</body>
</html>