<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\widgets\tinymce;

use Yii;
use yii\base\Widget;
use yii\helpers\StringHelper;
use yii\web\NotAcceptableHttpException;
use yii\web\View;
use app\assets\TinyMCEAsset;

class TinyMCE extends Widget
{
    public $model;
    
    public $attribute;
    
    public $htmlOptions = '';

    public $mode = 'basic';
    
    public $options = [];
    
    protected $_options = [
        //Integration and Setup
        'auto_focus'=>'',
        'cache_suffix'=>'',
        'content_security_policy'=>'',
        'external_plugins'=>array(),
        'hidden_input'=>'',
        'init_instance_callback '=>'',
        'plugins'=>'',
        'selector'=>'',
        'setup'=>'',
        //Editor Appearance
        'color_picker_callback'=>'',
        'elementpath'=>'',
        'event_root'=>'',
        'fixed_toolbar_container'=>'',
        'height'=>'',
        'inline'=>'',
        'max_height'=>'',
        'max_width'=>'',
        'menu'=>'',
        'menubar'=>'',
        'min_height'=>'',
        'min_width'=>'',
        'preview_styles'=>'',
        'removed_menuitems'=>'',
        'resize'=>'',
        'skin_url'=>'',
        'skin'=>'',
        'statusbar'=>'',
        'theme_url'=>'',
        'theme'=>'modern',
        'templates' => '',
        'toolbar'=>'',
        'width'=>'',
        //Content Appearance
        'body_class'=>'',
        'body_id'=>'',
        'content_css '=>'',
        'content_style'=>'',
        'visual_anchor_class'=>'',
        'visual_table_class'=>'',
        'visual'=>'',
        //Content Filtering
        'allow_conditional_comments'=>'',
        'allow_html_in_named_anchor'=>'',
        'convert_fonts_to_spans'=>'',
        'custom_elements'=>'',
        'element_format'=>'',
        'encoding'=>'',
        'entities'=>'',
        'entity_encoding'=>'',
        'extended_valid_elements'=>'',
        'fix_list_elements'=>'',
        'force_hex_style_colors'=>'',
        'force_p_newlines'=>'',
        'forced_root_block'=>'',
        'forced_root_block_attrs'=>'',
        'invalid_elements'=>'',
        'invalid_styles'=>'',
        'keep_styles'=>'',
        'protect'=>'',
        'remove_trailing_brs'=>'',
        'schema'=>'',
        'valid_children'=>'',
        'valid_styles'=>'',
        'valid_elements'=>'',
        'valid_styles'=>'',
        //Content formatting
        'block_formats'=>'',
        'font_formats'=>'',
        'fontsize_formats'=>'',
        'formats'=>'',
        'removeformat'=>'',
        'indentation'=>'',
        'style_formats'=>'',
        'style_formats_merge'=>'',
        'browser_spellcheck'=>'',
        'gecko_spellcheck'=>'',
        //File & Image Upload
        'automatic_uploads'=>'',
        'file_browser_callback'=>'',
        'file_browser_callback_types'=>'',
        'file_picker_callback'=>'',
        'file_picker_types'=>'',
        'images_dataimg_filter'=>'',
        'images_upload_base_path'=>'',
        'images_upload_credentials'=>'',
        'images_upload_handler'=>'',
        'images_upload_url'=>'',
        'image_advtab' => '',
        //Localization
        'directionality'=>'',
        'language'=>'vi',
        'language_url'=>'',
        //URL Handling
        'document_base_url'=>'',
        'allow_script_urls'=>'',
        'convert_urls'=>'',
        'relative_urls'=>'true',
        'remove_script_host'=>'',
        'urlconverter_callback'=>'',
        //Advanced Editing Behaviors
        'br_in_pre'=>'',
        'custom_undo_redo_levels'=>'',
        'end_container_on_empty_block'=>'',
        'nowrap'=>'',
        'object_resizing'=>'',
        'readonly' => false
    ];

