<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\modules\post\Module;
use app\widgets\FileManager;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\post\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Module::t('general', 'Posts');
$this->params['breadcrumbs'][] = $this->title;
?>
<?= FileManager::widget(); ?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    
    <?php 
        foreach ($search as $hit) {
            echo $hit->id;
            echo $hit->title;
            echo $query->highlightMatches($hit->contents, 'UTF-8');
            echo '<br/>';
            //secho $hit->author;
        }
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
//        'emptyCell'=>'-',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            [
//                'attribute' => 'image',
//                'format' => 'html',
//                'label' => Module::t('general', 'Image'),
//                'value' => function($model){
//                    return Html::img('@web/resources/thumbs/'.$model->image, ['alt'=>'Image','style'=>'max-width: 100px;']);
//                },
//            ],
            'title',
            'category.title:raw:'.Module::t('general', 'Category'),
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
                'label' => Module::t('general', 'Created Date'),
            ],
//             'publish_date:date, H\:i\:s:abc',
//             'updated_date',
             'views:raw:'.Module::t('general', 'Views'),
             'active:boolean:'.Module::t('general', 'Active'),

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
