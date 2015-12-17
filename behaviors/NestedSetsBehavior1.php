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
     * @var string Left Attribute - default 'left'
     */
    public $leftAttribute = 'left';
    
    /**
     * @var string Right Attribute - default 'right'
     */
    public $rightAttribute = 'right';
    
    /**
     * @var string Depth Attribute - default 'level'
     */
    public $depthAttribute = 'level';
    
    /**
     * @var int Root level - default 0
     */
    public $rootLevel = 0;


    /**
     * Save a node to last child of target
     * @param ActiveRecord $target
     * @param boolean $runValidation
     * @param array $attributes
     * @return boolean
     */
    public function appendTo($target = null, $isParent = true, $runValidation = true, $attributes = null) {
        
        $left = 1;
        $level = $this->rootLevel+1;
        if(!empty($target)) {
            $left = $target->{$this->rightAttribute};
            $level = $target->{$this->depthAttribute}+1;
            if($isParent == false) {
                $left = $target->{$this->rightAttribute}+1;
                $level = $target->{$this->depthAttribute};
            }
        } else {
            $last = $this->owner->find()->where(['=',$this->depthAttribute,$this->rootLevel+1])->orderBy($this->rightAttribute.' DESC')->one();
            if(!empty($last)) {
                $left = $last->{$this->rightAttribute}+1;
                $level = $last->{$this->depthAttribute};
            }
        }
        
        return $this->saveNode($left, $level, $runValidation, $attributes);
    }
    
    public function prependTo($target = null, $isParent = true, $runValidation = true, $attributes = null) {
        
        $left = 1;
        $level = $this->rootLevel+1;
        if(!empty($target)) {
            $left = $target->{$this->rightAttribute};
            $level = $target->{$this->depthAttribute}+1;
            if($isParent == false) {
                $left = $target->{$this->leftAttribute};
                $level = $target->{$this->depthAttribute};
            }
        } else {
            $first = $this->owner->find()->where(['=',$this->depthAttribute,$this->rootLevel+1])->orderBy($this->leftAttribute.' ASC')->one();
            if(!empty($first)) {
                $left = $first->{$this->leftAttribute};
                $level = $first->{$this->depthAttribute};
            }
        }
        
        return $this->saveNode($left, $level, $runValidation, $attributes);
    }
    public function insertAfter($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function insertBefore($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function moveNode($movetype = 'left', $runValidation = true, $attributes = null) {
        switch ($movetype) {
            case 'left' :
                return $this->moveLeft($runValidation, $attributes);
                break;
            case 'right' :
                return $this->moveRight($runValidation, $attributes);
                break;
            case 'first' :
                return $this->moveFirst($runValidation, $attributes);
                break;
            case 'last' :
                return $this->moveLast($runValidation, $attributes);
                break;
        }
    }
    public function moveFirst($runValidation = true, $attributes = null) {
        
    }
    public function moveLast($runValidation = true, $attributes = null) {
        
    }
    
    /**
     * Move a Node to left
     * @param boolean $runValidation
     * @param array $attributes
     * @return boolean If node don't has previous node - return false. If node has previous node - return result save node as boolean
     */
    public function moveLeft($runValidation = true, $attributes = null) {
        $prev = $this->prev();
        if(!empty($prev)) {
            return $this->prependTo($prev, false, $runValidation, $attributes);
        } else {
            return false;
        }
        
    }
    
    /**
     * Move a Node to right
     * @param boolean $runValidation
     * @param array $attributes
     * @return boolean
     */
    public function moveRight($runValidation = true, $attributes = null) {
        $next = $this->next();
        if(!empty($next)) {
            return $this->appendTo($next, false, $runValidation, $attributes);
        } else {
            return false;
        }
    }
    public function moveAfter($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function moveBefore($target = null, $runValidation = true, $attributes = null) {
        
    }
    public function makeRoot($runValidation = true, $attributes = null) {
        
    }
    public function saveNode($left, $level, $runValidation = true, $attributes = null) {
        
        $owner = $this->owner;
        if($owner->isNewRecord == true) {
            $width = 1;
            $owner->{$this->leftAttribute} = $left;
            $owner->{$this->rightAttribute} = $left+$width;
            $owner->{$this->depthAttribute} = $level;
            
            $this->shiftLeftRight($left, 2);
        } else {
            $width = $owner->{$this->rightAttribute} - $owner->{$this->leftAttribute};
            $ownerLeft = $owner->{$this->leftAttribute};
            $ownerRight = $owner->{$this->rightAttribute};
            $ownerLevel = $owner->{$this->depthAttribute};
            
            $this->shiftLeftRight($left, $width+1);
            
            if($ownerLeft > $left) {
                $ownerLeft += ($width+1);
                $ownerRight += ($width+1);
            }
            
            $owner->updateAllCounters(
                [
                    $this->depthAttribute=>($level-$ownerLevel),
                    $this->leftAttribute=>($left-$ownerLeft),
                    $this->rightAttribute=>($left-$ownerLeft),
                ],
                [
                    'and',
                    ['>=', $this->leftAttribute, $ownerLeft],
                    ['<=', $this->rightAttribute, $ownerRight]
                ]
            );
            
            $this->shiftLeftRight($ownerRight, -$width-1);
        }
        
        try {
            return $owner->save($runValidation, $attributes);
        } catch (Exception $e) {
            echo $e;
        }
    }
    
    public function shiftLeftRight($key, $value) {
        foreach ([$this->leftAttribute, $this->rightAttribute] as $attribute) {
            $this->owner->updateAllCounters(
                [$attribute=>$value],
                ['>=', $attribute, $key]
            );
        }
    }
    
    public function deleteNode($deleteChild = true) {
        $left = $this->owner->{$this->leftAttribute};
        $right = $this->owner->{$this->rightAttribute};
        $this->owner->deleteAll(['and',['>=','left',$left], ['<=','right',$right]]);
        $this->shiftLeftRight($right, -($right-$left)-1);
    }
    
    public function next() {
        return $this->owner->find()->where(['=',$this->leftAttribute,$this->owner->{$this->rightAttribute}+1])->one();
    }
    
    public function prev() {
         return $this->owner->find()->where(['=',$this->rightAttribute,$this->owner->{$this->leftAttribute}-1])->one();
    }
    
    public function first($isParent = false) {
        $owner = $this->owner;
        $left = 1;
        $parent = $owner->getParent();
        if(!empty($parent)) {
            $left = $parent->{$this->leftAttribute}+1;
        }
        return $owner->find()->where([
            'and',
            ['=',$this->leftAttribute,$left],
        ])->one();
    }
    
    public function last($isParent = false) {
        $owner = $this->owner;
        $parent = $owner->getParent();
        if($isParent) {
            $parent = $owner;
        }
        if(!empty($parent)) {
            return $owner->find()->where(['=',$this->rightAttribute,$parent->{$this->rightAttribute}-1])->one();
        } else {
            return $owner->find()->where(['=',$this->depthAttribute,$owner->{$this->depthAttribute}])->orderBy($this->rightAttribute.' DESC')->one();
        }
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