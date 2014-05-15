video_template = $('#video_template')
modal = $('#video_modal')

cloneNewFlex = ->
  video_template.children('.flex-video').clone()

setSrc = (flex, src) ->
  flex.find('iframe').attr('src', src)

replaceVideos = (newVideos) ->
  $('#videos-area').html(newVideos)
  $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } })

$ ->
  $('#videos-area').on 'click', '.video-ss', () ->
    src = $(@).data('src')
    flex = cloneNewFlex()
    setSrc(flex, src)

    modal.html(flex)
    modal.foundation('reveal', 'open')

  $('.what-lists li input').on 'click', () ->
    $(@).parent().parent().toggleClass('selected')
    heartbreak_ary = []
    inspiration_ary = []
    $('#heartbreaks-filter input:checked').each (idx, item) ->
      heartbreak_ary.push($(item).data('id'))
      return
    $('#inspirations-filter input:checked').each (idx, item) ->
      inspiration_ary.push($(item).data('id'))
      return

    ajaxParams =
      url: 'videos/filtered?heartbreaks=[' + heartbreak_ary.join(',') + ']&inspirations=[' + inspiration_ary.join(',') + ']'
      type: 'GET'
      success: (data) ->
        replaceVideos(data)

    $.ajax(ajaxParams)
