<?php

namespace app\modules\post\models\base;

use Yii;
use app\modules\post\Module;

/**
 * This is the model class for table "tbl_post".
 *
 * @property integer $id
 * @property string $title
 * @property string $alias
 * @property string $desciption
 * @property string $content
 * @property integer $category_id
 * @property string $image
 * @property string $meta_title
 * @property string $meta_desciption
 * @property integer $created_by
 * @property integer $created_date
 * @property integer $publish_date
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
        return 'tbl_post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'category_id'], 'required'],
            [['content'], 'string'],
            [['category_id', 'created_by', 'views'], 'integer'],
            [['active'], 'boolean'],
            [['title', 'alias', 'desciption', 'image', 'meta_title', 'meta_desciption'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Module::t('general', 'ID'),
            'title' => Module::t('general', 'Title'),
            'alias' => Module::t('general', 'Alias'),
            'desciption' => Module::t('general', 'Desciption'),
            'content' => Module::t('general', 'Content'),
            'category_id' => Module::t('general', 'Category'),
            'image' => Module::t('general', 'Image'),
            'meta_title' => Module::t('general', 'Meta Title'),
            'meta_desciption' => Module::t('general', 'Meta Desciption'),
            'created_by' => Module::t('general', 'Created By'),
            'created_date' => Module::t('general', 'Created Date'),
            'publish_date' => Module::t('general', 'Publish Date'),
            'updated_date' => Module::t('general', 'Updated Date'),
            'views' => Module::t('general', 'Views'),
            'active' => Module::t('general', 'Active'),
        ];
    }
}
