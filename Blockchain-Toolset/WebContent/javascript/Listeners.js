$("#heights").on('keypress',function(e) {
    if(e.which == 13) {
    	e.preventDefault();
        $("#somebutton").click();
    }
});