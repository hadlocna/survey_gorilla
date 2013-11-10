$(document).ready(function() {

  var surveyForm = $('.survey-form');
  var i = 0;

  $('form').on('click', '.add-question', function(event) {
    event.preventDefault();
    i++;
    surveyForm.prepend("<p class='question" + i +"' data-num='" + i + "'><label>" + i + " <input type='text' name='question" + i + "'placeholder='new question text'></label></p><p><button class='add-choice'>add choice</button></p>");
    var count = 0
    while(count < 2) {
    $(".question" + i).append("<p><label> <input type='text' name='q" + i + "choice1' placeholder='new choice text'></label></p>");
    count ++;
    }
  });
  $('.survey-form').on('click', '.add-choice', j = 1 , function(event) {
    event.preventDefault();
    j++;
    var question = $(this).parent().prev()
    var num = question.data('num')
    question.append("<p><label> <input type='text' name='q" + num + "choice" + j + "' placeholder='new choice text'></label></p>");
  });

});
