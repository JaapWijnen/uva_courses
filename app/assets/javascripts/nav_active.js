$(document).on("ready page:change", function() {
	$('ul.nav-tabs li a').click(function(){
		$('ul.dropdown-menu li a').parent().removeClass('active');
    $('ul.dropdown-menu li a:contains('+ $(this).text() +')').parent().addClass('active');
  });
});



