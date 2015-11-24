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
        $cache = \Yii::$app->getCache();
        $cache->flush();
        foreach ($posts as $item) {
//            var_dump($item);
            $post = clone $item;
            $post->alias = \yii\helpers\Inflector::slug($post->title);
            $post->created_date = time();
            $post->publish_date = time();
            try {
                $post->save();
            } catch (Exception $ex) {
                var_dump($ex);
            }
        }
        return $this->render('index', ['posts'=>$posts]);
    }
    
    public function actionView()
    {
        $id = \Yii::$app->request->get('id', 0);
        $alias = \Yii::$app->request->get('alias', 'non-alias');
        
        Post::updateAllCounters(['views'=>1], ['id'=>$id]);
        
        $cache = \Yii::$app->getCache();
        $cache->keyPrefix = 'post-';
        $data = $cache->get('post_'.$id);
        if ($data === false) {
            $post = Post::find(['id'=>$id,'alias'=>$alias])->with('category')->all();
            if($post) {
                $data = $post;
                $cache->set('post_'.$id, $data);
            } else {
                throw new NotFoundHttpException('Post not found');
            }
        }
        \Yii::$app->view->title = $data[0]->title;
        return $this->render('view', ['post'=>$data[0]]);
    }
}
