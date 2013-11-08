$(document).ready(function() {

  var surveyForm = $('.survey-form');
  var i = 0;

  $('.add-question').on('click', function(event) {
    event.preventDefault();
    i++;
    surveyForm.prepend("<p class='question" + i +"'><label>" + i + " <input type='text' name='question" + i + "'placeholder='new question text'></label></p><p><button class='add-choice'>add choice</button></p>");
    $(".question" + i).append("<p><label> <input type='text' name='q" + i + "choice1' placeholder='new choice text'></label></p>")
  });
  $('.survey-form').on('click', '.add-choice', j = 1 , function(event) {
    event.preventDefault();
    j++;
    $(".question" + i).append("<p><label> <input type='text' name='q" + i + "choice" + j + "' placeholder='new choice text'></label></p>");
  });

});
