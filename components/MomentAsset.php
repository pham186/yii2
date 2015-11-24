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

class MomentAsset extends AssetBundle {
    //put your code here
    public $sourcePath = '@vendor/moment/moment/min'; 
    public $js = [ 
        'moment-with-locales.js',
    ];
}
