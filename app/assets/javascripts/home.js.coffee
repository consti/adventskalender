# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('td.disabled').click ->
    message = "Neugierig? Dieses Türchen öffnet sich erst in #{ $(this).data('until') } Tagen."
    swal("Oops...", message, "error")

  $(document).keydown (e)->
    if e.keyCode == 27
      $('#day').fadeOut()
      $('#kalender').fadeIn()

  $('html').click ->
    $('#day').fadeOut()
    $('#kalender').fadeIn()

  $('#day').click (e)->
    e.stopPropagation()

  $('#day-close').click ->
    $('#day').fadeOut()
    $('#kalender').fadeIn()
