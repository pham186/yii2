<?php

namespace app\modules\post\modules\admin\controllers;

use Yii;
use app\modules\post\models\Category;
use app\modules\post\models\CategorySearch;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends Controller
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
     * Lists all Category models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CategorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Category model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        
        $category = Category::find()->where(['and',['<','left',$model->left],['>','right',$model->right],['<','level',$model->level]])->orderBy('level ASC')->all();
        
        return $this->render('view', [
            'category' => $category,
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Category();
//        var_dump($postData['Category']);die();
        try {
            if (Yii::$app->request->isPost) {
                $postData = Yii::$app->request->post()['Category'];
                $model->setAttributes([
                    'title'=>$postData['title'],
                    'alias'=>$postData['alias'],
                    'description'=>$postData['description'],
                ]);
                if(empty($postData['parent'])) {
                    $postData['parent'] = 0;
                }
                $target = $this->findModel($postData['parent']);
                if($model->appendTo($target)) {
                    return $this->redirect(['view', 'id' => $model->id]);
                }
            } else {
                $categorylist = ArrayHelper::map(Category::find()->orderBy('left')->all(), 'id', 'FullTitle');
                return $this->render('create', [
                    'model' => $model,
                    'categorylist' => $categorylist
                ]);
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        try {
            if($model->getParent()) {
                $model->setAttribute('parent', $model->getParent()->id);
            }
            if (Yii::$app->request->isPost) {
                $postData = Yii::$app->request->post()['Category'];
                $updateModel = $this->findModel($id);
                $updateModel->setAttributes([
                    'title'=>$postData['title'],
                    'alias'=>$postData['alias'],
                    'description'=>$postData['description'],
                ]);
//                var_dump($model);die();
                if(empty($postData['parent'])) {
                    $postData['parent'] = 0;
                }
                $target = $this->findModel($postData['parent']);
                if($target->id != $id) {
                    if($updateModel->appendTo($target)) {
                        return $this->redirect(['index']);
                    }
                } else {
                    if($updateModel->save()) {
                        return $this->redirect(['index']);
                    }
                }
            } else {
                $listcategory = ArrayHelper::map(Category::find()->where(['or',['<','left',$model->left],['>','right',$model->right]])->orderBy('left')->all(), 'id', 'FullTitle');
                $category = Category::find()->where(['and',['<','left',$model->left],['>','right',$model->right],['<','level',$model->level]])->orderBy('level ASC')->all();
                $categorylist = ArrayHelper::map(Category::find()->where(['or',['<','left',$model->left],['>','right',$model->right]])->orderBy('left')->all(), 'id', 'FullTitle');
                return $this->render('update', [
                    'model' => $model,
                    'category' => $category,
                    'categorylist' => $categorylist
                ]);
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    /**
     * Deletes an existing Category model.
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
     * 
     */
    public function actionMovenode() {
        $request = Yii::$app->request;
        $id = $request->post('id');
        $movetype = $request->post('movetype');
        $model = $this->findModel($id);
        if(!empty($model)) {
            return $model->moveNode($movetype);
            //return $model->moveNode($movetype);
        } else {
            echo 0;
        }
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        return Category::findOne($id);
//        if (($model = Category::findOne($id)) !== null) {
//            return $model;
//        } else {
//            throw new NotFoundHttpException('The requested page does not exist.');
//        }
    }
}
