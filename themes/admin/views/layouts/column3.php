<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="row">
    <div class="col-md-3 leftbar"><?php $this->widget('application.widgets.LeftSidebar'); ?></div>
    <div class="col-md-6"><?php echo $content; ?></div>
    <div class="col-md-3 rightbar"><?php $this->widget('application.widgets.RightSidebar'); ?></div>
</div>
<?php $this->endContent(); ?>
</div>