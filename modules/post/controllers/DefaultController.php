<?php

namespace app\modules\post\controllers;

use yii\authclient\OAuth2;
use yii\web\Controller;

class DefaultController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}
