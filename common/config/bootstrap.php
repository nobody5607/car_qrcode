<?php

Yii::setAlias('common', dirname(__DIR__));
Yii::setAlias('frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('storage', dirname(dirname(__DIR__)) . '/storage');



// Url Aliases
Yii::setAlias('@frontendUrl', 'http://shop.local');
Yii::setAlias('@backendUrl', 'http://backend.shop.local');
Yii::setAlias('@storageUrl', 'http://storage.shop.local');
