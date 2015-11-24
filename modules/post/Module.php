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
    }
}
