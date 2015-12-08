<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\post\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Category', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'title',
                'label' => 'Tiêu đề',
                'value' => function ($model) {
                    return str_repeat('- - ', $model->level).$model->title;
                }
            ],
            'alias',
            'description:text:Mô tả',
//            'left',
            // 'right',
            // 'level',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete} {link}'
            ],
        ],
    ]); ?>

</div>
