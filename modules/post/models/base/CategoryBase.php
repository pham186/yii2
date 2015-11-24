<?php

namespace app\modules\post\models\base;

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
class CategoryBase extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'alias'], 'required'],
            [['left', 'right', 'level'], 'integer'],
            [['title', 'alias', 'description'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'alias' => 'Alias',
            'description' => 'Description',
            'left' => 'Left',
            'right' => 'Right',
            'level' => 'Level',
        ];
    }
}
