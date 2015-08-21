$(document).ready(function() {
	signupToggle();

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