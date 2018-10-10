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
	<!-- navigation bar -->

	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="mt-3">&nbsp;</div>
		<div class="mt-5">
			<!-- Visitor Form -->
			<sf:form action="uploadParser" modelAttribute="visitor" id="qq-form" enctype="multipart/form-data">
				<div class="row">
					<div class="form-group col-6">
						<sf:input type="hidden" id="entity_id" path="id" />
						<!-- Full Name -->
						<label for="full_name_id" class="control-label font-weight-bold">Full
							Name</label>
						<sf:input type="text" class="form-control form-control-sm"
							id="full_name_id" path="name" placeholder="Enter Name" />
						<sf:errors path="name" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div>
					<div class="col-6 h-50">
						<%@ include file="file_uploader.jsp" %>
						<div id="my-uploader"></div>
					</div>
				</div>
				<div class="form-group">
					<!-- Address -->
					<label for="address_id" class="control-label font-weight-bold">
						Address</label>
					<sf:input type="text" class="form-control form-control-sm"
						id="address_id" name="address" path="address"
						placeholder="Address" />
				</div>

				<div class="row">
					<div class="form-group col-4">
						<!-- Contact -->
						<label for="contact_id" class="control-label font-weight-bold">Contact</label>
						<sf:input type="text" class="form-control form-control-sm"
							id="contact_id" name="contact" path="contact"
							placeholder="#Contact" />
					</div>

					<!-- Company Details -->
					<div class="form-group col-4">
						<!-- City-->
						<label for="company_id" class="control-label font-weight-bold">Company</label>
						<sf:input type="text" class="form-control form-control-sm"
							id="company_id" name="company" path="company"
							placeholder="Company Name" />
					</div>

					<!-- Visit Reason -->
					<div class="form-group col-4">
						<label for="visitR_id" class="control-label font-weight-bold">Visiting
							Department</label>
						<sf:input type="text" class="form-control form-control-sm"
							id="visitR_id" name="Visit" path="visitReason"
							placeholder="Visit Reason" />
						<sf:errors path="visitReason" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div>
				</div>
				<div class="row">
					<!-- Visit Timings-->
					<div class="form-group col">
						<label for="vdate_id" class="control-label font-weight-bold">Visit
							Date</label>
						<sf:input type="date" class="form-control form-control-sm"
							path="visitDate" name="visitDate" placeholder="dd-mm-yyyy"
							id="visitDateId" />
					</div>
 
					<div class="form-group col">
						<label for="vtime_id" class="control-label font-weight-bold">Visit
							Time</label>
						<sf:input type="time" class="form-control form-control-sm"
							id="visitTimeId" path="visitTime" name="visitTime"
							placeholder="hh:mm a" />
					</div>
		
				<!-- Duration -->
				</div>
				<div class="row">
					<!-- Departure Date -->
					<div class="form-group col-4">
						<label for="ddate_id" class="control-label font-weight-bold">Departure
							Date</label>
						<sf:input type="date" class="form-control form-control-sm"
							path="departureDate" name="departureDate"
							placeholder="dd-mm-yyyy" id="departureDateId" />
						<sf:errors path="departureDate" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div> 
					<!--Departure Time-->
					<div class="form-group col-4">
						<label for="dtime_id" class="control-label font-weight-bold">Departure
							Time</label>
						<sf:input type="time" class="form-control form-control-sm"
							path="departureTime" name="departureTime" placeholder="HH:mm"
							id="departureTimeId" />
						<sf:errors path="departureTime" element="div"
							cssClass="alert alert-danger w-100 mt-1 p-1 font-weight-light" />
					</div>
					
					<div class="form-group col-4">
						<label for="stay_id" class="control-label font-weight-bold">Stay
							Duration</label>
						<sf:input type="text" class="form-control form-control-sm"
							path="stayDuration" name="stayDuration" id="stayDurationId"
							placeholder="Stay time in hours" />
					</div>
				</div>
				<!-- File uploader code -->

				
					<div class="form-groups">
						<!-- Submit Button -->
						<sf:button id="trigger-upload" type="submit"
							class="btn btn-sm btn-block btn-secondary">Generate</sf:button>
					</div>
			</sf:form>
		</div>
		<!-- Response Check -->
		<div>
		<c:forEach var="item" items="${header}">
			<c:out value="${item.key} -> ${item.value}" />
		</c:forEach>
		</div>
	</div>

	<!-- In page javascript. -->
	<script type="text/javascript">
    	var uploader = new qq.FineUploader({
        	element: document.getElementById('my-uploader'),
        	callbacks:{
        		onComplete: function(id, name, responseJSON, xhr){
        				console.log("called");
        				window.location.href="processed?id="+responseJSON['visitor_id'];
        		}
        	}
    	});
		(
		// Auto update departure date and time on blur of slotfield if departure date and time is not entered.	
		function() {
			var date = Date();
			//alert(date);
			document
				.getElementById("stayDurationId")
				.addEventListener(
					"blur",
					function() {
						// departure date
						var departureDateElement = document
							.getElementById("departureDateId")
						var departureDate = departureDateElement.value;
						// departure time.
						var departureTimeElement = document.getElementById("departureTimeId")
						var departureTime = departureTimeElement.value;
						// if departureDate and Time is filled then skip.
							if (departureDate != "" && departureTime != "") {
								alert("in condition");
								return;
							}

					/*------------- Departure date and time is not filled by user --------------*/
						// find departure date and time on the basis of stay duration
						var stayDuration = document
							.getElementById("stayDurationId").value;
						stayDuration = stayDuration || 2;
						alert(stayDuration);
						var visitDate = document
							.getElementById("visitDateId").value;
						var visitTime = document
							.getElementById("visitTimeId").value;
						// Create Moment from visit date time.
						var vDateTime = visitDate + " " + visitTime;
						alert(vDateTime);
						var moment1 = moment(vDateTime,
							"YYYY-MM-DD HH:mm ");

						alert(moment1);
						moment1.add(stayDuration, 'h');
						departureDateElement.value = moment1
							.format("YYYY-MM-DD");
						document.getElementById("departureTimeId").value = moment1
							.format("HH:mm");
					});
		}()
		);
		
	</script>
		
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