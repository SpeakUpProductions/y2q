// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
//= require fonts
//= require isotope

$(function(){
  var f = $('iframe');
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

  // Play & Pause
  $('.js-container a').click(function() {
    if ($("#videoheader").length > 0){
      post('pause');
      $("#videoheader").remove();
    }
  });


  function onReady() {
    post('addEventListener', 'finish');
  }

  function onFinish() {
    $("#videoheader").slideUp(1500, function() {
      $("#videoheader").remove();
    });
  }
  $(document).foundation();

});
