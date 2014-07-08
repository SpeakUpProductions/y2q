modal = $('#video_modal')
filter_form = $('#filter_form')

videoAction = (e) ->
  e.preventDefault()
  url = $(@).attr('href')
  $.ajax({
    url: url,
    type: 'GET'
  }).success (data) ->
      modal.html(data)
      modal.foundation('reveal', 'open')

updateVideo = ->
  editForm = $('#video-edit')
  $.ajax({
    url: editForm.attr('action'),
    data: editForm.serialize(),
    type: 'PUT'
  }).complete ->
    modal.foundation('reveal', 'close')
    getVideos()
    return
  return

cancelVideoUpdate = ->
  modal.foundation('reveal', 'close')
  return

getVideos = ->
  $.ajax({
    url: 'profile/videos',
    type: 'GET'
  }).success (data) ->
    replaceVideos(data)

checkboxChecked = ->
  $(@).closest("li").toggleClass('selected')
  filterVideos()
  return

filterVideos = ->
  $.ajax({
    url: filter_form.attr('action')
    data: filter_form.serialize()
    type: 'GET'
  }).success (data) ->
    replaceVideos(data)

  return

replaceVideos = (newVideos) ->
  $('#videos-area').html(newVideos)
  $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } })

confirmDelete = ->
  confirmationAlert = modal.find('div.hidden-delete-confirmation').html()
  modal.append(confirmationAlert)
  modal.foundation('alert')
  modal.on 'close.fndtn.alert', '[data-alert]', cancelDelete
  modal.find('a.action-button').hide()

cancelDelete = ->
  modal.find('a.action-button').show()

$ ->
  $('.what-lists li input').on 'click', checkboxChecked
  $('#videos-area').on 'click', 'a.video-link', videoAction
  modal.on 'click', '#video-edit .save-btn', updateVideo
  modal.on 'click', '#video-edit .cancel-btn', cancelVideoUpdate
  modal.on 'click', '#video-edit .delete-btn', confirmDelete
  return
