<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\CategorySearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options'=>['class'=>'form-inline']
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'alias') ?>

    <?= $form->field($model, 'description') ?>

    <?= $form->field($model, 'left') ?>

    <?php // echo $form->field($model, 'right') ?>

    <?php // echo $form->field($model, 'level') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php
/* @var $this CategoryController */
/* @var $model Category */
/* @var $form CActiveForm */
?>

<div class="search-form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
        'htmlOptions'=>array('class'=>'form-inline')
)); ?>
    
    <div class="form-group">
        <?php echo $form->textField($model,'title',array('class'=>'form-control search-query','placeholder'=>'Tên danh mục','maxlength'=>255)); ?>
    </div>
    
    <div class="form-group">
        <div class="btn-group btn-block">
            <button data-toggle="dropdown" class="btn btn-default btn-block dropdown-toggle search-query" id="select-category">Danh mục cha  <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li data-value=""><a href="#">Danh mục cha</a></li>
                <li data-value="1"><a href="#">Danh mục 1</a></li>
                <li data-value="2"><a href="#">Danh mục 2</a></li>
                <li data-value="3"><a href="#">Danh mục 3</a></li>
            </ul>
           <?php echo $form->hiddenField($model,'parent',array('class'=>'form-control')); ?>
        </div>		
    </div>
    
    <div class="form-group">
        <div class="btn-group btn-block">
            <button data-toggle="dropdown" class="btn btn-default btn-block dropdown-toggle search-query" id="select-category">Tất cả trạng thái  <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li data-value=""><a href="#">Tất cả trạng thái</a></li>
                <li data-value="0"><a href="#">Ngưng hoạt động</a></li>
                <li data-value="1"><a href="#">Hoạt động</a></li>
            </ul>
           <?php echo $form->hiddenField($model,'active',array('class'=>'form-control')); ?>
        </div>		
    </div>
<div class="form-group">
		<?php echo CHtml::submitButton('Search', array('class'=>'btn btn-success btn-block')); ?>
    </div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->

<script>
    $(document).ready(function(){
        $('.dropdown-menu li').click(function(e){
            e.preventDefault();
            var selected = $(this).attr('data-value');
            var text = $(this).text();
            $(this).parent().parent().find('button').html(text + '  <span class="caret"></span>');
            $(this).parent().parent().find('input[type="hidden"]').val(selected);  
        });
    });
</script>