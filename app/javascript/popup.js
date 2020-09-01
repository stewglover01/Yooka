$(document).ready(function() {
  $('.popup-btn').click(function(e) {
    $('.popup-wrap').fadeIn(500);
    $('.popup-box').removeClass('transform-out').addClass('transform-in');

    e.preventDefault();
  });
});
