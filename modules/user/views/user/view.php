<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\user\models\User */

$this->title = 'User Detail';
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
echo date('h:i:sA d-m-Y');
var_dump(Yii::$app->user->identity);
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'full_name',
            'username',
            'password',
            'email:email',
            'phone',
            [
                'label'=>'Gender',
                'value'=>$model->gender?'Nam':'Nữ'
            ],
            [
                'label' => 'Created Date',
                'value' =>  date('h:i:sA d-m-Y', $model->created_date)
            ],
        ],
    ]) ?>

</div>
