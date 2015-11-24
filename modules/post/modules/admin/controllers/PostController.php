<?php

namespace app\modules\post\modules\admin\controllers;

use Yii;
use app\modules\post\models\Post;
use app\modules\post\models\PostSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PostController implements the CRUD actions for Post model.
 */
class PostController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PostSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Post model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Post();

        if ($model->load(Yii::$app->request->post())) {
            $model->alias = \yii\helpers\Inflector::slug($model->title);
            $model->created_date = time();
            $model->publish_date = time();
            if($model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Post model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
//            Yii::$app->formatter->locale = 'vi-VN';
////            echo \Yii::$app->formatter->asTime($model->publish_date);die();
//            $datep = date_parse_from_format('d/m/Y H:i', $model->publish_date);
//            echo mktime($datep['hour'],$datep['minute'], $datep['second'], $datep['month'],$datep['day'],$datep['year']);die();
//            echo date('h:i:sA d/m/Y','12:00:00AM 24/11/2015');die();
//            echo date('h:i:sA d/m/Y', $model->publish_date);
//            var_dump(strtotime($model->publish_date));die();
//            var_dump($model);die();
            if(empty($model->alias)) {
                $model->alias = \yii\helpers\Inflector::slug($model->title);
            }
            $datep = date_parse_from_format('d/m/Y H:i', $model->publish_date);
            $model->publish_date = (string)mktime($datep['hour'],$datep['minute'], $datep['second'], $datep['month'],$datep['day'],$datep['year']);
            if($model->save()) {
//                var_dump($model);
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                var_dump($model);
                var_dump($model->getErrors());
            }
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Post model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
