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



            $('.shopping').click(function () {

                $(this).removeClass('shopping').addClass('plus');
                $('.plus').off("click").on("click");
                $('.plus').click(function () {
                    if(!$(this).hasClass('empty-gold')) {
                        count++;
                        $(this).removeClass('plus').addClass('empty-gold');
                        $(this).html(count);
                    }
                    $('.empty-gold').hover(function () {
                        $(this).removeClass('empty-gold').addClass('plus');
                        $(this).html('');
                    }, function () {
                        
                    });
                });


            });



    },
        function (){
            $(this).find('img').removeClass('image-hover');
            //$(this).find('.featured-icon').remove();
            $(this).find('.featured-icon').css({'display' : 'none'});
            $(this).find('.sku').css({'display' : 'none'});
            $(this).find('.rating').css({'display' : 'none'});

        });

});