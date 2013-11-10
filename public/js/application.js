$(document).ready(function() {

  var surveyForm = $('.survey-form');
  var i = 0;

  $('form').on('click', '.add-question', function(event) {
    event.preventDefault();
    i++;
    surveyForm.prepend("<br><section class='question" + i +"' data-num='" + i + "'><input type='text' name='question" + i + "'placeholder='Question'><button class='add-choice cool-button button-right'>Add Choice</button></section>");
    var count = 0
    while(count < 2) {
    $(".question" + i).append("<section><input type='text' name='q" + i + "choice" + count + "' placeholder='Choice'></section>");
    count ++;
    }
  });
  $('.survey-form').on('click', '.add-choice', j = 1 , function(event) {
    event.preventDefault();
    j++;
    var question = $(this).parent()
    var num = question.data('num')
    question.append("<section><input type='text' name='q" + num + "choice" + j + "' placeholder='Choice'></section>");
  });

});
