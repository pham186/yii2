<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\assets;

/**
 * Description of BoostrapDatepickerAsset
 *
 * @author binhpv
 */
use yii\web\AssetBundle;
use yii\web\View;

class FancyBoxAsset extends AssetBundle {
    //put your code here
    public $sourcePath = '@app/resources/fancybox'; 
    public $css = [
        'jquery.fancybox.css',
        'helpers/jquery.fancybox-buttons.css',
        'helpers/jquery.fancybox-thumbs.css?v=1.0.7'
    ];
    public $js = [
        'jquery.fancybox.js',
        'jquery.fancybox.pack.js?v=2.1.5',
        'helpers/jquery.fancybox-thumbs.js?v=1.0.7'
    ];
    public $depends = [
        'app\assets\AppAsset',
    ];
//    public $jsOptions = ['position' => View::POS_HEAD];
}
