<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\modules\post\components;

use yii\base\Behavior;
use yii\db\ActiveRecord;

/**
 * Description of IsAuthorBehavior
 *
 * @author binhpv
 */
class IsAuthorBehavior extends Behavior {
    //put your code here
    public $authorField = 'created_by';
    
    public $userTableClass = 'app\modules\user\models\User';

    public $userIdField = 'id';
    
    public function events()
    {
        return [
            ActiveRecord::EVENT_BEFORE_INSERT => 'beforeSave',
            ActiveRecord::EVENT_BEFORE_UPDATE => 'beforeSave',
        ];
    }
    
    public function beforeSave($event) {
        if(\Yii::$app->getModule('user')) {
            if(\Yii::$app->user->identity) {
                $owner = $this->owner;
                $owner->setAttribute($this->authorField, \Yii::$app->user->getId());
            }
        }
    }
    
    public function getAuthor() {
        $owner = $this->owner;
        $userTable = new $this->userTableClass;
        return $owner->hasOne($userTable::className(), [$this->userIdField => $this->authorField]);
    }
}
