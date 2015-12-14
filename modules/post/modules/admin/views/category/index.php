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
    <?php \yii\widgets\Pjax::begin(['id' => 'list-category']); ?>
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
            [
                'attribute' => 'id',
                'format' => 'raw',
                'label' => 'Sắp xếp',
                'value' => function ($model) {
                    $str = Html::a('<span class="sortbutton glyphicon glyphicon-triangle-bottom" aria-hidden="true" data-id="'.$model->id.'" data-type="right"></span>', 'javascript:void(0)', ['title' => 'Down']);
                    $str .= Html::a('<span class="sortbutton glyphicon glyphicon-triangle-top" aria-hidden="true" data-id="'.$model->id.'" data-type="left"></span>', 'javascript:void(0)', ['title' => 'Up']);
                    return $str;
                },
                'contentOptions'=>['style'=>'width: 17px;text-align: center;']
            ],
            'alias',
            'description:text:Mô tả',
//            'left',
            // 'right',
            // 'level',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete} {link}',
                'contentOptions'=>['style'=>'width: 60px;text-align: center;'],
//                'buttons' => [
//                    'delete' => [
//                        'data-confirm' => 'Xóa mục này sẽ xóa cả các mục con & bài viết của nó.<br/>Bạn có chắc chắn muốn xóa không?'
//                    ]
//                ]
            ],
        ],
    ]);    yii\widgets\Pjax::end();?>
</div>
<?php $this->registerJs('
$(".sortbutton").on("click",function(){
    var movetype = $(this).attr("data-type");
    var id = $(this).attr("data-id");
    $.post("'.Yii::$app->urlManager->createUrl('admin/category/movenode').'", {id:id,movetype:movetype} ,function(data){
        if(data) {
            location.reload();
        }
    });
});');
?>