<?php

namespace app\modules\post\models;

use Yii;

/**
 * This is the model class for table "{{%category}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $alias
 * @property string $description
 * @property integer $left
 * @property integer $right
 * @property integer $level
 */
class Category extends base\CategoryBase
{
    public function getPosts() {
        return $this->hasMany(Post::className(), ['category_id'=>'id']);
    }
}
