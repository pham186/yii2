<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Category */

$this->title = 'Update Category: ' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Categories', 'url' => ['index']];
foreach($category as $item) {
   $this->params['breadcrumbs'][] = ['label' => $item->title, 'url' => ['view', 'id' => $item->id]];
}
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
