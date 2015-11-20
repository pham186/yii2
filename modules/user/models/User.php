<?php

namespace app\modules\user\models;

use Yii;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $auth_key
 * @property string $password_reset_token
 * @property string $access_token
 */
class User extends base\UserBase
{
    /**
     * @inheritdoc
     */
}
