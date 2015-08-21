$(document).ready(function() {
	signupToggle();
  editToggle();
});


var signupToggle = function(){
	$('.signupButton').on('click', function(){
		$('.signupForm' ).fadeToggle( "slow", "linear" );
		$('.loginForm').toggle();
	})
}
var loginToggle = function(){
	$('.signupButton').on('click', function(){
		$('.signupForm' ).fadeToggle( "slow", "linear" );
	})
}

var editToggle = function(){
  $('.editButton').on('click', function(){
    $('.editForm' ).fadeToggle( "slow", "linear" );
    $('.messageDiv').toggle();
  })
}
