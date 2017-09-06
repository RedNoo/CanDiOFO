$(function() {
  $(".search-btn").click(function() {
    location.href = $(this).attr('href') + $(this).parent().find('input[type=text]').val().replace(/\s/g, '');

  });

  /*
    $('.restaurant-list-item').hover(function() {
      $(this).find('img').hide();
      $(this).find('.content').show();
    }, function() {
      $(this).find('img').show();
      $(this).find('.content').hide();

    });
    */

});


function add_to_cart(restaurantid, productid) {
  $.ajax({
    type: "POST",
    url: "/cartproducts",
    data: {
      cartproduct: {
        restaurant_id: restaurantid,
        product_id: productid
      }
    },
    success: function(msg) {
      console.log(msg.id);
      $.get("/cartproducts/" + msg.id, function(data) {
        $(".cart-item").html(data);
        //alert( "Load was performed." );
      });
    },
    error: function(xhr, status, errorThrown) {
      alert(xhr.status);

      alert(xhr.responseText);
    }
  });
}

function remove_from_cart(productid) {
  $.ajax({
    url: '/cartproducts/' + productid,
    type: 'DELETE',
    success: function(msg) {
      console.log(msg.id);
      $.get("/cartproducts/" + msg.id, function(data) {
        $(".cart-item").html(data);
        //alert( "Load was performed." );
      });
    },
    error: function(xhr, status, errorThrown) {
      alert(xhr.status);

      alert(xhr.responseText);
    }
  });

}

function checkout_now(cartid) {
  sweetAlert({
      title: "Are you sure?",
      text: "You will finish order process!",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Yes, do it!",
      closeOnConfirm: false,
      showLoaderOnConfirm: true
    },
    function() {

      $.ajax({
        type: "POST",
        url: "/orders",
        data: {
          order: {
            cart_id: cartid
          }
        },
        success: function(msg) {
          console.log(msg.result);
          swal(msg.result);
        },
        error: function(xhr, status, errorThrown) {
          swal(xhr.status);

          swal(xhr.responseText);
        }
      });
    });
}
