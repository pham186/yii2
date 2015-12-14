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

class TinyMCEAsset extends AssetBundle {
    //put your code here
    public $sourcePath = '@app/widgets/tinymce/js'; 
    public $css = [];
    public $js = [ 
        'tinymce.min.js',
    ];
    public $depends = [
        'app\assets\AppAsset',
    ];
}
