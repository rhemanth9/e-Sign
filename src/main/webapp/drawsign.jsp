<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	Content="no-cache,no-store,must-revalidate" />
<meta http-equiv="Pragma" Content="no-cache" />
<meta http-equiv="Expires" Content="0" />
<title>Registration</title>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="jq-signature.js"></script>
<script type="text/javascript" src="../JavaScript/signature.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	// Variables for referencing the canvas and 2dcanvas context
	var canvas, ctx;
	
	// Variables to keep track of the mouse position and left-button status
	var mouseX, mouseY, mouseDown = 0;

	// Variables to keep track of the touch position
	var touchX, touchY;

	// Keep track of the old/last position when drawing a line
	// We set it to -1 at the start to indicate that we don't have a good value for it yet
	var lastX, lastY = -1;

	// Draws a line between the specified position on the supplied canvas name
	// Parameters are: A canvas context, the x position, the y position, the size of the dot
	function drawLine(ctx, x, y, size) {

		// If lastX is not set, set lastX and lastY to the current position
		if (lastX == -1) {
			lastX = x;
			lastY = y;
		}

		// Let's use black by setting RGB values to 0, and 255 alpha (completely opaque)
		r = 0;
		g = 0;
		b = 0;
		a = 255;

		// Select a fill style
		ctx.strokeStyle = "rgba(" + r + "," + g + "," + b + "," + (a / 255)
				+ ")";

		// Set the line "cap" style to round, so lines at different angles can join into each other
		ctx.lineCap = "round";
		//ctx.lineJoin = "round";

		// Draw a filled line
		ctx.beginPath();

		// First, move to the old (previous) position
		ctx.moveTo(lastX, lastY);

		// Now draw a line to the current touch/pointer position
		ctx.lineTo(x, y);

		// Set the line thickness and draw the line
		ctx.lineWidth = size;
		ctx.stroke();

		ctx.closePath();

		// Update the last position to reference the current position
		lastX = x;
		lastY = y;
	}

	// Clear the canvas context using the canvas width and height
	function clearCanvas(canvas, ctx) {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
	}
	// Convert the canvas contents to a PNG image file, and copy it into a smaller image on the page so it can be saved more easily
	// From: http://stackoverflow.com/questions/10673122/how-to-save-canvas-as-an-image-with-canvas-todataurl
	function updateImageLocal(canvas) {
		
		
		//alert("2");
		var image_data = canvas.toDataURL("image/png");
		//alert(disp);
		//disp.classList.remove('hide');
		// Displaying the image data in a "normal" image means users need to click or long-tap on it to save, but is compatible with
		// more devices
		document.getElementById('image_display').src = image_data;// Place the image data in to the form
	}
	// Convert the canvas contents to a PNG image file, and output it in a new browser window
	// From: http://stackoverflow.com/questions/10673122/how-to-save-canvas-as-an-image-with-canvas-todataurl
	function viewImageLocal(canvas) {
		var image_data = canvas.toDataURL("image/png");
		// var image_data = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream"); // This forces a download, but is problematic
		// The browser will typically display the image in a new tab
		window.open(image_data);
	}
	// Send image to remote server. This requires the "save_remote" form further down the page.
	// This form has a hidden field called "save_remote_data". When the Save button is clicked, the form is not immediately
	// submitted, but this function is called, which first takes the image data from the canvas, and put it into the "save_remote_data" hidden field.
	// Then, the form is submitted, and a script on our web server called "save-image.php" will see the contents of the form, and the encoded image data.
	// Adapted from: http://stackoverflow.com/questions/13198131/how-to-save-a-html5-canvas-as-image-on-a-server
	function saveImageRemote(canvas) {
		var image_data = canvas.toDataURL("image/png");
		document.getElementById('save_remote_data').value = image_data; // Place the image data in to the form
		document.forms["save_remote"].submit(); // Submit the form to the server
	}

	// Keep track of the mouse button being pressed and draw a dot at current location
	function sketchpad_mouseDown() {
		mouseDown = 1;
		drawLine(ctx, mouseX, mouseY, 12);
	}

	// Keep track of the mouse button being released
	function sketchpad_mouseUp() {
		mouseDown = 0;

		// Reset lastX and lastY to -1 to indicate that they are now invalid, since we have lifted the "pen"
		lastX = -1;
		lastY = -1;

		// Update a local copy of the image for easier saving
		updateImageLocal(canvas);

	}

	// Keep track of the mouse position and draw a dot if mouse button is currently pressed
	function sketchpad_mouseMove(e) {
		// Update the mouse co-ordinates when moved
		getMousePos(e);

		// Draw a dot if the mouse button is currently being pressed
		if (mouseDown == 1) {
			drawLine(ctx, mouseX, mouseY, 12);
		}
	}

	// Get the current mouse position relative to the top-left of the canvas
	function getMousePos(e) {
		if (!e)
			var e = event;

		if (e.offsetX) {
			mouseX = e.offsetX;
			mouseY = e.offsetY;
		} else if (e.layerX) {
			mouseX = e.layerX;
			mouseY = e.layerY;
		}
	}

	
    
	// Draw something when a touch start is detected
	function sketchpad_touchStart() {
		
		
		// Update the touch co-ordinates
		getTouchPos();

		drawLine(ctx, touchX, touchY, 12);

		// Prevents an additional mousedown event being triggered
		event.preventDefault();
		
	}

	function sketchpad_touchEnd() {
		// Reset lastX and lastY to -1 to indicate that they are now invalid, since we have lifted the "pen"
		lastX = -1;
		lastY = -1;
		//
		//alert("1");
		updateImageLocal(canvas);
	}

	// Draw something and prevent the default scrolling when touch movement is detected
	function sketchpad_touchMove(e) {
		// Update the touch co-ordinates
		getTouchPos(e);

		// During a touchmove event, unlike a mousemove event, we don't need to check if the touch is engaged, since there will always be contact with the screen by definition.
		drawLine(ctx, touchX, touchY, 12);

		// Prevent a scrolling action as a result of this touchmove triggering.
		event.preventDefault();
	}

	//Called when touch is lifted from the screen of the device.
	//function sketchpad_touchEnd(e) {
	// Update a local copy of the image for easier saving
	//  updateImageLocal(canvas);
	//}

	// Get the touch position relative to the top-left of the canvas
	// When we get the raw values of pageX and pageY below, they take into account the scrolling on the page
	// but not the position relative to our target div. We'll adjust them using "target.offsetLeft" and
	// "target.offsetTop" to get the correct values in relation to the top left of the canvas.
	function getTouchPos(e) {
		if (!e)
			var e = event;

		if (e.touches) {
			if (e.touches.length == 1) { // Only deal with one finger
				var touch = e.touches[0]; // Get the information for finger #1
				touchX = touch.pageX - touch.target.offsetLeft;
				touchY = touch.pageY - touch.target.offsetTop;
			}
		}
	}

	// Set-up the canvas and add our event handlers after the page has loaded
	function init() {
		// Get the specific canvas element from the HTML document
		canvas = document.getElementById('sketchpad');

		// If the browser supports the canvas tag, get the 2d drawing context for this canvas
		if (canvas.getContext)
			ctx = canvas.getContext('2d');

		// Check that we have a valid context to draw on/with before adding event handlers
		if (ctx) {
			// React to mouse events on the canvas, and mouseup on the entire document
			canvas.addEventListener('mousedown', sketchpad_mouseDown, false);
			canvas.addEventListener('mousemove', sketchpad_mouseMove, false);
			window.addEventListener('mouseup', sketchpad_mouseUp, false);

			// React to touch events on the canvas
			canvas.addEventListener('touchstart', sketchpad_touchStart, false);
			canvas.addEventListener('touchend', sketchpad_touchEnd, false);
			canvas.addEventListener('touchmove', sketchpad_touchMove, false);

		}
	}
	
	// returns true if all color channels in each pixel are 0 (or "blank")
	function isCanvasBlank(canvas) {
		  return !canvas.getContext('2d')
		    .getImageData(0, 0, canvas.width, canvas.height).data
		    .some(channel => channel !== 0);
		}
	// jsp
	function saveCanvasImage(){
		
		
		var canvasServer = document.getElementById("sketchpad");
		var email = document.getElementById("email").value;
		var prefname = document.getElementById("prefername").value;
	    var context = canvasServer.getContext("2d");  
	    
	    var imageDataURL = canvasServer.toDataURL('image/png');
	   
	    formdata = imageDataURL.replace(/^data:image\/(png|jpg);base64,/,"");
	   
	    var ajax = new XMLHttpRequest();
	      
	    
	    ajax.onloadend = function() {
	        if (xhr.status == 200) {
	          console.log("success");
	        } else {
	          console.log("error " + this.status);
	        }
	      };
	    
	      if (!isCanvasBlank(canvas)){
	    	  
	    	  ajax.open("POST","insertDrawImage",false);
	    	  ajax.onreadystatechange=function()
	          {
	    		  //alert("Signature is uploaded");
	    	      if (ajax.readyState==4)
	    	        {
	    	            //alert("State: "+ajax.readyState+" and Status: "+ajax.status);
	    	            var successUrl = "login.jsp"; // might be a good idea to return this URL in the successful AJAX call
	    	            window.location.href = successUrl;
	    	        }
	    	      }
	    	  ajax.send(formdata+"-"+email+"-"+prefname);
	    	  
	    	  
	      }else{
	    	  alert("Please draw the image");
	      }
	    
	    
	    //ajax.setRequestHeader("Content-Type", "application/upload");
	   
	    
	    
	    if (canvas.getContext)
			ctx = canvas.getContext('2d');
	    clearCanvas(canvasServer,ctx)
	    
	   /* var imageData = myCanvas.toDataUrl();

	    $.ajax({
	        url:'/controller/path/saveCanvasImage',
	        data:{imageBase64: imageData},
	        type: 'post',
	        dataType: 'json',
	        timeout: 10000,
	        async: false,
	        error: function(){
	            console.log("WOOPS");
	        },
	        success: function(res){
	            if(res.ret==0){
	                console.log("SUCCESS");
	            }else{
	                console.log("FAIL : " + res.msg);
	            }
	        }
	    });*/
	}
