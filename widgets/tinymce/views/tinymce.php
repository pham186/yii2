<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\widgets\views;

use yii\helpers\StringHelper;

$modelClass = StringHelper::basename($model::className());

echo '<div class="form-group">';
    echo '<textarea class="'.$cssClass.'" id="'.  strtolower($modelClass).'-'.$field.'" name="'.$modelClass.'['.$field.']'.'" rows="'.$rows.'">'.$model->{$field}.'</textarea>';
echo '</div>';