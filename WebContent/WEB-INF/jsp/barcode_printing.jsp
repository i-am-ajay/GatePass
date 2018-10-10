<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<button id="myButton">Print</button>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static_resource/js/pdfkit.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static_resource/js/print.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static_resource/js/blob-stream.js"></script>
    <script>
    // create a document the same way as above
    // create a document and pipe to a blob
      document.getElementById("myButton").addEventListener("click",function(){
        var doc = new PDFDocument();
        var stream = doc.pipe(blobStream());

        // draw some text
        doc.fontSize(20)
           .text('Name: ${visitor.name}', 100, 80);

        // some vector graphics
        doc.save();
        // and some justified text wrapped into columns
        doc.fontSize(15).text('Time : ${visitor.visitTime}', 100,120)
           .font('Times-Roman', 15);
        doc.text('Gate Pass: 6',100,140).font('Times-Roman',7);

        // end and display the document in the iframe to the right
        doc.end();
        stream.on('finish', function() {
          printJS(stream.toBlobURL('application/pdf'));
        });

      });

    </script>
  </body>
</body>
</html>