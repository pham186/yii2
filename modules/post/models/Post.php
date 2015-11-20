<?php

namespace app\modules\post\models;

use Yii;

class Post extends base\PostBase
{
    
    public static function getDb()
    {
        // use the "db2" application component
        return \Yii::$app->db2;  
    }
}