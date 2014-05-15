# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('img.video-ss').on 'click', () ->
    modal = $('#video_modal')
    modal.find('iframe').attr('src', $(@).data('src'))
    modal.foundation('reveal', 'open')
