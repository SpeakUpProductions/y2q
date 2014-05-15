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

  $('.what-lists li input').on 'click', () ->
    heartbreak_ary = [];
    inspiration_ary = [];
    $('#heartbreaks-filter input:checked').each (idx, item) ->
      heartbreak_ary.push($(item).data('id'));
      true
    $('#inspirations-filter input:checked').each (idx, item) ->
      inspiration_ary.push($(item).data('id'));
      true
    ajaxParams = url: 'videos/filtered?heartbreaks=[' + heartbreak_ary.join(',') + ']&inspirations=[' + inspiration_ary.join(',') + ']', type: 'GET', success: (data) -> 
      $('#videos-area').html(data); 
      $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } }); 
      true
    $.ajax(ajaxParams);
