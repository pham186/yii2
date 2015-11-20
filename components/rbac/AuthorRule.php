<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\components\rbac;

use yii\rbac\Rule;

/**
 * Description of AuthorRule
 *
 * @author binhpv
 */
class AuthorRule extends Rule
{
    public $name = 'isAuthor';
    
    public function execute($user, $item, $params) {
        return isset($params['post']) ? $params['post']->createdBy == $user : false;
    }
}