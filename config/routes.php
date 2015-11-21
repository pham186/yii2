<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$modules = require(__DIR__ . '/modules.php');
$route = [
        [
            'class' => 'yii\rest\UrlRule',
            'controller' => 'post/api',   // our country api rule,
        ]
    ];
foreach ($modules as $m=>$param) {
    $path = realpath(dirname(__FILE__)).'/../modules/'.$m.'/routes.php';
    if(file_exists($path)) {
        $mRouter = require($path);
        $route = yii\helpers\ArrayHelper::merge($route, $mRouter);
    }
}

return $route;