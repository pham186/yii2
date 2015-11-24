<?php

namespace app\modules\user;

class Module extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\user\controllers';
    
    public $defaultRoute = 'user';

    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
