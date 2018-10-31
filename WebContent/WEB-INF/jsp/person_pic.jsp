<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Click a Pic</title>
</head>
<body>
	<div class="container">
	<!-- Show a Video Screen from Camera -->
	<h1> Take A pic</h1>
	<!-- for video -->
	<h1 class="display-4">Camera Image</h1>
    <video id="video" width="640" height="480" autoplay></video>
    <!-- for capturing image -->
    <button id="snap">Snap Shot</button>
    <!-- to display image -->
    <h1 class="display-4">Captured Image</h1>
    <canvas id="canvas" width="640" height="480"></canvas>
    <sf:form method="post" action="" modelAttribute = "visitor">
		<sf:input id="image" type="hidden" value="" path=""/>
		<input type="submit" value="Next" />    
    </sf:form>
	
	<!-- Show Clicked Image on Canvas -->
	</div>
	<script>
		// SET VIDEO STREAM
		var video = document.getElementById("video");
		var canva = document.getElementById("canvas");
		var context = canvas.getContext("2d");
		
		// Capture image and draw on canvas on button click.
		document.getElementById('snap').addEventListener("click",
			function(){
				context.drawImage(video,0,0,640,480);
				var imageUrl = canvas.toDataUrl();
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static_resource/js/fine_uploader.js"></script>
</body>
</html>