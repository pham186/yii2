<?php

namespace app\modules\post\modules\front\controllers;

use yii\web\Controller;
use app\modules\post\models\Post;
use yii\web\NotFoundHttpException;

class DefaultController extends Controller
{
    public function actionIndex()
    {
        $posts = Post::find()->all();
//        $cache = \Yii::$app->getCache();
//        $cache->flush();
        return $this->render('index', ['posts'=>$posts]);
    }
    
    public function actionView()
    {
        $id = \Yii::$app->request->get('id', 0);
        $alias = \Yii::$app->request->get('alias', 'non-alias');
        $cache = \Yii::$app->getCache();
        $cache->keyPrefix = 'post-';
        $data = $cache->get('post_'.$id);
        if ($data === false) {
            $post = Post::findOne(['post_id'=>$id,'post_name'=>$alias]);
            if($post) {
                \Yii::$app->view->title = $post->post_title;
                $data = $post;
                $cache->set('post_'.$id, $data);
            } else {
                throw new NotFoundHttpException('Post not found');
            }
        }
        
        return $this->render('view', ['post'=>$data]);
    }
}
