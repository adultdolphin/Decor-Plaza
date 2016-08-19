<!-- Modal -->
<div id="cartModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header text-center">
                <h3 class="modal-title">Корзина покупок</h3>
            </div>
            <div class="modal-body">
                <table class="table modal-table">
                    <thead>
                    <tr>
                        <th>Товар</th>
                        <th>Наименование</th>
                        <th>Цена</th>
                        <th>Количество</th>
                        <th>Сумма</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td>
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive modal-img" />
                        </td>
                        <td class="cart-description"> <?php echo $product['description']; ?>
                            <br> <a href="<?php echo $product['href']; ?>">Подробнее</a></td>
                        <td class="cart-price"> <?php echo $product['price']; ?></td>
                        <td class="cart-amount">
                            <button type="button" class="btn btn-minus"><span>&ndash;</span></button> <span class="cart-amount-text"><?php echo $product['quantity']; ?></span>
                            <button type="button" class="btn btn-plus"><span>+</span></button> </td>
                        <td class="cart-price"> <?php echo $product['total']; ?></td>
                        <td><button type="button" class="btn btn-delete"><span>&times;</span></button></td>
                    </tr>
                    <?php }?>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-modal-close" data-dismiss="modal"><span>Продолжить покупки</span></button>
                <button type="button" class="btn btn-modal-buy"><span>Оформить заказ</span></button>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $('#cartModal').modal();

        $('.btn-plus').click(function () {
            var textSpan = $(this).siblings('.cart-amount-text');
            var currentNumber = +(textSpan.text());
            currentNumber = currentNumber + 1;
            textSpan.text(currentNumber);
        });

        $('.btn-minus').click(function () {
            var textSpan = $(this).siblings('.cart-amount-text');
            var currentNumber = +(textSpan.text());
            if(currentNumber > 0) {
                currentNumber = currentNumber - 1;
                textSpan.text(currentNumber);
            }
        });

    });
</script>