<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
<link rel="stylesheet" media="print"
	href="${pageContext.request.contextPath}/static_resource/css/printing.css" />
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="mt-3 mb-5">&nbsp;</div>
		<div class="mt-5 ">
			<div class="row text-center mt-1 mb-3 p-2  border">
				<div class="col display-4">GATE PASS FOR VISITOR</div>
			</div>
				<!-- Name & Contact -->
				<div class="row">
					<div class="col-2 border font-weight-bold text-uppercase p-2 pl-2">
						Name</div>
					<div class="col-3 border text-capitalize p-1 pl-5">
						${visitor.name}</div>
					<div
						class="div-2 col-2 border font-weight-bold text-uppercase p-1 pl-2">Contact</div>
					<div class="col-3 border text-capitalize p-1 pl-5">${visitor.contact}</div>
					<div class="col-2 border ">
						<img 
							src="${pageContext.request.contextPath}/static_resource/upload/${visitor.imagePath}" 
							width=100
							height=100
						/>
					</div>
				</div>
	
				<!--  Company Details -->
				<div class="row">
					<div class="col-2 border font-weight-bold text-uppercase p-1 pl-2">
						Company</div>
					<div class="col-4 border text-capitalize p-1 pl-5">
						${visitor.company}</div>
					<div
						class="div-2 col-2 border font-weight-bold text-uppercase p-1 pl-2">Address</div>
					<div class="col-4 border text-capitalize p-1 pl-5">${visitor.address}</div>
				</div>
				<!-- Visit Reason -->
				<div class="row">
					<div class="col-2 border font-weight-bold text-uppercase p-1 pl-2">
						Visit Reason</div>
					<div class="col-10 border text-capitalize p-1 pl-5">
						${visitor.visitReason}</div>
				</div>
	
				<!-- Timing Details -->
				<!-- Header row -->
				<div class="row">
					<div class="col-4 border font-weight-bold text-center text-uppercase p-1 pl-2">
						Visit Time</div>
					<div class="col-4 border font-weight-bold text-center text-uppercase p-1 pl-2">
						Departure Time</div>
					<div class="col-4 border font-weight-bold text-center text-uppercase p-1 pl-2">
						Permitted Stay Duration</div>
				</div>
				<!-- Time Details row -->
				<div class="row">
					<div class="col-4 border text-capitalize p-1 pl-5">
						${visitor.visitDate} ${visitor.visitTime}</div>
					<div class="col-4 border text-capitalize p-1 pl-5">
						${visitor.departureDate} ${visitor.departureTime}</div>
					<div class="col-4 border text-capitalize p-1 pl-5">
						${visitor.stayDuration}</div>
				</div>
				<div class="row mt-3">
				<button id="printBtn" class="btn btn-block btn-sm btn-secondary">Print & Save</button>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	//IEEF will register a button event handler.
		(function (){
			var btnElement = document.getElementById("printBtn").addEventListener("click",function(){
				//window.print();
				window.location.href="printing";
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