<div class="front-default-index">
    <h1><?= !empty($post->title)?$post->title:$this->context->action->uniqueId ?></h1>
    <?php if($post) { ?>
    <?= !empty($post->category->title)?$post->category->title:'' ?>
    <?= $post->content ?>
    <?php } ?>
</div>