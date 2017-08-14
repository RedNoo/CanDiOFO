$(function() {
   $(".search-btn").click(function(){
     alert($(this).parent().find('input[type=text]').val());

   });
});
