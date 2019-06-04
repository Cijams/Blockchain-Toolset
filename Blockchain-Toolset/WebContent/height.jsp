<!DOCTYPE html>
<html lang="en">
	<head>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  <link rel="stylesheet" href="styles.css">
	  
	  
		<link rel="stylesheet" href="dist/ladda-themeless.min.css">
		<script src="dist/spin.min.js"></script>
		<script src="dist/ladda.min.js"></script>
	  
	
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	
	  <title>Block Height</title>
	
	  <script>
	    let blockData = [];
	    var height = 0;
	    $(document).on("click", "#somebutton", function() {

	    	blockData = [];
	    	height = document.getElementById("blockSearch").elements[0].value;
	     	$.post("TestServlet", {
	        	blockNumber: height + ""
	        },
	        function(responseJson) {
	          $.each(responseJson, function(index, item) {
	            blockData.push(item);
	          });
	          myfunc();

	        }, "json");

	    });

	    function myfunc() {
	    	
	    }
	    
	    
	    /*
	    $(function() {
	    	$('#form-somebutton').click(function(e){
	    	 	e.preventDefault();
	    	 	var l = Ladda.create(this);
	    	 	l.start();
	    	 	$.post("TestServlet", 
	    	 	    { blockNumber: height + "" },
	    	 	  function(response){
	    	 	    console.log(response);
	    	 	  }, "json")
	    	 	.always(function() { l.stop(); });
	    	 	return false;
	    	});
	    });
	    */
	    
	    
	    
	  </script>
	

	
	
	  <script>
	    var counter = 0;
	    $(document).ready(function() {
	      $("#somebutton").click(function() {
	    	  testFunc();
	      });
	    });
	    
	    function testFunc() {
	    	$( ".table tbody" ).empty();
	    	  
        	var millisecondsToWait = 2500;
        	setTimeout(function() {
    	  
        var field = blockData[2];
        var data = blockData[3];
        
        var markup = "<tr><td>" + field + "</td><td>" + data;
        $("table tbody").append(markup);
        	}, millisecondsToWait);
	    };
	  </script>
	
	  
	</head>
	
	<body>
	

	
	<div class="sticky">
	  <nav id="test" class="navbar navbar-expand-lg navbar-light bg-light">
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	      <a class="navbar-brand" href="#">Encryptech</a>
	      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	        <li class="nav-item active">
	          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Wallet</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Explorer</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Tools</a>
	        </li>
	      </ul>
	      <form id="blockSearch" class="form-inline my-2 my-lg-0">
	        <input id="heights" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
	        <button id="somebutton" class="btn btn-outline-success my-1 my-sm-0" type="button">Search</button>
	      </form>
	    </div>
	  </nav>
	</div>
	  <!-- Place holder for Blockchain data to be inserted. -->
	  <div class="container">
	    <table class="table">
	      <tbody>
	      </tbody>
	    </table>
	  </div>
	  
	<div id="spacer"></div>

<p id="demo"></p>

<script>
function myFunction() {
  var x = document.getElementById("myForm").elements[0].value;
 // alert(x);
}
</script>

		<button class="btn btn-primary ladda-button" data-style="expand-left"><span class="ladda-label">expand-left</span></button>
e
<a href="#" class="btn btn-primary ladda-button" data-style="expand-left"><span class="ladda-label">expand-left</span></a>
	</body>
	
	<footer class="page-footer font-small blue fixed-bottom">
	  <!-- Copyright -->
	  <div class="footer-copyright text-center py-3">© 2018 Copyright:
	    <a href="https://mdbootstrap.com/education/bootstrap/"> Encryptech.io</a>
	  </div>
	  <!-- Copyright -->
	</footer>
</html>