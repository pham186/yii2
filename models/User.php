<?php

namespace app\models;

use Yii;
use yii\base\Security;

class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        $cache = Yii::$app->getCache();
        $cache->keyPrefix = 'login-';
        $login = $cache->get('login-'.$id);
        if($login === false) {
            $login = static::findOne($id);
            $cache->set('login-'.$id, $login);
        }
        return $login;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['access_token' => $token]);
    }

    /**
     * Finds user by username
     *
     * @param  string      $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username]);
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->auth_key === $authKey;
    }
    
    public function setPasswordSalt() {
        $this->password_salt = (new Security)->generateRandomString();
    }
    
    public function getPasswordSalt() {
        if(empty($this->password_salt)) {
            $this->password_salt = (new Security)->generateRandomString();
        }
        return $this->password_salt;
    }
    
    public function setPassword($password) {
        $this->password = (new Security)->generatePasswordHash(md5($password));
    }

    /**
     * Validates password
     *
     * @param  string  $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return (new Security)->validatePassword(md5($password), $this->password);
    }
    
    
    /**
    * Generates "remember me" authentication key
    */
    public function generateAuthKey()
    {
        $this->auth_key = (new Security)->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = (new Security)->generateRandomKey() . '_' . time();
    }
    
    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }
}