    public function init() {
        parent::init();
        
        if(empty($this->model)) {
            throw new NotAcceptableHttpException('The editor\' model not set');
        }
        
        if(empty($this->attribute)) {
            throw new NotAcceptableHttpException('The editor\'s attribute not set');
        }
        
//        $this->view->registerJsFile('https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js', ['position'=>View::POS_HEAD]);
//        $this->view->registerJsFile('https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js', ['position'=>View::POS_HEAD]);
        TinyMCEAsset::register($this->view);
        
        //$this->_options = array_merge($this->_options, $this->options);
        
        $model = $this->model;
        $modelClass = StringHelper::basename($model::className());
        if(!isset($this->options['selector'])) {
            $this->options['selector'] = '#tinymce_'.$modelClass.'_'.$this->attribute;
            $this->htmlOptions['id'] = 'tinymce_'.$modelClass.'_'.$this->attribute;
        }
        
        if(!isset($this->options['plugins'])) {
            if($this->mode == 'basic') {
                $this->options['plugins'] = ['advlist autolink lists link image charmap print preview', 'anchor searchreplace visualblocks code fullscreen insertdatetime media table contextmenu paste code responsivefilemanager'];
            }
            if($this->mode == 'advanced') {
                $this->options['plugins'] = 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor colorpicker textpattern imagetools responsivefilemanager ';
            }
        }
        
        if(!isset($this->options['toolbar'])) {
            if($this->mode == 'basic') {
                $this->options['toolbar'] = 'insertfile undo redo | styleselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image responsivefilemanager';
            }
            if($this->mode == 'advanced') {
                $this->options['toolbar'] = [
                    'insertfile undo redo | styleselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent',
                    'link image responsivefilemanager | print preview media | forecolor backcolor'
                ];
            }
        }
        
        if(!isset($this->options['language'])) {
            $this->options['language'] = 'vi';
        }
        
        if(!isset($this->options['image_advtab'])) {
            $this->options['image_advtab'] = 'true';
        }
        
        if(!isset($this->options['document_base_url'])) {
            $this->options['document_base_url'] = Yii::$app->homeUrl;
        }
        if(!isset($this->options['relative_urls'])) {
            $this->options['relative_urls'] = true;
        }
        $this->options['external_filemanager_path'] = Yii::$app->homeUrl.'widgets/filemanager/';
        $this->options['filemanager_title'] = 'Responsive Filemanager';
        $this->options['external_plugins']['filemanager'] = Yii::$app->homeUrl.'widgets/filemanager/plugin.min.js';
        
        $tinyinit = '';
        foreach ($this->options as $key=>$opt) {
            if(is_array($opt)) {
                if(!empty($opt)) {
                    if($key == 'toolbar') {
                        $i = 1;
                        foreach ($opt as $toolbar) {
                            $tinyinit .= "\t".'toolbar'.$i.': \''.$toolbar."',\n";
                            $i++;
                        }
                    } else {
                        $count = count($opt);
                        $tempopt = '';
                        
                        foreach ($opt as $k=>$v) {
                            if($count > 1) {
                                if(is_array($v)) {
                                    $tempopt .= "\n\t\t{";
                                    foreach ($v as $k1=>$v1) {
                                        $tempopt .= $k1.': "'.$v1."\",";
                                    }
                                    $tempopt = trim($tempopt, ',').'},';
                                } else {
                                    $tempopt .= "\n\t\t".'\''.$v.'\',';
                                }
                            } else {
                                $tempopt = '{"'.$k.'": "'.$v."\"}";
                            }
                        }
                        
                        if($count > 1) {
                            $tempopt = "[".trim($tempopt, ',')."\n\t]";
                        }
                        $tinyinit .= "\n\t".$key .': '. $tempopt.",";
                    }
                }
            } else {
                if($opt !== '') {
                    $tinyinit .= "\n\t".$key.': \''.$opt.'\',';
                }
            }
        }
        
        $this->view->registerJs('tinymce.init({'.trim($tinyinit, ',')."\n});");
    }
    
    public function run() {
        return $this->render('tinymce',[
            'model'=>$this->model,
            'attribute'=>$this->attribute,
            'htmlOptions'=>$this->htmlOptions,
        ]);
    }
}