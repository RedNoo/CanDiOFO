$(function() {
  $(".search-btn").click(function() {
    location.href = $(this).attr('href') + $(this).parent().find('input[type=text]').val().replace(/\s/g, '');

  });

  $('.restaurant-list-item').hover(function() {
    $(this).find('img').hide();
    $(this).find('.content').show();
  }, function() {
    $(this).find('img').show();
    $(this).find('.content').hide();

  });


});
