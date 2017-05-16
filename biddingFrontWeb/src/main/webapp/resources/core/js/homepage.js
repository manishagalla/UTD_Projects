$(document).ready(function(){
$("#div-left").mouseenter(function(){
$("#div-left").animate({
height:'+=20px',
width:'+=20px'
});
});

$("#div-left").mouseleave(function(){
$("#div-left").animate({
height:'-=20px',
width:'-=20px'
});

});
});
$(document).ready(function() {
    $('.navbar-nav [data-toggle="tooltip"]').tooltip();
    $('.navbar-twitch-toggle').on('click', function(event) {
        event.preventDefault();
        $('.navbar-twitch').toggleClass('open');
    });
    
    $('.nav-style-toggle').on('click', function(event) {
        event.preventDefault();
        var $current = $('.nav-style-toggle.disabled');
        var $current = $('.nav-style-toggle.disabled');
        $(this).addClass('disabled');
        $current.removeClass('disabled');
        $('.navbar-twitch').removeClass('navbar-'+$current.data('type'));
        $('.navbar-twitch').addClass('navbar-'+$(this).data('type'));
    });
});

<% 
		 User user=(User)request.getAttribute("user");
		 document.write("Name : "+user.getFirstName())
%>