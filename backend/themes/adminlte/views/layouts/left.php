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
                                'icon' => 'cogs',
                                'url' => '#',
                                'items' => [
                                    //Assignments
                                    ['label' => Yii::t('appmenu', 'Assignments'), 'icon' => 'circle-o', 'url' => ['/admin'],],
                                    ['label' => Yii::t('appmenu', 'Role'), 'icon' => 'circle-o', 'url' => ['/admin/role'],],
                                    ['label' => Yii::t('appmenu', 'Route'), 'icon' => 'circle-o', 'url' => ['/admin/route'],],
                                    ['label' => Yii::t('appmenu', 'Permission'), 'icon' => 'circle-o', 'url' => ['/admin/permission'],],
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
