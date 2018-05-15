// notification fade out
setTimeout(function(){
  $('#notification').fadeOut('slow', function(){
    $(this).remove();
  })
}, 2500);