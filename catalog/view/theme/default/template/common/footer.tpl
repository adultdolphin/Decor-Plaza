<footer>
  <div class="row">
     <div class="container-fluid">
       <p class="decorPlazaHeaderText">Производители</p>
       <p class="producersList"><?php foreach ($manufacturers as $manufacturer) echo '<a href="/">'.$manufacturer['name'].' </a>';?></p>
       </div>
    </div>
    <div class="row">
      <div class="container-fluid">
      <?php if ($informations) { ?>
      <div class="col-sm-2">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
        <div class="col-sm-2">
          <h5><?php echo $text_extra; ?></h5>
          <ul class="list-unstyled">
            <li><a href="<?php echo $contact?>">Обратный звонок</a></li>
            <li><a href="<?php echo $manufacturer; ?>">Бренды</a></li>
            <li><a href="<?php echo $sitemap; ?>">Карта сайта</a></li>
            <li><a href="#search">Поиск</a></li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h5><?php echo $text_account; ?></h5>
          <ul class="list-unstyled">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          </ul>
        </div>
      <div class="col-sm-2">
        <h5>Мы в соцсетях</h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>">Facebook</a></li>
          <li><a href="<?php echo $return; ?>">Вконтакте</a></li>
          <li><a href="<?php echo $sitemap; ?>">Instagram</a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5>График работы</h5>
        <ul class="list-unstyled">
          <li>Пн-Пт с 10.00 до 19.00<br/>
          Сб-Вс с 10.00 до 20.00</li><br/>
          <li>Заказы через сайт-<br/> круглосуточно и без<br/> выходных</li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5>Телефоны</h5>
        <ul class="list-unstyled">
          <li>Бесплатно по России:</li>
          <li>8(800)555-55-55.</li><br/>
          <li>8(495)555-55-55;</li>
          <li>8(926)555-55-55.</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="container-fluid">
      <div class="col-xs-6">2018-2016 Декор-плаза.<br/>Дизайн сайта <a href="https://www.behance.net/ekso-design">Соседова Екатерина</a></div>
      <div class="col-xs-6"></div>
    </div>
    </div>
</footer>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>