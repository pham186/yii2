<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use yii\widgets\Menu;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <link rel='shortcut icon' href='<?=  Yii::$app->getHomeUrl() ?>favicon.ico' />
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <?php $this->registerCssFile($this->theme->baseUrl.'/css/new.css'); ?>
    <?php $this->registerCssFile($this->theme->baseUrl.'/css/charts-graphs.css'); ?>
    <?php $this->registerCssFile($this->theme->baseUrl.'/fonts/font-awesome.min.css'); ?>
</head>
<body>
<?php $this->beginBody() ?>
<!-- Header Start -->
    <header>
      <a href="index.html" class="logo">
        <img src="<?php echo $this->theme->baseUrl; ?>/img/logo.png" alt="Logo"/>
      </a>
      <div class="pull-right">
        <ul id="mini-nav" class="clearfix">
          <li class="list-box user-profile">
            <a id="drop7" href="#" role="button" class="dropdown-toggle user-avtar" data-toggle="dropdown">
              <img src="<?php echo $this->theme->baseUrl; ?>/img/user5.png" alt="Bluemoon User">
            </a>
            <ul class="dropdown-menu server-activity">
              <li>
                <p><i class="fa fa-cog text-info"></i> Account Settings</p>
              </li>
              <li>
                <p><i class="fa fa-fire text-warning"></i> Payment Details</p>
              </li>
              <li>
                <div class="demo-btn-group clearfix">
                  <a href="#" data-original-title="" title="">
                    <i class="fa fa-facebook fa-lg icon-rounded info-bg"></i>
                  </a>
                  <a href="#" data-original-title="" title="">
                    <i class="fa fa-twitter fa-lg icon-rounded twitter-bg"></i>
                  </a>
                  <a href="#" data-original-title="" title="">
                    <i class="fa fa-linkedin fa-lg icon-rounded linkedin-bg"></i>
                  </a>
                  <a href="#" data-original-title="" title="">
                    <i class="fa fa-pinterest fa-lg icon-rounded danger-bg"></i>
                  </a>
                  <a href="#" data-original-title="" title="">
                    <i class="fa fa-google-plus fa-lg icon-rounded success-bg"></i>
                  </a>
                </div>
              </li>
              <li>
                <div class="demo-btn-group clearfix">
                  <button href="#" class="btn btn-danger">
                    Logout
                  </button>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </header>
    <!-- Header End -->
    
    <!-- Main Container start -->
    <div class="dashboard-container">
        <div class="dashboard-content">
      
        <!-- Top Nav Start -->
        <div id='cssmenu'>
            <?php
                echo Menu::widget([
                    'options' => ['class' => 'aui-nav'],
                    'activeCssClass'=>'active',
                    'encodeLabels'=>false,
                    'items' => [
                        ['label' => '<i class="fa fa-dashboard"></i>Dashboards', 'url' => ['/site/index']],
                        ['label' => '<i class="fa fa-align-justify"></i>Trang', 'url' => ['#'], 'items'=>[
                            ['label' => 'Giới thiệu', 'url' => ['#']],
                            ['label' => 'Liên hệ', 'url' => ['#']],
                        ]],
                        ['label' => '<i class="fa fa-bar-chart-o"></i>Bài viết', 'url' => ['/admin/post'], 'items'=>[
                            ['label' => 'Quản lý bài viết', 'url' => ['/admin/post']],
                            ['label' => 'Quản lý danh mục', 'url' => ['/admin/category']],
                            ['label' => 'Quản lý Tags', 'url' => ['#']],
                        ]],
                        ['label' => '<i class="fa fa-calendar"></i>Lịch học', 'url' => ['/site/contact'], 'items'=>[
                            ['label' => 'Lớp học', 'url' => ['#']],
                            ['label' => 'Lịch học', 'url' => ['#']],
                        ]],
                        ['label' => '<i class="fa fa-user-md"></i>Người dùng', 'url' => ['/site/contact'], 'items'=>[
                            ['label' => 'Danh sách người dùng', 'url' => ['#']],
                            ['label' => 'Nhóm người dùng', 'url' => ['#']],
                            ['label' => 'Quản lý quyền', 'url' => ['#'], 'visible'=>Yii::$app->user->can('admin.user.rule')],
                        ]],
                        ['label' => '<i class="fa fa-dashboard"></i>Giao diện', 'url' => ['/site/contact'], 'items'=>[
                            ['label' => 'Quản lý module', 'url' => ['#']],
                            ['label' => 'Quản lý menu', 'url' => ['#']],
                        ]],
                        ['label' => '<i class="fa fa-cogs"></i>Cấu hình', 'url' => ['/site/contact'], 'items'=>[
                            ['label' => 'Cấu hình chung', 'url' => ['#']],
                            ['label' => 'Cấu hình email', 'url' => ['#']],
                        ]],
                        Yii::$app->user->isGuest ?
                            ['label' => 'Login', 'url' => ['/site/login']] :
                            [
                                'label' => '<i class="fa fa-sign-out"></i>Logout (' . Yii::$app->user->identity->username . ')',
                                'url' => ['/site/logout'],
                                'linkOptions' => ['data-method' => 'post']
                            ],
                    ],
                ]);
            ?>
        </div>
        <!-- Top Nav End -->
        
        
        <!-- Sub Nav Start -->
        <div class="sub-nav hidden-sm hidden-xs">
            <?php if(!empty($this->params['menuAction'])) { ?>
            <?php
                echo Menu::widget([
                    //'itemCssClass'=>'aui-button',
                    'items'=>$this->params['menuAction'],
                    'encodeLabels'=>false,
                    'options'=>array('class'=>'aui-buttons'),
                ]);
            ?>
            <?php } ?>
            <div class="custom-search hidden-sm hidden-xs">
                <?php if(!empty($this->params['_modelSearch'])) echo $this->params['_modelSearch']; ?>
            </div>
        </div>
        <!-- Sub Nav End -->
        <div class="dashboard-main-content">
            <div class="container">
                <!-- Dashboard Wrapper Start -->
                <div class="dashboard-wrapper-lg">
                    <?php
                    foreach (Yii::$app->session->getAllFlashes() as $key => $message) {
                        echo '<div class="alert alert-block alert-'.$key.' fade in">
                            <button data-dismiss="alert" class="close" type="button">
                                ×
                            </button>
                            <p>
                                <i class="fa fa-check-circle fa-lg"></i> ' . $message . '
                            </p>
                        </div>';
                    } ?>
                    <?= Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    ]) ?>
                    <?php echo $content; ?>
                </div>
                <!-- Dashboard Wrapper End -->
            </div>
        </div>
        <footer>
          <p>© BlueMoon 2013-15</p>
        </footer>
      </div>
    </div>
    <!-- Main Container end -->

