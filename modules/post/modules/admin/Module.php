<?php

namespace app\modules\post\modules\admin;

class Module extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\post\modules\admin\controllers';
    
    public $theme = 'admin';

    public function init()
    {
        parent::init();
        $this->layoutPath = \Yii::getAlias('@app/themes/admin/views/layouts/');
        $this->layout = 'main';
//        \Yii::$app->view->theme->baseUrl = '@web/themes/admin';
        // custom initialization code goes here
    }
}
