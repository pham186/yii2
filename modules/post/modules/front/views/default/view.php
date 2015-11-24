<div class="front-default-index">
    <h1><?= !empty($post->title)?$post->title:$this->context->action->uniqueId ?></h1>
    <?php if($post) { ?>
    <?= $post->category->title ?>
    <?= $post->content ?>
    <?php } ?>
</div>