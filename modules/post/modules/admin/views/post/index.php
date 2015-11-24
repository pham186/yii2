<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\post\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
//        'emptyCell'=>'-',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'title',
            'category.title:raw:Category',
//            'alias',
//            'desciption',
//            'content:ntext',
            // 'category',
            // 'meta_title',
            // 'meta_desciption',
            // 'created_by',
            [ 
                'attribute' => 'created_date',
                'format' => ['date', 'php:h:i:sA d-m-Y'],
            ],
//             'publish_date:date, H\:i\:s:abc',
//             'updated_date',
             'views',
             'active:boolean',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete} {link}',
                'buttons' => [
                    'link' => function ($url,$model,$key) {
                        return Html::a('<span class="glyphicon glyphicon-link"></span>', Yii::$app->urlManager->createAbsoluteUrl(['post/front/default/view','id'=>$model->id,'alias'=>$model->alias]));
                    },
                ],
            ],
        ],
    ]); ?>

</div>