</script>

<style>
/* Some CSS styling */
body {
	margin-top: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	background-color: #fff;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

.fa {
	background-color: #008CBA;
	font-size: 20px;
	color: white;
}

.fas {
	background-color: #008CBA;
	font-size: 20px;
	color: white;
}

#sketchpadapp {
	/* Prevent nearby text being highlighted when accidentally dragging mouse outside confines of the canvas */
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.leftside {
	width: 220px;
	/*height: 285px;
	background-color: #def;*/
	padding: 10px;
	border-radius: 4px;
	margin-left: 10px;
	margin-top: 20px;
}

.rightside {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	/*text-align : center;*/
}

#sketchpad {
	float: left;
	height: 200px;
	width: 700px;
	border: 2px solid #888;
	border-radius: 4px;
	position: relative;
	/*text-align : center;*/
	/* Necessary for correct mouse co-ords in Firefox */
}

/*#clearbutton {
	font-size: 15px;
	padding: 10px;
	-webkit-appearance: none;
	background: #eee;
	border: 1px solid #888;
}
*/
#save_remote {
	float: left;
	margin-left: 5px;
}

.save_box {
	/*border: 1px solid #bbb;*/
	/*text-align : center;*/
	text-align: left;
	border-radius: 4px;
	padding: 5px;
	clear: both;
}

