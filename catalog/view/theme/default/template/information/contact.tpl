<?php echo $header; ?>
<div class="container-fluid">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="decorPlazaHeaderText">Контакты</h1>
      <!--div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <?php if ($image) { ?>
            <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3"><strong><?php echo $store; ?></strong><br />
              <address>
              <?php echo $address; ?>
              </address>
              <?php if ($geocode) { ?>
              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
              <?php } ?>
            </div>
            <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
              <?php echo $telephone; ?><br />
              <br />
              <?php if ($fax) { ?>
              <strong><?php echo $text_fax; ?></strong><br>
              <?php echo $fax; ?>
              <?php } ?>
            </div>
            <div class="col-sm-3">
              <?php if ($open) { ?>
              <strong><?php echo $text_open; ?></strong><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>
        </div>
      </div-->
      <div class="row">
        <div class="col-sm-6">
          <?php if ($geocode) { ?>
            <div id="map_canvas"></div>
          <?php } else echo "К сожалению, на данный момент карта недоступна." ?>
        </div>
        <div class="col-sm-6">
          <div class="row">
            <div class="col-lg-1">
                 <img class="contactsIcon" src="/image/catalog/adress.png">
            </div>
            <div class="col-lg-11">
              <span class="headerText">Адрес:</span><br/>
            <?php echo $address; ?>
              </div>
          </div>
          <div class="row">
            <div class="col-lg-1">
              <img class="contactsIcon" src="/image/catalog/schedule.png">
            </div>
            <div class="col-lg-11">
              <span class="headerText">График работы:</span><br/>
              <?php echo $open; ?>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-1">
              <img class="contactsIcon" src="/image/catalog/telephone.png">
            </div>
            <div class="col-lg-11">
              <span class="headerText">Телефоны:</span><br/>
              <?php echo $telephone; ?><br/>
              <?php echo $telephone1; ?><br/>
              <?php echo $telephone2; ?>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-1">
              <img class="contactsIcon" src="/image/catalog/email.png">
            </div>
            <div class="col-lg-11">
              <span class="headerText">Email:</span>
              <?php echo $mail; ?><br/>
              <span class="spanOriginalSpaces"><?php echo $comment; ?></span>
            </div>
          </div>
        </div>
        </div>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
        <hr class="contactHr">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset class="contactsFieldSet">
          <span class="decorPlazaHeaderText">Свяжитесь с нами</span>
            <div class="row">
                <div class="col-sm-4">
                  <span class="colorRed">*</span><span>Имя:</span><br/><br/>
                    <input name="name" value="<?php echo $name; ?>" id="input-name">
                    <div class="text-danger"><?php echo $error_name; ?></div>
                </div>
                <div class="col-sm-4">
                    <span class="colorRed">*</span><span>Телефон:</span><br/><br/>
                    <input name="phone" value="<?php echo $phone; ?>" id="input-phone">
                    <div class="text-danger"><?php echo $error_phone; ?></div>
                </div>
                <div class="col-sm-4">
                    <span>E-mail:</span><br/><br/>
                    <input name="email" value="<?php echo $email; ?>" id="input-email">
                </div>
                </div>
            <div class="row">
                <div class="col-sm-8">
                    <span>Тема сообщения:</span><br/><br/>
                    <input name="enquiry" id="input-enquiry"><br/>
                    <span class="colorRed necessaryFields">*Поля, обязательные для заполнения</span>
                </div>
                <div class="col-sm-4">
                    <span class="colorRed">*</span><span>Код на картинке:</span><br/><br/>
                    <?php echo $captcha?>
                </div>
</div>
            <button class="callBackSend" type="submit" value="<?php echo $button_submit; ?>">
              Отправить
            </button>
        </fieldset>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?callback=initmap&key=AIzaSyC9GPIlyaW6iJ0jwHqcvmc2a2PuS7v-xWo"></script>
<?php echo $footer; ?>
