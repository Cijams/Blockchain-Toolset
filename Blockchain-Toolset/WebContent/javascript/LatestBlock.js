$.get("LatestBlockServlet", function(responseText) { 
	let time = responseText[0].replace(/['"]+/g, '').split(":");
	let height = responseText[1].replace(/['"]+/g, '').split(":");
	
	console.log(time[1]);
	console.log(height[1]);
    $("#latest").text(height[1]);
    $("#time").text(time[1]);
});

setInterval(function(){ 
$.get("LatestBlockServlet", function(responseText) { 
	let time = responseText[0].replace(/['"]+/g, '').split(":");
	let height = responseText[1].replace(/['"]+/g, '').split(":");
	
	console.log(time[1]);
	console.log(height[1]);
    $("#latest").text(height[1]);
    $("#time").text(time[1]);
});
}, 10000);
