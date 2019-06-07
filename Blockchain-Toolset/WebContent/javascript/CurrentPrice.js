$.get("CurrentPriceServlet", function(responseText) { 
    $("#price").text("$"+responseText);
});
setInterval(function(){ 
	$.get("CurrentPriceServlet", function(responseText) { 
	    $("#price").text("$"+responseText);
	});
}, 10000);