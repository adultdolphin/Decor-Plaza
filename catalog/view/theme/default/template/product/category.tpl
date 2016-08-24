<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="category-content <?php echo $class; ?>"><?php echo $content_top; ?>
      <ul class="breadcrumb category-breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <h3><?php echo $heading_title; ?></h3>
     <!-- <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?> -->
      <?php if ($products) { ?>
      <div class="row sort-row">
        <div class="col-md-6 col-lg-6 text-left">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
          <select id="input-sort" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-6 col-lg-6 text-right">
          <span class="sort-span"><?php echo $text_page; ?></span>
          <?php echo $pagination; ?>
          <span class="sort-span"><?php echo $text_show_all; ?></span>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="item category-item col-md-3" id="<?php echo $product['product_id']; ?>">
          <div class="product-layout">
            <div class="product-thumb transition">
              <div class="image">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                <a class="more product-icon" href="<?php echo $product['href']; ?>"></a>
                <a class="shopping-text shopping product-icon" onclick="addToCart('<?php echo $product['product_id']; ?>', this);" ></a>
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
        <?php } ?>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--


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
    $(this).find('.product-icon').css({'display' : 'none'});

    $('.category-item').hover(
            function () {
              $(this).find('img').addClass('image-hover');
              $(this).find('.product-icon').css({'display' : 'block'});
              $(this).find('.sku').css({'display' : 'block'});
              $(this).find('.rating').css({'display' : 'block'});
            },
            function (){
              $(this).find('img').removeClass('image-hover');
              $(this).find('.product-icon').css({'display' : 'none'});
              $(this).find('.sku').css({'display' : 'none'});
              $(this).find('.rating').css({'display' : 'none'});

            });

    $('#input-sort').styler({
      onSelectOpened: function () {
        //var selectedOption = $('.jq-selectbox__select-text').text();
        //var ul = $('.jq-selectbox__dropdown').find('ul');
        $('li.sel').css({'display' : 'none'});
        //console.log(selectedOption);
      }
    });
    $('.jq-selectbox__trigger-arrow').html('<i class="fa fa-angle-right" aria-hidden="true"></i>');



  });


  --></script>