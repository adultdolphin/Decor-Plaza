<div class="text-center featured-title">
  <h2><?php echo $heading_title; ?></h2>
  <div class="divider"></div>
  <h3>Мы рекомендуем:</h3>
</div>

<div id="carousel<?php echo $module; ?>" class="owl-carousel featured-carousel">
  <?php foreach ($products as $product) { ?>
    <div class="item" id="<?php echo $product['product_id']; ?>">
        <div class="product-layout">
          <div class="product-thumb transition">
            <div class="image">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
              <a class="more featured-icon" href="<?php echo $product['href']; ?>"></a>
              <a class="shopping-text shopping featured-icon" onclick="addToCart('<?php echo $product['product_id']; ?>', this);" ></a>
            </div>
            <div class="caption">
                  <p class="description"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php echo $product['description']; ?></p>
              <?php if ($product['sku']) { ?>
              <div class="sku">
                <span>Артикул <?php echo $product['sku']; ?></span>
              </div>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x empty-star"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x full-star"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <span class="price-current"><?php echo $product['price']; ?></span>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span>
                <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
          </div>
        </div>

    </div>
  </div>
  <?php } ?>
</div>

<div class="cart-popup" id="cart-popup">

</div>







<script type="text/javascript"><!--

  $('#carousel<?php echo $module; ?>').owlCarousel({
    items: 5,
    itemsTablet: [1024, 3],
    autoPlay: false,
    navigation: true,
    navigationText: ['<i class="chevron-left chevron-gray"></i>', '<i class="chevron-right chevron-gray"></i>'],
    pagination: false
  });


  function addToCart(product_id, btn) {

    $.ajax({
      url: 'index.php?route=checkout/cart_popup/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function (json) {
        $('.success, .warning, .attention, .information, .error').remove();

         $.ajax({
           url: 'index.php?route=common/cart_popup',
           type: 'get',
           success: function (data) {
             $('#cart-popup').html(data);
             $('#cartModal').modal();
           }
         });


      }
    });

    var quantity = 10;



      $(btn).removeClass('shopping').addClass('empty-gold');
      $(btn).html(quantity);

    $('.empty-gold').hover(function () {
      console.log('fs');
      $(btn).removeClass('empty-gold').addClass('plus');
      $(btn).html('');
    }, function () {
      $(btn).removeClass('plus').addClass('empty-gold');
      $(btn).html(quantity);

    });

  }

  $(document).ready(function () {

  var count = 0;
  $(this).find('.featured-icon').css({'display' : 'none'});

  $('.featured-carousel .item').hover(
          function () {
            $(this).find('img').addClass('image-hover');
            //$(this).find('.image').append('<a class="more featured-icon"></a><a class="shopping-text shopping featured-icon"></a> ');
            $(this).find('.featured-icon').css({'display' : 'block'});
            $(this).find('.sku').css({'display' : 'block'});
            $(this).find('.rating').css({'display' : 'block'});





          },
          function (){
            $(this).find('img').removeClass('image-hover');
            //$(this).find('.featured-icon').remove();
            $(this).find('.featured-icon').css({'display' : 'none'});
            $(this).find('.sku').css({'display' : 'none'});
            $(this).find('.rating').css({'display' : 'none'});

          });

  });


  --></script>