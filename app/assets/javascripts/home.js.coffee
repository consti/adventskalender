# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#kalender td').each ->
    $(this).addClass('door') if (/2014/).test $(this).find('img').attr('alt')
