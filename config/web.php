<?php

$params = require(__DIR__ . '/params.php');

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => require(__DIR__ . '/modules.php'),
    'language' => 'vi-VN',
    'sourceLanguage' => 'en-US',
    'aliases' => [
        '@widgets' => '@app/widgets',
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'cmV0dXJuIENvbXBvc2VyQXV0b2xvYWRlckluaXRiNjdmNGNjYzQ5MmJkZDU5YWZiY2MxYmExZDFkZjNmMDo6Z2V0TG9hZGVyKCk7',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        'view' => [
            'theme' => [
                'pathMap' => ['@app/views' => '@app/themes/admin'],
                'baseUrl' => '@web/themes/admin',
            ],
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
            'cachePath' => 'cache',
            'cacheFileSuffix' => '.cache',
            'directoryLevel'=>0
        ],
        'loginCache' => [
            'class' => 'yii\caching\FileCache',
            'cachePath' => '@runtime/cache',
            'cacheFileSuffix' => '.bin',
            'directoryLevel'=>0
        ],
        'session' => [
            'class' => 'yii\web\CacheSession',
            'cache' => 'loginCache'
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
            'enableSession' => true
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'baseUrl' => '/yii2/',
            'enablePrettyUrl' => true,
//            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => require_once (__DIR__ . '/routes.php')
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => require(__DIR__ . '/db.php'),
        'db2' => require(__DIR__ . '/db2.php'),
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
}

return $config;
