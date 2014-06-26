$(function(){
  var f = $('iframe#home_video');
  var url = f.attr('src').split('?')[0];

  // Listen for messages from the player
  if (window.addEventListener){
    window.addEventListener('message', onMessageReceived, false);
  }
  else {
    window.attachEvent('onmessage', onMessageReceived, false);
  }

  // Handle messages received from the player
  function onMessageReceived(e) {
    var data = JSON.parse(e.data);

    switch (data.event) {
        case 'ready':
            onReady();
            break;

        case 'finish':
            onFinish();
            break;
    }
  }

  // Helper function for sending a message to the player
  function post(action, value) {
    var data = { method: action };

    if (value) {
        data.value = value;
    }

    f.each(function(){
      var sData = JSON.stringify(data);
      this.contentWindow.postMessage(sData, url);
    });
  }

  function onReady() {
    post('addEventListener', 'finish');
  }

  function onFinish() {

    var flexVideo = $('.flex-video.vimeo')
    flexVideo.slideUp(1500, function() {
      flexVideo.remove();
    });
  }
})
