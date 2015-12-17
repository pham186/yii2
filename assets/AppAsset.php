<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'resources/sweetalert/sweetalert.css',
//        'resources/sweetalert/sweet-alert.css'
    ];
    public $js = [
        'resources/sweetalert/sweetalert.min.js',
        'resources/js/main.js'
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\web\YiiAsset',
        'app\assets\MomentAsset',
        'app\assets\BoostrapDatepickerAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
