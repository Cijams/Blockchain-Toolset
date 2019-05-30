<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="styles.css">
  <title>Block Height</title>
 
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script type="text/javascript">
  $(document).on("click", "#somebutton", function() {
	    $.get("BlockHeightServlet", function(responseJson) {
	        var $ul = $("<ul>").appendTo($("#somediv")); // Create HTML <ul> element and append it to HTML DOM element with ID "somediv".
	        $.each(responseJson, function(index, item) { // Iterate over the JSON array.
	            $("<p>").text(item).appendTo($ul);      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
	        });
	    });
	    document.getElementById("somediv").innerHTML = "";
	});
  </script>
</head>

<body>
  <button id="somebutton">press here</button>
  <div id="somediv"></div>
</html>