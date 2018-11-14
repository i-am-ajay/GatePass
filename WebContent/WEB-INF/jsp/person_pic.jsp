<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.nio.file.Paths" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Click a Pic</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static_resource/css/printing.css" />
</head>
<body>
<!-- This page does two things, it captuer person image first and then same page will be called to capture id. 
	After capturing id, page will redirect user to next page where user can captuer visitor visit date and time. 
 -->
	<%!
		private String actionPage = null;
		private String pathVariable = null;
	%>
	<%
	pathVariable = request.getParameter("img").equals("person_img") ? "imagePath" : "idImagePath";
	actionPage = request.getParameter("img").equals("person_img") ? "id_image_capture" : "entry_page";
	out.println(pathVariable);
	out.println(actionPage);
	%>
 	
	<div class="container">
	<%@ include file="header.jsp"%>
		<div class="mt-3">&nbsp;</div>
		<div class="mt-2">
	<!-- Show a Video Screen from Camera -->
	<h2 class="display-4"> Take A pic</h2>
	<!-- for video -->
	<div class="p-2">
	<h5 class="text-muted">Camera Image</h5>
    <video id="video" width="128" height="160" autoplay></video>
    <!-- for capturing image -->
    <div class="text-left">
    <button id="snap" class="btn btn-sm btn-secondary w-25">Snap Shot</button>
    </div>
    </div>
    <div class="mt-3 mb-3 border-bottom border-secondary"></div>
    <!-- to display image -->
    <div class="p-2">
    <h5 class="text-muted">Captured Image</h5>
    <canvas id="canvas" width="128" height="160"></canvas>
    <!-- Form to add person or id image details in model attribute -->
    <sf:form method="post" action="<%=actionPage %>" modelAttribute = "visitor" class="text-left">
		<sf:input id="image" type="hidden" 
			path = "<%=pathVariable%>" />
		<!-- Set parameter for the img parameter on the basis of which it will be decided what page will do. -->
		<input type="hidden" name="img" value="id_image" />
		<input type="submit" class="btn btn-sm btn-secondary w-25" value="Next" />    
    </sf:form>
    </div>
    </div>
	
	<!-- Show Clicked Image on Canvas -->
	</div>
	<script>
		// SET VIDEO STREAM
		var video = document.getElementById("video");
		var canva = document.getElementById("canvas");
		var context = canvas.getContext("2d");
		
		// For testing
			context.arc(100,100,50,0,2*Math.PI);
			context.lineWidth = 5;
			context.fillStyle = '#EE111';
			context.fill();
			context.strokeStyle = '#CC0000';
			context.stroke();
			
		// Capture image and draw on canvas on button click.
		document.getElementById('snap').addEventListener("click",
			function(){
				//context.drawImage(video,0,0,320,240);
				var imageUrl = canvas.toDataURL();
				console.log(imageUrl);
				document.getElementById('image').value = imageUrl;
			}
		);
		(
			function(){
				if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia){
					navigator.mediaDevices.getUserMedia("video:true").then(
						function(stream){
							video.src = window.URL.createObjectURL(stream);
							video.play();
						}		
					)
				}
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
</body>
</html>