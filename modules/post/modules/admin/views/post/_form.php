<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\widgets\FileManager;
use app\widgets\tinymce\TinyMCE;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form row">
    
    <div class="col-md-12">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alias')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'desciption')->textarea(['maxlength' => true]) ?>

        <?= TinyMCE::widget(['model'=>$model, 'attribute'=>'content','mode'=>'advanced', 'options'=>['height'=>400]]); ?>

        <?= $form->field($model, 'category_id')->dropDownList(\yii\helpers\ArrayHelper::map(app\modules\post\models\Category::find()->all(), 'id', 'FullTitle')) ?>
       
        <?= FileManager::widget(['model'=>$model, 'attribute'=>'image']); ?>
        
        <?= $form->field($model, 'meta_title')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'meta_desciption')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'publish_date')->textInput(['maxlength' => true, 'class' => 'form-control datepicker', 'value' => date('d-m-Y h:i:sA', (int)$model->publish_date)]) ?>

        <?= $form->field($model, 'active')->checkbox() ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>
        
    </div>

</div>
<?php
    $this->registerJs('
        $(function () {
            $(\'#post-publish_date\').datetimepicker({
                format: \'DD/MM/YYYY hh:mm:ssA\',
                showTodayButton: true,
                locale: \'vi\'
            });
        });
        
        $(\'.datepicker\').parent().css(\'position\',\'relative\');
    ', \yii\web\View::POS_READY);
?>