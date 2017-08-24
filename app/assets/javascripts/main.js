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


function add_to_cart(restaurantid, productid) {
  $.ajax({
    type: "POST",
    url: "/cartproducts",
    data: {
      cartproduct : {
      restaurant_id: restaurantid,
      product_id: productid
      }
    },
    success: function(msg) {
      console.log(msg.id);
      $.get( "/cartproducts/"+  msg.id  , function( data ) {
      $( ".cart-item" ).html( data );
      //alert( "Load was performed." );
      });
    },
    error: function(xhr, status, errorThrown) {
      alert(xhr.status);

      alert(xhr.responseText);
    }
  });
}

function remove_from_cart(productid){
  $.ajax({
      url: '/cartproducts/'+productid,
      type: 'DELETE',
      success: function(msg){
        console.log(msg.id);
        $.get( "/cartproducts/"+  msg.id  , function( data ) {
        $( ".cart-item" ).html( data );
        //alert( "Load was performed." );
        });
      },
      error: function(xhr, status, errorThrown) {
        alert(xhr.status);

        alert(xhr.responseText);
      }
  });

}
