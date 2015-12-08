<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
return [
    'p<id:\d+>-<alias:[A-Za-z0-9\-]*>.html' => 'post/front/default/view',
    'admin/post/' => 'post/admin/post/index',
    'admin/post/<action:\w+>/' => 'post/admin/post/<action>',
    'admin/category/' => 'post/admin/category/index',
    'admin/category/<action:\w+>/' => 'post/admin/category/<action>',
];

