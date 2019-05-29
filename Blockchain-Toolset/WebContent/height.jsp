<!DOCTYPE html>
<html lang="en">
    <head>
      <link rel="stylesheet" href="styles.css">
        <title>SO question 4112686</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).on("click", "#somebutton", function() {
                $.get("BlockHeightServlet", function(responseText) {
                    $("#somediv").text(responseText);
                });
            });
        </script>
    </head>
    <body>
        <p>Hello, World</p>
        <button id="somebutton">press here</button>
        <div id="somediv"></div>
    </body>
</html>