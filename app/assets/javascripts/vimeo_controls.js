(function() {
  $(function(){
    var iframe = $('#home_video')[0];
    var player = $f(iframe);
    var flexVideo = $('.flex-video.vimeo');

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
        player.addEvent('pause', onPause);
        player.addEvent('finish', onFinish);
        player.addEvent('playProgress', onPlayProgress);
    });

    // Call the API when a button is pressed
    $('button').bind('click', function() {
        player.api($(this).text().toLowerCase());
    });

    function onPause(id) {
      //do nothing
    }

    function onFinish(id) {
      flexVideo.slideUp(1500, function() {
        flexVideo.remove();
      });
    }

    function onPlayProgress(data, id) {
        // example of what to do in case we need it
        // status.text(data.seconds + 's played');
    }
  })
}())
