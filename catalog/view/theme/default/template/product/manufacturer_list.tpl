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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h3><?php echo $heading_title; ?></h3>
      <?php if ($categories) { ?>
      <div class="row alphabet">
        <div class="col-md-2"><?php echo $text_index; ?> </div>
          <div class="col-md-10">
            <?php foreach ($categories as $category) { ?>
            &nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
            <?php } ?>
            <?php for($i=0; $i<40; $i++) { ?>
            &nbsp;<a href="#">F</a>
            <?php } ?>
          </div>
      </div>

      <?php foreach ($categories as $category) { ?>
      <h3 id="<?php echo $category['name']; ?>" class="category-name"><?php echo $category['name']; ?></h3>
      <div class="category-divider"></div>
      <?php if ($category['manufacturer']) { ?>
      <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
      <div class="row category-row">
        <?php for($i=0; $i<7; $i++) { ?>
        <?php foreach ($manufacturers as $manufacturer) { ?>
        <div class="col-md-2 category-col">
          <div class="category-aria">
            <a href="<?php echo $manufacturer['href']; ?>">
              <img class="category-image img-responsive" src="<?php echo $manufacturer['thumb']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" />
              <?php echo $manufacturer['name']; ?>
          </a></div>
        </div>

        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>