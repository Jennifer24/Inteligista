// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function(){
	// var correct-response = 0;
	// When a next button is clicked
	$(".next-btn").on('click', function(){
		// Hide the current question
		$('.question-container.active').hide();

		// Find the next question
		var nextquestion = $('.question-container.active').next();

		// Remove the active class from the current question
		$('.question-container.active').removeClass("active");

		// Make the next question active
		nextquestion.addClass("active");
		nextquestion.show()

		//Make a call to server if the question is correct

	});

});

