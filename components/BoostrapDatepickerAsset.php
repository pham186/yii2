<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\components;

/**
 * Description of BoostrapDatepickerAsset
 *
 * @author binhpv
 */
use yii\web\AssetBundle;

class BoostrapDatepickerAsset extends AssetBundle {
    //put your code here
    public $sourcePath = '@vendor/eonasdan/bootstrap-datetimepicker/build'; 
    public $css = [ 
        'css/bootstrap-datetimepicker.css', 
    ];
    public $js = [ 
        'js/bootstrap-datetimepicker.min.js',
    ];
}
