<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\widgets;

use Yii;
//use yii\base\View;
use yii\base\Widget;
use yii\helpers\Html;
use yii\helpers\StringHelper;
use app\assets\FancyBoxAsset;

class FileManager extends Widget
{
    public $inputType = 'text';
    
    public $inputId;

    public $inputClass = 'form-control';

    public $cssClass = 'btn btn-default';
    
    public $buttonText = 'Open file manager';
    
    public $htmlOptions = [];
    
    public $model;
    
    protected $modelClass;

    public $attribute;
    
    public $label;
    
    public $preview = true;
    
    public $previewID = "preview";

    public function init() {
        parent::init();
        $view = $this->view;
//        $view->registerAssetBundle('app\assets\FancyBoxAsset');
//        if($this->model && $this->attribute) {
//            $model = $this->model;
//            $this->modelClass = StringHelper::basename($model::className());
//            $this->inputId = strtolower($this->modelClass).'-'.$this->attribute;
//        }
        
//        if(empty($this->label) && $this->attribute) {
//            $this->label = $model->getAttributeLabel($this->attribute);
//        }
        FancyBoxAsset::register($view);
        $this->htmlOptions['class'] = 'form-control';
        $view->registerJs('
        $(".fancybox").fancybox({
            autoSize : false,
            width : 900,
            height : 600,
            type : \'iframe\',
            autoScale : false,
            helpers: {
                overlay: {
                    locked: false
                }
            }
        });', $view::POS_READY);
        if($this->preview) {
            $view->registerJs('
            function responsive_filemanager_callback(attribute_id){
                console.log(attribute_id);
                var url=jQuery(\'#\'+attribute_id).val();
                if(jQuery(\'#'.$this->previewID.'_\'+attribute_id).length == 0) {
                    jQuery(\'#\'+attribute_id).after(\'<div id="'.$this->previewID.'_\'+attribute_id+\'"></div>\');
                }
                jQuery(\'#'.$this->previewID.'_\'+attribute_id).html(\'<img src="'.\Yii::$app->homeUrl.'resources/thumbs/\'+url+\'">\');
            }', $view::POS_HEAD);
        }
    }
    
    public function run() {
//        $output = '';
//        $value = '';
//        $name = $this->inputId;
//        if($this->inputId) {
//            $class = !empty($this->inputClass)?' class="'.$this->inputClass.'"':'';
//            if($this->model && $this->attribute) {
//                $name = $this->modelClass.'['.$this->attribute.']';
//                $value = $this->model->{$this->attribute};
//            }
////            if($this->inputType != 'hidden') {
////                $output .= '<label class="control-label" for="'.strtolower($this->modelClass).'-'.$this->attribute.'">'.$this->label.'</label>';
////            }
//            if($this->inputId) {
//                $output .= '<input'.$class.' id="'.$this->inputId.'" name="'.$name.'" type="'.$this->inputType.'" value="'.$value.'"/>';
//            }
//        }
        if($this->model && $this->attribute) {
            return Html::activeTextInput($this->model, $this->attribute, $this->htmlOptions).'<a class="fancybox '.$this->cssClass.'" href="'.Yii::$app->homeUrl.'widgets/filemanager/dialog.php?type=1&field_id='.Html::getInputId($this->model, $this->attribute).'&relative_url=1" onclick="return false;">'.$this->buttonText.'</a>';
        } else {
            return '<a class="fancybox '.$this->cssClass.'" href="'.Yii::$app->homeUrl.'widgets/filemanager/dialog.php?type=1'.($this->inputId?'&field_id='.$this->inputId:'').'&relative_url=1">'.$this->buttonText.'</a>';
        }
    }
}

