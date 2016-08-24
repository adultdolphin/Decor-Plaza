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
			<?php if ($news_list) { ?>

			<div class="row">
				<?php foreach ($news_list as $news_item) { ?>
				<div class="product-layout product-list col-lg-6 col-md-6">
					<div class="divider"></div>
					<div class="product-thumb">
						<?php if($news_item['thumb']) { ?>
						<div class="image"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" /></a></div>
						<?php }?>
						<div>
							<div class="caption">
								<span class="news-date"><?php echo $news_item['posted']; ?></span> <br>
								<span class="news-header"><?php echo $news_item['title']; ?></span>
								<p><?php echo $news_item['description']; ?></p>
								<button type="button" class="btn btn-more" onclick="location.href = ('<?php echo $news_item['href']; ?>');"><i class="fa fa-angle-right fa-2x"></i></button>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
			<!--<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div> -->
			<?php } else { ?>
			<p><?php echo $text_empty; ?></p>
			<?php } ?>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>