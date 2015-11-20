<?php

use yii\db\Schema;
use yii\db\Migration;

class m151118_022208_tbl_user extends Migration
{
    public function up()
    {
        $this->createTable('tbl_user', [
            'id' => $this->primaryKey(),
            'username' => $this->string(255)->notNull(),
            'password' => $this->string(255)->notNull(),
        ]);
    }

    public function down()
    {
        echo "m151118_022208_tbl_user cannot be reverted.\n";

        return false;
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
