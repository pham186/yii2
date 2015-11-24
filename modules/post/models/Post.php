<?php

namespace app\modules\post\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use app\modules\post\components\IsAuthorBehavior;

class Post extends base\PostBase
{
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_date', 'updated_date'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_date'],
                ],
                // if you're using datetime instead of UNIX timestamp:
                // 'value' => new Expression('NOW()'),
            ],
            [
                'class' => IsAuthorBehavior::className(),
                'authorField' => 'created_by',
            ],
        ];
    }
    
    public function getCategory() {
        return $this->hasOne(Category::className(), ['id'=>'category_id']);
    }
}