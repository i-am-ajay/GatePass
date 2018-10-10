<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
					<div class="col-2 border font-weight-bold text-uppercase p-2 pl-2">
						Name</div>
					<div class="col-4 border text-capitalize p-1 pl-5">
						${visitor.name}</div>
					<div
						class="div-2 col-2 border font-weight-bold text-uppercase p-1 pl-2">Contact</div>
					<div class="col-4 border text-capitalize p-1 pl-5">${visitor.contact}</div>
				</div>
</body>
</html>