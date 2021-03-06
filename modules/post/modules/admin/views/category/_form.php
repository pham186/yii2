<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\widgets\tinymce\TinyMCE;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Category */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alias')->textInput(['maxlength' => true]) ?>
    
    <?= TinyMCE::widget(['model'=>$model,'field'=>'description','mode'=>'advanced']); ?>

    <?= $form->field($model, 'parent')->dropDownList($categorylist ,array('prompt'=>'Root Category')) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
