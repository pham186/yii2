<?php

namespace app\modules\user\models\base;

use Yii;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $role_name
 * @property string $email
 * @property string $full_name
 * @property integer $gender
 * @property integer $phone
 * @property string $auth_key
 * @property string $password_reset_token
 * @property string $access_token
 * @property string $created_date
 * @property string $updated_date
 */
class UserBase extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'role_name', 'email', 'full_name'], 'required'],
            [['gender', 'phone'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['username', 'password', 'role_name', 'email', 'full_name'], 'string', 'max' => 255],
            [['auth_key', 'password_reset_token', 'access_token'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'password' => 'Password',
            'role_name' => 'Role Name',
            'email' => 'Email',
            'full_name' => 'Full Name',
            'gender' => 'Gender',
            'phone' => 'Phone',
            'auth_key' => 'Auth Key',
            'password_reset_token' => 'Password Reset Token',
            'access_token' => 'Access Token',
            'created_date' => 'Created Date',
            'updated_date' => 'Updated Date',
        ];
    }
}
