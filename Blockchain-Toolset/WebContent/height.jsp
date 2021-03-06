<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles/styles.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

  <title>Block Height</title>
</head>

<body>

  <div class="sticky">
    <nav id="test" class="navbar navbar-expand-lg navbar-light bg-light">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <a class="navbar-brand" href="http://encryptech.net/">Encryptech</a>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item active">
            <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Wallet</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="height.jsp">Explorer</a>
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
  <div class="tablePlace">
  <div class="container">
    <table class="table">
      <tbody>
      </tbody>
    </table>
  </div>
  <div id="demo"></div>
  <div id="spacer"></div>
  </div>
  
<div class="container">
<div class="sidenav">
  <p>Current Price</p>
  <p id="price">$</p>
  <hr>
  <p>Newest Block</p>
  <p id="latest">Genesis</p>
    <hr>
  <p>Time Mined</p>
  <p id="time">0</p>
    <hr>
   <img id="btc" src="http://encryptech.net/btc.png">
</div>
</div>

</body>

<!-- Posts the newest block in the Blockchain -->
<script src="javascript/LatestBlock.js"></script>

<!-- Posts the current price of Bitcoin every 10 seconds -->
<script src="javascript/CurrentPrice.js"></script>

<!-- Listener for 'enter' button to work with search bar. -->
<script src="javascript/Listeners.js"></script>

<!-- Button listener to call function f1() -->
<script>
  var blockData = [];
  $("#somebutton").click(function() {
    f1();
  });
  </script>

 <!-- Calls the BlockHeightServlet to invoke the Blockchain.info API
 	  to retrieve live data of a specified block. -->
<script type="text/javascript">
  function postBlockData() {
    let count = 0;
    $(".table tbody").empty();
    return new Promise(resolve => {
      var height = 0;
      height = document.getElementById("blockSearch").elements[0].value;
      $.post("BlockHeightServlet", {
          blockNumber: height + ""
        },
        function(responseJson) {
          $.each(responseJson, function(index, item) {
        	var string = [1];
            string = item.split(":", 2);

            let field = string[0].replace(/['"]+/g, '').replace(/['{]+/g, '')
              .replace(/['}]+/g, '')

            let data = string[1].replace(/['"]+/g, '').replace(/['{]+/g, '')
              .replace(/['}]+/g, '').replace(/['\]]+/g, '').replace(/['[]+/g, '')

           // var markup = `<tr><td> ${field} </td><td> ${data}`;
            var markup = "<tr><td>" + field + "</td><td>" + data;
            $("table tbody").append(markup);
            blockData.push(item);
          });
          resolve(blockData);
        });
    });
  };

  async function f1() {
    await postBlockData();
  }
</script>
<footer class="page-footer font-small blue fixed-bottom">
  <div class="footer-copyright text-center py-3">� 2018 Copyright:
    <a href="http://encryptech.net/"> Encryptech.io</a>
  </div>
</footer>
</html>