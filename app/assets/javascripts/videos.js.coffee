# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.video-ss').on 'click', () -> 
    $('#video_modal iframe').attr('src', $(this).data('src'));
    $('#video_modal').foundation('reveal', 'open')
  
$(document).ready(ready)
