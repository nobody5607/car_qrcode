<?php

namespace backend\components;

use Yii;
use yii\base\Component;
use yii\web\UnauthorizedHttpException;

class AppComponent extends Component {
    
    public function init() {
        parent::init(); 
        $params = \backend\modules\core\classes\CoreQuery::getOptionsParams();
        \Yii::$app->params = \yii\helpers\ArrayHelper::merge(\Yii::$app->params, $params);
        //\appxq\sdii\utils\VarDumper::dump($params);
    }
    public static function navbarLeft() {
        $moduleId = (isset(Yii::$app->controller->module->id) && Yii::$app->controller->module->id != 'app-backend') ? Yii::$app->controller->module->id : '';
        $controllerId = isset(Yii::$app->controller->id) ? Yii::$app->controller->id : '';
        $actionId = isset(Yii::$app->controller->action->id) ? Yii::$app->controller->action->id : '';
        $viewId = \Yii::$app->request->get('id', '');
         
        $navbar = [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => \Yii::t('appmenu','Home'), 'icon' => 'home', 'url' => ['/']],
                    ['label' => \Yii::t('appmenu','About'), 'icon' => '', 'url' => ['/site/about']],
                    ['label' => \Yii::t('appmenu','Contact'), 'icon' => '', 'url' => ['/site/contact']],
                    ['label' => \Yii::t('appmenu','Informations'), 'icon' => '', 'url' => ['/informations']],
                    
                    [
                        'label' => Yii::t('appmenu','Member Management'), 
                        'icon' => 'users', 'url' => ['/user/admin/index'],
                        'visible' => \Yii::$app->user->can('admin')
                    ],
                    [
                        'label' => Yii::t('appmenu', 'System Config'),
                        'visible' => \Yii::$app->user->can('admin'),
                        'icon' => 'cog',
                        'url' => '#',
                        'items' => [
                            [
                                'label' => Yii::t('appmenu', 'Authentication'),
                                'active'=>($moduleId == 'admin'),
                                'icon' => 'cogs',
                                'url' => '#',
                                'items' => [
                                    //Assignments
                                    ['label' => Yii::t('appmenu', 'Assignments'), 'icon' => 'circle-o', 'url' => ['/admin'],'active'=>($moduleId == 'admin' && $controllerId == 'assignment'),],
                                    ['label' => Yii::t('appmenu', 'Role'), 'icon' => 'circle-o', 'url' => ['/admin/role'],'active'=>($moduleId == 'admin' && $controllerId == 'role')],
                                    ['label' => Yii::t('appmenu', 'Route'), 'icon' => 'circle-o', 'url' => ['/admin/route'],'active'=>($moduleId == 'admin' && $controllerId == 'route')],
                                    ['label' => Yii::t('appmenu', 'Permission'), 'icon' => 'circle-o', 'url' => ['/admin/permission'],'active'=>($moduleId == 'admin' && $controllerId == 'permission')],
                                ],
                            ],
                            [
                            'label' => Yii::t('appmenu', 'Tools'),
                            'icon' => 'share',
                            'url' => '#',
                            'items' => [
                                //options
                                ['label' => Yii::t('appmenu','Options'), 'icon' => 'cog', 'url' => ['/options'],],
                                ['label' => Yii::t('appmenu','Gii'), 'icon' => 'file-code-o', 'url' => ['/gii'],],
                                ['label' => Yii::t('appmenu','Debug'), 'icon' => 'dashboard', 'url' => ['/debug'],]
                            ],
                        ],
                    ],
                    ],
                ],
            ];
        return $navbar;
    }
    
    
}
