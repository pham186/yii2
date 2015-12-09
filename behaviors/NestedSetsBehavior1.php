<?php
/**
 * @link https://github.com/creocoder/yii2-nested-sets
 * @copyright Copyright (c) 2015 Alexander Kochetov
 * @license http://opensource.org/licenses/BSD-3-Clause
 */
namespace app\behaviors;

use yii\base\Behavior;
use yii\base\NotSupportedException;
use yii\db\ActiveRecord;
use yii\db\Exception;
use yii\db\Expression;
/**
 * NestedSetsBehavior
 *
 * @property ActiveRecord $owner
 *
 * @author Alexander Kochetov <creocoder@gmail.com>
 */
class NestedSetsBehavior1 extends Behavior
{
    /**
     * @var string 
     */
    public $leftAttribute = 'left';
    
    /**
     * @var string 
     */
    public $rightAttribute = 'right';
    
    /**
     * @var string 
     */
    public $depthAttribute = 'level';
    
    /**
     * @var int
     */
    public $rootLevel = 0;


    /**
     * Save a node to last child of target
     * @param ActiveRecord $target
     * @param boolean $runValidation
     * @param array $attributes
     * @return boolean
     */
    public function appendTo($target = null, $runValidation = true, $attributes = null) {
        
        $owner = $this->owner;
        $db = $owner->getDb();
        if($target == null) {
            $lastChild = $owner->find()->where(['level'=>$this->rootLevel+1])->orderBy('left DESC')->one();
        } else {
            try {
            $lastChild = $owner->find()
                    ->where([
                        $this->depthAttribute => $target->{$this->depthAttribute}+1,
                    ])
                    ->andWhere([
                        'and',
                        ['>', $this->leftAttribute, $target->{$this->leftAttribute}],
                        ['<', $this->rightAttribute, $target->{$this->rightAttribute}],
                    ])
                    ->orderBy('left DESC')
                    ->one();
            } catch (yii\db\Exception $e) {
                echo $e->getMessage();
            }
        }
        
        
        $left = 1;
        $right = 2;
        $level = $this->rootLevel+1;
        if(empty($lastChild) && !empty($target)) {
            $left = $target->{$this->rightAttribute};
//            $right = $target->{$this->rightAttribute};
            $level = $target->{$this->depthAttribute}+1;
        } elseif (!empty($lastChild)) {
            $left = $lastChild->{$this->rightAttribute} + 1;
//            $right = $lastChild->{$this->rightAttribute} + 2;
            $level = $lastChild->{$this->depthAttribute};
        }
        if($owner->isNewRecord == true) {
            $width = 1;
            $owner->{$this->leftAttribute} = $left;
            $owner->{$this->rightAttribute} = $left+$width;
            $owner->{$this->depthAttribute} = $level;
            $owner->updateAllCounters(
                [$this->rightAttribute=>2],
                ['>=', $this->rightAttribute, $left]
            );
            
            $owner->updateAllCounters(
                [$this->leftAttribute=>2],
                ['>', $this->leftAttribute, $left]
            );
        } else {
            $width = $owner->{$this->rightAttribute} - $owner->{$this->leftAttribute};
            $ownerLeft = $owner->{$this->leftAttribute};
            $ownerRight = $owner->{$this->rightAttribute};
            $ownerLevel = $owner->{$this->depthAttribute};
            
            $owner->updateAllCounters(
                [$this->rightAttribute=>$width+1],
                ['>=', $this->rightAttribute, $left]
            );
            
            $owner->updateAllCounters(
                [$this->leftAttribute=>$width+1],
                ['>=', $this->leftAttribute, $left]
            );
            
            if($ownerLeft > $left) {
                $ownerLeft += ($width+1);
                $ownerRight += ($width+1);
            }
            
            $owner->updateAllCounters(
                [$this->depthAttribute=>($level-$ownerLevel)],
                [
                    'and',
                    ['>=', $this->leftAttribute, $ownerLeft],
                    ['<=', $this->rightAttribute, $ownerRight]
                ]
            );
            
            $owner->updateAllCounters(
                [
                    $this->leftAttribute=>($left-$ownerLeft),
                    $this->rightAttribute=>($left-$ownerLeft),
                ],
                [
                    'and',
                    ['>=', $this->leftAttribute, $ownerLeft],
                    ['<=', $this->rightAttribute, $ownerRight]
                ]
            );
            
            $owner->updateAllCounters(
                [$this->rightAttribute=>-$width-1],
                ['>=', $this->rightAttribute, $ownerRight]
            );
            
            $owner->updateAllCounters(
                [$this->leftAttribute=>-$width-1],
                ['>=', $this->leftAttribute, $ownerRight]
            );
        }
        
        try {
            return $owner->save($runValidation, $attributes);
        } catch (Exception $e) {
            echo $e;
        }
    }
    public function prependTo($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function insertAfter($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function insertBefore($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function moveFirst($runValidation = true, $attributes = null) {
        
    }
    public function moveLast($runValidation = true, $attributes = null) {
        
    }
    public function moveLeft($runValidation = true, $attributes = null) {
        
    }
    public function moveRight($runValidation = true, $attributes = null) {
        
    }
    public function moveAfter($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function moveBefore($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function makeRoot($runValidation = true, $attributes = null) {
        
    }
    public function saveNode($runValidation = true, $attributes = null) {
        
    }
    
    public function getParent() {
        $owner = $this->owner;
        return $owner->find()->where([
            'and',
            ['=','level',$owner->level-1],
            ['<',$this->leftAttribute,$owner->{$this->leftAttribute}],
            ['>',$this->rightAttribute,$owner->{$this->rightAttribute}],
        ])->one();
    }
}