<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="styles.css">
  <title>Block Height</title>

  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script type="text/javascript">
  let blockData = [];
  var height;
    $(document).on("click", "#somebutton", function() {
    	 $(".jumbotron").show();
      $.get("BlockHeightServlet", function(responseJson) {
        $.each(responseJson, function(index, item) {
        blockData.push(item);
        });
      });
      $("p").remove();
    });
    
    var millisecondsToWait = 2000;
    setTimeout(function() {
    	$(".text").append(blockData[0]);
    	$(".right_text").append(blockData[1]);
    	$(".text").append("<br>" + blockData[2]);
    	$(".right_text").append("<br>" + blockData[3]);

    }, millisecondsToWait);

  </script>
 
  
</head>
<body>
  <button id="somebutton">press here</button>
  <div class="container">
    <div class="jumbotron">
      <div class="text">
      
      </div>
      <div class="right_text">
      </div>

      </div>
    </div>
  
  
  <table id="myTable">
    <thead>
        <tr>
            <th>My Header</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>aaaaa</td> 
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td>My footer</td>
        </tr>
    </tfoot>
</table>
  
  
  
</body>

</html>