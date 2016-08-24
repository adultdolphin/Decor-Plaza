  <?php if (substr($route, 0, 9) == 'checkout/') { ?>
  <label class="control-label" for="input-payment-captcha"><?php echo $entry_captcha; ?></label>
  <input type="text" name="captcha" id="input-payment-captcha" class="form-control" />
  <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
 <?php } else { ?>
  <div class="captchaDiv">
    <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
    <input type="text" name="captcha" id="input-captcha"/>
    <?php if ($error_captcha) { ?>
    <div class="text-danger"><?php echo $error_captcha; ?></div>
    <?php } ?>
  <?php } ?>
      </div>