<div class="user-default-index">
    <h1><?= $this->context->action->uniqueId ?></h1>
    <?= $hash ?>
    <?php
    echo Yii::$app->getSecurity()->generateRandomString();die();
    if (Yii::$app->getSecurity()->validatePassword(md5('123456'), $hash)) {
        // all good, logging user in
        echo 'ok';
    } else {
        // wrong password
        echo 'not ok';
    }
    ?>
    <p>
        This is the view content for action "<?= $this->context->action->id ?>".
        The action belongs to the controller "<?= get_class($this->context) ?>"
        in the "<?= $this->context->module->id ?>" module.
    </p>
    <p>
        You may customize this page by editing the following file:<br>
        <code><?= __FILE__ ?></code>
    </p>
</div>
