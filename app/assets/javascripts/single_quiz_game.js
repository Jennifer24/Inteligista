// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function() {
    // var correct-response = 0;
    // When a next button is clicked

    var response = "";
    var question_number = 1;
    var total_points = 0;

    $(".next-btn").on('click', function() {
        //Make a call to server if the question is correct
        console.log(response);
        if(!response){
        	alert("hi")
        	return;
        } 

        $.ajax({
            url: "/validate_response/quiz/" + quiz_id + "/question/" + question_number + "/response/" + response,
            method: 'post',
            success: function(result) {
            	console.log(result)
                if (result.res == "correct!") {
                	total_points += 1;
                	$(".js-points").text(total_points)
                }

                // Hide the current question
                $('.question-container.active').hide();

                // Find the next question
                var nextquestion = $('.question-container.active').next();

				 // Remove the active class from the current question
                $('.question-container.active').removeClass("active");

                if (nextquestion.length === 0) {
                	console.log("help!");
                	// show results modal
                	 $('.js-points').text(total_points)
                	$('#end-quiz-modal').modal();
                }

                else {
                	// Make the next question active
                	nextquestion.addClass("active");
                	nextquestion.show();
                	question_number += 1;
                	response = "";
                }

            }
        });

    });

    $(".option").on('click', function(handledEvent) {
        var pressedButton = $(handledEvent.currentTarget);
        $('.option').removeClass('btn-primary').addClass('btn-default');
        response = pressedButton.data('selected-response');
        pressedButton.removeClass('btn-default').addClass('btn-primary');
    });

});