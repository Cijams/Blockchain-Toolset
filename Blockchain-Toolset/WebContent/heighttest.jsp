<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SO question 4112686</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
        var node = "";
        $(document).on("click", "#somebutton", function() {  // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            $.get("TestServlet", function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                var $ul = $("<ul>").appendTo($("#somediv"));
                $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                    $("<li>").text(item).appendTo($ul);      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
                });
            });
		myFunction();
        });
        
        function myFunction() {
        	
        	
        	
        	
        	var millisecondsToWait = 50;
        	setTimeout(function() {
                node = document.getElementById("somediv");
                var textContent = node.textContent;
                console.log(textContent);
        	}, millisecondsToWait);
        	
        	
        }


        
        </script>
    </head>
    <body>
        <button id="somebutton">press here</button>
        <div id="somediv"></div>
        

    </body>
</html>