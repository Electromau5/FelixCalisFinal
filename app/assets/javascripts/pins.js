$(function() {
  return $('#pins').imagesLoaded(function() {
    return $('#pins').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});
$(document).ready(function() {
  $(".fancybox").fancybox({
      padding: 0,
      openEffect  : 'fade',
      closeEffect : 'fade',
      arrows : true,
      helpers : {
        overlay : {
          css : {
            'background' : 'rgba(1, 5, 1, 0.95)'
                }
                  }
                }
}); 
});

