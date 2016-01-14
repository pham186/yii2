<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use app\modules\post\models\Category;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\PostSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="search-form">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'post',
        'options'=>['class'=>'form-inline']
    ]); ?>
    
    <?php  echo $form->field($model, 'title', ['template' => '{input}', 'inputOptions' => ['placeholder'=>$model->getAttributeLabel('title')]])->label(false) ?>
    
    <?php echo $form->field($model, 'category_id', ['template' => '{input}'])->dropDownList(ArrayHelper::map(Category::find()->orderBy('left')->all(), 'id', 'fulltitle'), ['prompt'=>'Tất cả danh mục'])->label(false); ?>
    
    <?php echo $form->field($model, 'active', ['template' => '{input}'])->dropDownList([0=>'Ngừng hoạt động', 1=> 'Hoạt động'], ['prompt'=>'Tất cả trạng thái'])->label(false); ?>

    <?php // echo $form->field($model, 'meta_title') ?>

    <?php // echo $form->field($model, 'meta_desciption') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'created_date') ?>

    <?php // echo $form->field($model, 'publish_date') ?>

    <?php // echo $form->field($model, 'updated_date') ?>

    <?php // echo $form->field($model, 'views') ?>

    <?php // echo $form->field($model, 'active')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-success btn-block']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>