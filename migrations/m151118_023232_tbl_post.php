<?php

use yii\db\Schema;
use yii\db\Migration;

class m151118_023232_tbl_post extends Migration
{
    public function up()
    {
        $this->createTable('tbl_post', [
            'id'=>$this->primaryKey(),
            'title'=>$this->string(255)->notNull(),
            'alias'=>$this->string(255)->notNull()
        ]);
    }

    public function down()
    {
        $this->dropTable('tbl_post');
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
