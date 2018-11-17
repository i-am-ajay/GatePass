<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.nio.file.Paths" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    <video id="video" width="240" height="180"  autoplay></video>
    <!-- for capturing image -->
    <div class="text-left">
    <button id="snap" class="btn btn-sm btn-secondary w-25">Snap Shot</button>
    </div>
    </div>
    <div class="mt-3 mb-3 border-bottom border-secondary"></div>
    <!-- to display image -->
    <div class="p-2">
    <h5 class="text-muted">Captured Image</h5>
    <canvas id="canvas" width=video.videoWidth height=video.videoHeight></canvas>
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
		var canvas = document.getElementById("canvas");
		var context = canvas.getContext("2d");
		var height, width;
		// set height and width of canvas
		
		canvas.addEventListener("load",
			function(){
				originalHeight = video.videoHeight;
				originalWidth = video.videoWidth;
				height = originalHeight/ 60;
				width = originWidth/60;
				if(height === 3){
					height = 180;
					width = 240;
				}
				else{
					height = 240;
					width = 180
				}
			}
		)
			
		// Capture image and draw on canvas on button click.
		document.getElementById('snap').addEventListener("click",
			function(){
				alert(video.videoWidth+","+video.videoHeight);
				//alert(video.videoHeight);
				context.drawImage(video,0,0,width,height);
				var imageUrl = canvas.toDataURL();
				console.log(imageUrl);
				document.getElementById('image').value = imageUrl;
			}
		);
		(
			function(){
				//alert('hello');
				if(navigator.mediaDevices.getUserMedia){
					navigator.mediaDevices.getUserMedia({video:true}).then(
						function(stream){
							video.src = window.URL.createObjectURL(stream);
							video.play();
						}		
					);
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