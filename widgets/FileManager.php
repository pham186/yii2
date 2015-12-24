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
    public $inputType = 'text';
    
    public $inputId;

    public $inputClass = 'form-control';

    public $cssClass = 'btn btn-default';
    
    public $buttonText = 'Open file manager';
    
    public $model;
    
    protected $modelClass;

    public $field;
    
    public $label;
    
    public $preview = true;
    
    public $previewID = "preview";

    public function init() {
        parent::init();
        $view = $this->view;
//        $view->registerAssetBundle('app\assets\FancyBoxAsset');
        if($this->model && $this->field) {
            $model = $this->model;
            $this->modelClass = StringHelper::basename($model::className());
            $this->inputId = strtolower($this->modelClass).'-'.$this->field;
        }
        
        if(empty($this->label) && $this->field) {
            $this->label = $model->getAttributeLabel($this->field);
        }
        FancyBoxAsset::register($view);
        $view->registerJs('
        $(".fancybox").fancybox({
            autoSize : false,
            width : 900,
            height : 600,
            type : \'iframe\',
            autoScale : false
        });', $view::POS_READY);
        if($this->preview) {
            $view->registerJs('
            function responsive_filemanager_callback(field_id){
                console.log(field_id);
                var url=jQuery(\'#\'+field_id).val();
                if(jQuery(\'#'.$this->previewID.'\').length == 0) {
                    jQuery(\'#\'+field_id).after(\'<div id="'.$this->previewID.'"></div>\');
                }
                jQuery(\'#'.$this->previewID.'\').html(\'<img src="'.\Yii::$app->homeUrl.'resources/uploads/\'+url+\'">\');
            }', $view::POS_HEAD);
        }
    }
    
    public function run() {
        $output = '';
        $value = '';
        $name = $this->inputId;
        if($this->inputId) {
            $class = !empty($this->inputClass)?' class="'.$this->inputClass.'"':'';
            if($this->model && $this->field) {
                $name = $this->modelClass.'['.$this->field.']';
                $value = $this->model->{$this->field};
            }
            if($this->inputType != 'hidden') {
                $output .= '<label class="control-label" for="'.strtolower($this->modelClass).'-'.$this->field.'">'.$this->label.'</label>';
            }
            if($this->inputId) {
                $output .= '<input'.$class.' id="'.$this->inputId.'" name="'.$name.'" type="'.$this->inputType.'" value="'.$value.'"/>';
            }
        }
        return $output.'<a class="fancybox '.$this->cssClass.'" href="'.\Yii::$app->homeUrl.'widgets/filemanager/dialog.php?type=1'.($this->inputId?'&field_id='.$this->inputId:'').'&relative_url=1">'.$this->buttonText.'</a>';
    }
}

