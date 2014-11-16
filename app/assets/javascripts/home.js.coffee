# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(document).keydown (e)=>
    if e.keyCode == 27
      $('#day').fadeOut()
      $('#kalender').fadeIn()

  $('.info-opened').click ->
    $('#day').fadeIn()
    $('#kalender').fadeOut()
  $('#day-close').click ->
    $('#day').fadeOut()
    $('#kalender').fadeIn()
