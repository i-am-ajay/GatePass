<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <script src="${pageContext.request.contextPath}/static_resource/js/jquery.js""></script>
        <link href="${pageContext.request.contextPath}/static_resource/css/fine_uploader.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/static_resource/js/fine_uploader.js"></script>
        
        <script type="text/template" id="qq-template">
            <div class="qq-uploader-selector qq-uploader">
                <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                    <span>Drop files here to upload</span>
                </div>
                <div class="qq-upload-button-selector qq-upload-button">
                    <div>Select Files</div>
                </div>
                <span class="qq-drop-processing-selector qq-drop-processing">
                    <span>Processing dropped files...</span>
                    <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
                </span>
                <ul class="qq-upload-list-selector qq-upload-list">
                    <li>
                        <div class="qq-progress-bar-container-selector">
                            <div class="qq-progress-bar-selector qq-progress-bar"></div>
                        </div>
                        <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                        <span class="qq-upload-file-selector qq-upload-file"></span>
                        <span class="qq-upload-size-selector qq-upload-size"></span>
                        <a class="qq-upload-cancel-selector qq-upload-cancel" href="#">Cancel</a>
                        <span class="qq-upload-status-text-selector qq-upload-status-text"></span>
                    </li>
                </ul>
            </div>
        </script>
    <head>

    <body>
        <form action="uploadParser" id="qq-form">
            <label>Enter your name</label>
            <input type="text" name="user_name" required>
            <label>Enter your email</label>
            <input type="email" name="user_email" required>
            <input type="submit" value="Done">
        </form>

        <div id="my-uploader"></div>

        <script>
            $("#my-uploader").fineUploader();
        </script>
    </body>
</html>