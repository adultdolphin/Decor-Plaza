<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<link href="catalog/view/javascript/jquery/formstyler/jquery.formstyler.css" rel="stylesheet" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/formstyler/jquery.formstyler.min.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<nav id="top">
  <div class="container-fluid">
    <div id="top-links" class="nav">
	<div class="navbar-header">
	<div class="inlineDiv">
	<ul class="list-inline">
		      <li class="smallScreenOnly"><a href="<?php echo $login; ?>"><span class="glyphicon glyphicon-log-in"></span></a></li>
			  <li class="smallScreenOnly"><a href="<?php echo $login; ?>"><span class="glyphicon glyphicon-user"></span></a></li>
			  <li class="smallScreenOnly"><a href="<?php echo $login; ?>"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
			  <li class="smallScreenOnly"><button type="button" class="btn btn-navbar navbar-toggle topCollapseButton" data-toggle="collapse" data-target=".navbar-top-collapse"><i class="fa fa-bars"></i></button></li>
	</ul>
	</div>
    </div>
	<div class="collapse navbar-collapse navbar-top-collapse">
      <ul class="list-inline navbarLinks">
	    <li class="firstLinkGroup"><a href="<?php echo $home; ?>">Главная</a></li>
        <li class="firstLinkGroup"><a href="<?php echo $aboutUs; ?>">О нас</a></li>
		<li class="firstLinkGroup"><a href="<?php echo $delivery; ?>">Доставка и оплата</a></li>
          <li class="navigationLink"><a href="/" onclick="event.preventDefault(); changeHeaderButtons();"></a></li>
		<li class="secondLinkGroup"><a href="<?php echo $warrantiesCertifications; ?>">Гарантии и сертификаты</a></li>
		<li class="secondLinkGroup"><a href="<?php echo $home; ?>">Новости</a></li>
		<li class="secondLinkGroup"><a href="<?php echo $contact; ?>">Контакты</a></li>
          <div class="spacerHelper"></div>
		<li>
		<div class="loginUserBasket">
		      <a href="<?php echo $login; ?>" class="icon enterIcon"></a>
			  <a href="<?php echo $register; ?>" class="icon accountIcon"></a>
			  <a href="/" class="icon cartIcon"><?php if($productsNumber) echo'<span class="cartSpan">', $productsNumber, '</span>';?></a>
        </div>
		</li>
		<li class="emptyHelper">
		</li>
	  </ul>
	  </div>
    </div>
  </div>
</nav>
<header id="decorPlazaHeader">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-1">
        <img src="/image/catalog/call.png" id="callIcon">
      </div>
      <div class="col-sm-2">
          <a href="tel:84993977912" class="headerBigText headerText telephoneNumber" id="firstNumber">8(499)397-79-12</a><br/>
          <a href="tel:89253977912" class="headerText telephoneNumber" id="secondNumber">8(925)397-79-13</a><br/>
          <a href="tel:89253977914" class="headerText telephoneNumber" id="thirdNumber">8(925)397-79-14</a>
      </div>
      <div class="col-sm-1">
          <img src="/image/catalog/callBack.png">
          </div>
        <div class="col-sm-2">
            <a href="/" onclick="callBack(event);" class="headerBigText">Обратный звонок</a><br/>
            <input type="tel" id="callBackInput" class="callBackStuff"/><button id="callBackButton" class="callBackStuff" onmousedown="callBackSend();"><span class="callBackStuff glyphicon glyphicon-phone-alt"></span></button>
            <span class="headerText">Режим работы:</span><br/>
            <span class="headerText">Пн-Птн с 10 до 19</span><br/>
        </div>
        <div class="col-sm-1">
            <img src="/image/catalog/location.png">
        </div>
        <div class="col-sm-2">
            <a href="<?php echo $contact; ?>">
            <span class="headerBigText">Наш адрес:</span><br/>
            <span class="headerText">г.Москва, м."Новокосино,"</span><br/>
            <span class="headerText">Носовихинское шоссе вл., 4.</span><br/>
            <span class="headerText">ТЦ "Никольский Парк"</span><br/>
                </a>
        </div>
        </div>
      <div class="row">
          <div class="col-sm-4">
              <div class="panel panel-default">
                  <a data-toggle="collapse" href="#catalogCollapse">
                    <div class="panel-heading">
                        Каталог товаров
                    </div>
                  </a>
                  <div id="catalogCollapse" class="panel-collapse collapse headerCollapse">
                      <ul class="list-group">
                          <li class="list-group-item">Каталоги обоев<span id="1"/></li>
                          <li class="list-group-item">Лучшие фрески от фабрики affresco<span id="2"/></li>
                          <li class="list-group-item">Напольные покрытия<span id="3"/></li>
                      </ul>
                      </div>
              </div>
          </div>
          <div class="col-sm-4">
              <div class="panel panel-default">
                  <a href="<?php echo $manufacturer; ?>">
                  <div class="panel-heading">
                      Производители
                  </div>
                      </a>
              </div>
          </div>
          <div class="col-sm-4">
              <div class="panel panel-default">
                  <a href="<?php echo $special; ?>">
                  <div class="panel-heading">
                      Акции и скидки
                  </div>
                      </a>
              </div>
          </div>
      </div>
  </div>
    <div class="container-fluid">
    <div id="search" name="search" class="container-fluid">
        <?php echo $search; ?>
    </div>
        </div>
</header>

