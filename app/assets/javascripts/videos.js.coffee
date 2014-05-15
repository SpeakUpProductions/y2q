# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
video_template = $('#video_template')
modal = $('#video_modal')
cloneNewFlex = ->
  video_template.children('.flex-video').clone()
setSrc = (flex, src) ->
  flex.find('iframe').attr('src', src)

$ ->
  $('img.video-ss').on 'click', () ->
    src = $(@).data('src')
    flex = cloneNewFlex()
    setSrc(flex, src)

    modal.html(flex)
    modal.foundation('reveal', 'open')
