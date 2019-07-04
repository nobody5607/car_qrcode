<?php 
    $moduleId = (isset(Yii::$app->controller->module->id) && Yii::$app->controller->module->id != 'app-backend') ? Yii::$app->controller->module->id : '';
    $controllerId = isset(Yii::$app->controller->id) ? Yii::$app->controller->id : '';
    $actionId = isset(Yii::$app->controller->action->id) ? Yii::$app->controller->action->id : '';
    $viewId = \Yii::$app->request->get('id', '');
?>
<aside class="main-sidebar" id="leftMenu">

    <section class="sidebar">
 

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => 'Home', 'icon' => 'home', 'url' => ['/']],
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
                                ['label' => Yii::t('appmenu','Gii'), 'icon' => 'file-code-o', 'url' => ['/gii'],],
                                ['label' => Yii::t('appmenu','Debug'), 'icon' => 'dashboard', 'url' => ['/debug'],]
                            ],
                        ],
                    ],
                    ],
                ],
            ]
        ) ?>

    </section>

</aside>
