<?php

namespace app\modules\post\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\post\models\Post;

/**
 * PostSearch represents the model behind the search form about `app\modules\post\models\Post`.
 */
class PostSearch extends Post
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'category', 'created_by', 'created_date', 'publish_date', 'updated_date', 'views'], 'integer'],
            [['title', 'alias', 'desciption', 'content', 'meta_title', 'meta_desciption'], 'safe'],
            [['active'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Post::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'category' => $this->category,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
            'publish_date' => $this->publish_date,
            'updated_date' => $this->updated_date,
            'views' => $this->views,
            'active' => $this->active,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'alias', $this->alias])
            ->andFilterWhere(['like', 'desciption', $this->desciption])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'meta_title', $this->meta_title])
            ->andFilterWhere(['like', 'meta_desciption', $this->meta_desciption]);

        return $dataProvider;
    }
}
