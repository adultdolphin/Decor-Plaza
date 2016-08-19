
<div id="slideshow-carousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <?php foreach ($banners as $banner) { ?>
        <div class="item">
            <img class="slide-img" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
            <div class="image-background"></div>
            <div class="carousel-caption">
                <div class="name"><?php echo $banner['title']; ?></div>
                <div class="divider"></div>
                <div class="description"><?php echo $banner['second_title']; ?></div>
                <div class="year"><?php echo $banner['third_title']; ?></div>
                <div class="button-area">
                    <button type="button" class="btn btn-more"><span>Подробнее</span></button>
                </div>
            </div>
        </div>
        <?php }?>
    </div>

<!-- Controls -->
    <a class="left carousel-control" href="#slideshow-carousel" data-slide="prev">
        <i class="chevron-left chevron-gray"></i>
    </a>
    <a class="right carousel-control" href="#slideshow-carousel" data-slide="next">
         <i class="chevron-right chevron-white"></i>
    </a>

</div>

<script type="text/javascript">

    $(document).ready(function(){
        var carousel = $('#slideshow-carousel');
        //carousel.carousel();

        var $item = $('#slideshow-carousel .item');
        var $wWidth = $(window).width();
        $item.eq(0).addClass('active');
        $item.width($wWidth);
        $item.height(450);
        $item.addClass('full-screen');

        $('#slideshow-carousel img').each(function() {
            var $src = $(this).attr('src');
            $(this).parent().css({
                'background-image' : 'url(' + $src + ')'
            });
            $(this).remove();
        });

        $(window).on('resize', function (){
            $wWidth = $(window).width();
            $item.width($wWidth);
        });

        $('#slideshow-carousel').carousel({
            interval: 6000,
            pause: "false"
        });


    });
    </script>

<!--
<script type="text/javascript">
    $('#slideshow<?php echo $module; ?>').owlCarousel({
        items: 5,
        autoPlay: false,
        navigation: true,
        singleItem: true,
        autoHeight: false,
        autoWidth: false,
        navigationText: ['<i class="chevron-left chevron-gray"></i>', '<i class="chevron-right chevron-white"></i>'],
        pagination: false,
        afterUpdate: function(){
            resizeImage();
        }
        /*setInterval: function(){
            $('#slideshow<?php echo $module; ?>').each(function(){
                $(this).data('owlCarousel').updateVars();
            });
        },1500),
            afterUpdate: function () {
        updateSize();
    },
    afterInit:function(){
        updateSize();
    }*/
    });

    function resizeImage() {
         $('.slide-img').css({
                 'height' : '100%'
                 'width' : '100%',
                'display' : 'block'});
    }

    /*$('.slide-img').liCover({
        parent:$('.slideshow-carousel .image '),
        position:'absolute',
        verticalAlign:'middle',
        align:'center'
    }); */


   </script> -->