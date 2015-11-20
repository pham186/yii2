<div class="front-default-index">
    <h1><?= $this->context->action->uniqueId ?></h1>
    <?php if($posts) { 
        foreach ($posts as $item) {
//            var_dump($item);
            echo '<a href="'.Yii::$app->urlManager->createUrl(['post/front/default/view','id'=>$item->post_id,'alias'=>$item->post_name]).'">'.$item->post_title.'</a><br/>';
        }
    } ?>
</div>
