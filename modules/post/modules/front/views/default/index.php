<div class="front-default-index">
    <h1><?= $this->context->action->uniqueId ?></h1>
    <?php if($posts) { 
        foreach ($posts as $item) {
            echo '<a href="'.Yii::$app->urlManager->createUrl(['post/front/default/view','id'=>$item->id,'alias'=>$item->alias]).'">'.$item->title.'</a><br/>';
        }
    } ?>
</div>
