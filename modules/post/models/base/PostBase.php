<?php

namespace app\modules\post\models\base;

use Yii;

/**
 * This is the model class for table "{{%post}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $alias
 * @property string $desciption
 * @property string $content
 * @property integer $category_id
 * @property string $meta_title
 * @property string $meta_desciption
 * @property integer $created_by
 * @property integer $created_date
 * @property string $publish_date
 * @property integer $updated_date
 * @property integer $views
 * @property boolean $active
 */
class PostBase extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%post}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'category_id'], 'required'],
            [['content'], 'string'],
            [['category_id', 'created_by', 'created_date', 'updated_date', 'views'], 'integer'],
            [['active'], 'boolean'],
            [['title', 'alias', 'desciption', 'meta_title', 'meta_desciption'], 'string', 'max' => 255],
            [['publish_date'], 'string']
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
            'desciption' => 'Desciption',
            'content' => 'Content',
            'category_id' => 'Category ID',
            'meta_title' => 'Meta Title',
            'meta_desciption' => 'Meta Desciption',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'publish_date' => 'Publish Date',
            'updated_date' => 'Updated Date',
            'views' => 'Views',
            'active' => 'Active',
        ];
    }
}
