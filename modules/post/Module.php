<?php

namespace app\modules\post;

class Module extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\post\modules\front\controllers';
    
    public $defaultRoute = 'front/default';

    public function init()
    {
        parent::init();
        // custom initialization code goes here
        \Yii::configure($this, require(__DIR__.'/config/config.php'));
        
        $this->modules = [
            'front' => [
                'class' => 'app\modules\post\modules\front\Module',
            ],
            'admin' => [
                'class' => 'app\modules\post\modules\admin\Module',
            ],
        ];
        
        $this->registerTranslations();
    }
    
    public function registerTranslations() {
        \Yii::$app->i18n->translations['modules/post/*'] = [
            'class' => 'yii\i18n\PhpMessageSource',
            'sourceLanguage' => 'vi',
            'basePath' => '@app/modules/post/messages',
            'fileMap' => [
                'modules/post/general' => 'general.php',
            ]
        ];
    }
    
     public static function t($category, $message, $params = [], $language = null)
    {
        return \Yii::t('modules/post/' . $category, $message, $params, $language);
    }
}