<?php $this->endBody() ?>
<?php
$this->registerJsFile($this->theme->baseUrl.'/js/jquery.scrollUp.js');
$this->registerJsFile($this->theme->baseUrl.'/js/jquery-ui-v1.10.3.js');
$this->registerJsFile($this->theme->baseUrl.'/js/menu.js');
$this->registerJsFile($this->theme->baseUrl.'/js/custom-index2.js');

$this->registerJs('
var html = \'<div id ="loadding" style="display:none; z-index: 99999;"><img src="'.Yii::$app->homeUrl.'themes/admin/images/loadding.gif"></div>\';
$("body").append(html);
$(document).ajaxStart(function(data) {
    $("#loadding").css("display", "block");
});

$(document).ajaxStop(function(data) {
    $("#loadding").css("display", "none");
});

$.scrollUp({
    scrollName: \'scrollUp\', // Element ID
    topDistance: \'300\', // Distance from top before showing element (px)
    topSpeed: 300, // Speed back to top (ms)
    animation: \'fade\', // Fade, slide, none
    animationInSpeed: 400, // Animation in speed (ms)
    animationOutSpeed: 400, // Animation out speed (ms)
    scrollText: \'Top\', // Text for element
    activeOverlay: false, // Set CSS color to display scrollUp active point, e.g \'#00FFFF\'
});
'); ?>
</body>
</html>
<?php $this->endPage() ?>