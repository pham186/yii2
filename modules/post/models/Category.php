<?php

namespace app\modules\post\models;

use Yii;
use app\behaviors\NestedSetsBehavior1;
use yii\helpers\ArrayHelper;

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
//    public $parent;
    
    public function attributes()
    {
        return array_merge(
            parent::attributes(),
            ['parent']
        );
    }
    
//    public function rules()
//    {
//        return ArrayHelper::merge(
//            parent::rules(),
//            ['parent', 'safe']
//        );
//    }
    
    public function behaviors() {
        return [
            'tree' => [
                'class' => NestedSetsBehavior1::className(),
                'leftAttribute' => 'left',
                'rightAttribute' => 'right',
                'depthAttribute' => 'level'
            ]
        ];
    }
    
    public function getPosts() {
        return $this->hasMany(Post::className(), ['category_id'=>'id']);
    }
    
    public function getFullTitle() {
        return str_repeat('- - ', $this->level).$this->title;
    }
    
//    public function setParent($value)
//    {
//        $this->parent = $value;
//    }
//
//    public function getParent()
//    {
//        return $this->parent;
//    }
}
