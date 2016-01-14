<?php

use yii\helpers\Html;
use app\modules\post\Module;


/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Post */

$this->title = 'Create Post';
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$this->params['menuAction'] = [
    ['label' => Module::t('general', 'List Post'), 'url' => ['index'], 'options' => ['class' => 'aui-button']],
];
?>
<div class="post-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
