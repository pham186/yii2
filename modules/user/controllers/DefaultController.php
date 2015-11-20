<?php

namespace app\modules\user\controllers;

use yii\web\Controller;
use app\models\User;

class DefaultController extends Controller
{
    public function actionIndex()
    {
//        $hash = \Yii::$app->getSecurity()->generatePasswordHash(md5('123456') );
//        echo $hash;die();
        $user = new User();
        $user->setPassword('123456');
        var_dump($user);die();
        echo $user->password;die();
//        echo $user->validatePassword('123456');
        return $this->render('index', ['hash'=>$hash]);
    }
}
