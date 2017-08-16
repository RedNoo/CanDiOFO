$(function() {
   $(".search-btn").click(function(){
     location.href = $(this).attr('href') + $(this).parent().find('input[type=text]').val().replace(/\s/g, '');

   });
});
