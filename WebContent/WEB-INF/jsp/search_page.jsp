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
	<div class="container">
	<%@ include file="header.jsp"%>
		<div class="mt-3">&nbsp;</div>
		<div class="mt-5">
		<form class="form-group">
		<div class="row">
			<div class="col-4 form-group">
				<label for="name_id" class="font-weight-bold">Name</label>
				<input type="text" name="name" id="name_id" class="form-control form-control-sm" />
			</div>
			<div class="col-4 form-group">
					<label for="department_id" class="font-weight-bold">Department</label>
					<input type="text" class="form-control form-control-sm" id="department_id" name="department" /></div>
			</div>
			<div class="col-4">
				<label for="department_id" class="font-weight-bold">Department</label>
				<input type="text" class="form-control form-control-sm" id="department_id" name="department" /></div>
				</div>
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