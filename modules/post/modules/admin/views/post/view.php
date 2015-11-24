<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-view">

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
            'id',
            'title:text:Tiêu đề',
            'alias',
            'desciption:text:Mô tả',
//            'content:ntext',
            'category.title:text:Danh mục',
            'meta_title:text:Thẻ meta title',
            'meta_desciption:text:Thẻ meta desciption',
            'author.full_name:text:Tác giả',
            [
                'attribute' => 'created_date',
                'format' => ['date','php:h:i:sA d-m-Y'],
                'label' => 'Ngày viết'
            ],
            [
                'attribute' => 'publish_date',
                'format' => ['date','php:h:i:sA d-m-Y'],
                'label' => 'Ngày xuất bản'
            ],
            [
                'attribute' => 'updated_date',
                'format' => ['date','php:h:i:sA d-m-Y'],
                'label' => 'Ngày cập nhật'
            ],
            'views:integer:Lượt xem',
            'active:boolean:Kích hoạt',
        ],
    ]) ?>

</div>
