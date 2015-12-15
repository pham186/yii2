<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\widgets;

use yii\base\View;
use yii\base\Widget;
use yii\helpers\StringHelper;
use app\assets\FancyBoxAsset;

class FileManager extends Widget
{
    public $input = 'text';
    
    public $inputId = 'fileinputmanager';

    public $inputClass = '';

    public $cssClass = 'btn btn-default';
    
    public $text = 'Open file manager';
    
    public $model;
    
    public $field;

    public function init() {
        parent::init();
        $view = $this->view;
//        $view->registerAssetBundle('app\assets\FancyBoxAsset');
        FancyBoxAsset::register($view);
        $view->registerJs('
        $(".fancybox").fancybox({
            autoSize : false,
            width : 900,
            height : 600,
            type : \'iframe\',
            autoScale : false
        });', $view::POS_READY);
    }
    
    public function run() {
        $output = '';
        $value = '';
        $name = $this->inputId;
        if($this->input) {
            $class = !empty($this->inputClass)?' class="'.$this->inputClass.'"':'';
            if($this->model && $this->field) {
                $model = $this->model;
                $this->inputId = strtolower(StringHelper::basename($model::className())).'-'.$this->field;
                $modelClass = StringHelper::basename($model::className());
                $name = $modelClass.'['.$$this->field.']';
                $value = $model->{$this->field};
            }
            $output .= '<input'.$class.' id="'.$this->inputId.'" name="'.$name.'" type="'.$this->input.'" value="'.$value.'"/>'; 
        }
        return $output.'<a class="fancybox '.$this->cssClass.'" href="'.\Yii::$app->homeUrl.'widgets/filemanager/dialog.php?type=1&field_id='.$this->inputId.'&relative_url=1">'.$this->text.'</a>';
    }
}

