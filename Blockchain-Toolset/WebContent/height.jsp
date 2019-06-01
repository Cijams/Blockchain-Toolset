<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
    form input, button{

    }
    table{

    }
    table, th, td{
        border: 4px solid black;
		background-color: orange;
    }
    table th, table td{

    }
</style>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  
  <title>Block Height</title>
  
  <script>
  let blockData = [];
  var height;
    $(document).on("click", "#somebutton", function(postData) {
    	 $(".jumbotron").show();
      $.get("BlockHeightServlet", function(responseJson) {
        $.each(responseJson, function(index, item) {
        blockData.push(item);
        });
      });
      $("p").remove();
    });
    
    var millisecondsToWait = 3000;
    setTimeout(function() {
    	$(".text").append(blockData[0]);
    	$(".right_text").append(blockData[1]);
    	$(".text").append("<br>" + blockData[2]);
    	$(".right_text").append("<br>" + blockData[3]);

    }, millisecondsToWait);

  </script>
 
 <script>
 function postData() {
	 console.log("gi");
 }
 </script>
 
 
 <script>
	var counter = 0;
    $(document).ready(function(){
        $("#somebutton").click(function(){
            var field = blockData[counter++];
            var data = blockData[counter++];
            var markup = "<tr><td>"+field+"</td><td>" + data;
            $("table tbody").append(markup);
        });
    });    
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
  
  <div class="container">
  <table class="table">
        <tbody>
        </tbody>
    </table>
  </div>
  
  
</body>

</html>