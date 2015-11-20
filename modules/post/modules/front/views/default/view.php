<div class="front-default-index">
    <h1><?= !empty($post->post_title)?$post->post_title:$this->context->action->uniqueId ?></h1>
    <?php if($post) { ?>
    <?= $post->post_content_head ?>
    <?= $post->post_content_body ?>
    <?= $post->post_content_foot ?>
    <?php } ?>
</div>