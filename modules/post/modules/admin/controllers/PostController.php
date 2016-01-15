<?php

namespace app\modules\post\modules\admin\controllers;

use Yii;
use app\modules\post\Module;
use app\modules\post\models\Post;
use app\modules\post\models\PostSearch;
use yii\base\ErrorException;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\Inflector;
use yii\helpers\StringHelper;
use yii\web\Controller;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use ZendSearch\Lucene;

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
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create', 'update', 'delete'],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['index', 'create', 'update', 'delete'],
                        'roles' => ['@'],
                    ],
                ],
                'denyCallback' => function($rule, $action) {
                    return $this->redirect(['/site/login']);
                    throw new HttpException(403, Yii::t('yii','Login Required'));
                }
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
        
        //setlocale(LC_ALL, 'en_US.UTF-8');
        setlocale(LC_CTYPE, 'ru_RU.UTF-8');
        //Lucene\Lucene::setDefaultSearchField('contents');
        Lucene\Search\QueryParser::setDefaultEncoding('UTF-8');
        Lucene\Analysis\Analyzer\Analyzer::setDefault(new Lucene\Analysis\Analyzer\Common\Utf8\CaseInsensitive());
        Lucene\Lucene::setResultSetLimit(10);
        

        // create blog posts index located in /data/posts_index ,make sure the folder is writable
        $index = Lucene\Lucene::create('data/posts_index');

        $posts = Post::find()->all();
        //var_dump($posts);die();
        // iterate through posts and build the index
        foreach ($posts as $p) {
            $doc = new Lucene\Document();
            $doc->addField(Lucene\Document\Field::UnIndexed('entry_id', $p->id));
            $doc->addField(Lucene\Document\Field::Keyword('title', $p->title));
            $doc->addField(Lucene\Document\Field::text('contents', $p->content));
            $index->addDocument($doc);
        }
        // commit the index
        $index->commit();
        //Lucene\Analysis\Analyzer\Analyzer::setDefault(new Lucene\Analysis\Analyzer\Common\Utf8\CaseInsensitive());
        // explode the search query to individual words
        $words = explode(' ', urldecode(Yii::$app->getRequest()->getQueryParam('q')));
        // start a search query and add a term for each word to it
        $query = new Lucene\Search\Query\MultiTerm();
        foreach ($words as $w) {
            $query->addTerm(new Lucene\Index\Term($w));
        }

        // open and query the index
        $index = Lucene\Lucene::open('data/posts_index');
        $results = $index->find($query); // the search results
        //var_dump($results);
        
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'search' => $results,
            'query' => $query
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
            $model->alias = Inflector::slug($model->title);
            $model->created_date = time();
            $model->publish_date = time();
            if($model->save()) {
                \Yii::$app->session->setFlash('success', Module::t('general', 'Create post successfull'));
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

        if (Yii::$app->request->isPost) {
            $postData = Yii::$app->request->post()[StringHelper::basename($model->className())];
            var_dump(Yii::$app->request->post());
            $datep = date_parse_from_format('d/m/Y h:i:sA', $postData['publish_date']);
            $postData['publish_date'] = (int)mktime($datep['hour'],$datep['minute'], $datep['second'], $datep['month'],$datep['day'],$datep['year']);
            $model->title = $postData['title'];
            $model->alias = $postData['alias'];
            $model->desciption = $postData['desciption'];
            $model->content = $postData['content'];
            $model->category_id = $postData['category_id'];
            $model->image = $postData['image'];
            $model->meta_title = $postData['meta_title'];
            $model->meta_desciption = $postData['meta_desciption'];
            $model->publish_date = $postData['publish_date'];
            $model->active = $postData['active'];
            if(empty($model->alias)) {
                $model->alias = Inflector::slug($model->title);
            }
            if($model->save()) {
                \Yii::$app->session->setFlash('success', Module::t('general', 'Update post successfull'));
                return $this->redirect(['index']);
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
