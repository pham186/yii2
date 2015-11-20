<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
        'post' => [
            'class' => 'app\modules\post\Module',
            'modules' => [
                'front' => [
                    'class' => 'app\modules\post\modules\front\Module',
                ],
                'admin' => [
                    'class' => 'app\modules\post\modules\admin\Module',
                ],
            ],
        ],
        'user' => [
            'class' => 'app\modules\user\Module',
        ],
    ];