#image_display {
	width: 180px;
	height: 100px;
	border: 1px solid #000;
	margin: 15px;
}

.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.hide {
	display: none;
}

.button1 {
	background-color: #4CAF50;
} /* Green */
.button2 {
	background-color: #008CBA;
	float: left;
	margin-left: 10px;
	margin-top: 30px;
} /* Blue */
</style>
</head>
<header> <nav class="navbar navbar-expand-md navbar-dark"
	style="background-color: #008CBA; height:70px;">
<ul class="navbar-nav">

	<li><a href="login.jsp" class="fa fa-home" class="nav-link">
			Home </a></li>


</ul>
<ul class="navbar-nav">
	<li style="padding-left: 7px;"><a href="fetchDetails"
		class="fas fa-user" class="nav-link"> Account </a></li>
</ul>
<ul class="navbar-nav">
	<li style="padding-left: 7px;"><a href="uploadsignature.jsp"
		class="fas fa-upload" class="nav-link"> Upload Sign </a></li>
</ul>

<ul class="navbar-nav navbar-collapse justify-content-end">
	<li style="padding-left: 7px;"><a href="logout"
		class="fas fa-power-off" class="nav-link"> Logout</a></li>
</ul>
</nav> </header>
<div id="captioncont" style="padding-left: 35px">
	<caption>
		<br> <br> <br>
		<h1 style="color:#008CBA;">Welcome ${loginDetails.firstname}! Please draw the
			signature and submit.!</h1>
		<h5>${success}</h5>
		<h5>${error}</h5>
	</caption>
</div>
<body onload="init()" background="/e-sign/res/img/7.jpg">
<br>
			
				<label style="font-size:18px;padding-left:20px;"><strong><b>Preferred Name:</b></strong></label>
				<input path="prefername" value="${prefername}" type="text" name="prefername" id="prefername" required>
			
	<div id="sketchpadapp">
		<div class="rightside">
			<canvas id="sketchpad" height="200" width="700"> </canvas>
		</div>
	</div>
	<div class="rightside">
		<br> <input class="button button1" type="submit"
			value="Clear" id="clearbutton"
			onclick="clearCanvas(canvas,ctx);">
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div>
		<input type="hidden" value="${loginDetails.email}"
			class="form-control" id="email" name="email" minlength="5" readonly>
		<form name='save_remote' id='save_remote' method='POST'
			onsubmit='saveCanvasImage(); return false;'>
			<input type="hidden" value="${loginDetails.email}"
				class="form-control" name="email" minlength="5" readonly>
			<!-- <input type="submit" value="Save Image" id="save_button">  -->
			<input type="submit" value="Submit" class="button button2"
				onclick="saveCanvasImage"> <input type="hidden"
				name="save_remote_data" id="save_remote_data">
		</form>
	</div>
	
	<div class="save_box">
	<h4 style="color:#008CBA;"><strong>You can see how your sign looks like in the below window</strong></h4>
		<left>
			<!-- Our Sketchpad thumbnail -->
			<img id="image_display">
		</left>
	</div>
	</div>


</body>
</html>