<?php
namespace backend\themes\admin3;

use yii\base\Exception;
use yii\web\AssetBundle as BaseAdminLteAsset;

class Admin3Asset extends BaseAdminLteAsset
{
    public $sourcePath = '@backend/themes/admin3/assets';
    public $css = [
        'plugins/font-awesome/css/font-awesome.min.css',
        'dist/css/adminlte.min.css',
        'plugins/iCheck/flat/blue.css',
        'plugins/morris/morris.css',
        'plugins/jvectormap/jquery-jvectormap-1.2.2.css',
        'plugins/datepicker/datepicker3.css',
        'plugins/daterangepicker/daterangepicker-bs3.css',
        'plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css',
        'plugins/summernote/summernote-bs4.css',
        'https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css',
        'https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700'
    ];
    public $js = [
        //'plugins/jquery/jquery.min.js',
        'https://code.jquery.com/ui/1.12.1/jquery-ui.min.js',
        'plugins/bootstrap/js/bootstrap.bundle.min.js',
        'https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js',
        'plugins/morris/morris.min.js',
        'plugins/sparkline/jquery.sparkline.min.js',
        'plugins/jvectormap/jquery-jvectormap-1.2.2.min.js',
        'plugins/jvectormap/jquery-jvectormap-world-mill-en.js',
        'plugins/knob/jquery.knob.js',
        'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js',
        'plugins/daterangepicker/daterangepicker.js',
        'plugins/datepicker/bootstrap-datepicker.js',
        'plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js',
        'plugins/summernote/summernote-bs4.min.js',
        'plugins/slimScroll/jquery.slimscroll.min.js',
        'plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js',
        'plugins/fastclick/fastclick.js',
        'dist/js/adminlte.js',
        'dist/js/pages/dashboard.js',
        'dist/js/demo.js'
        
    ];
    public $depends = [
        //'rmrevin\yii\fontawesome\AssetBundle',
        'yii\web\YiiAsset',
        //'yii\bootstrap\BootstrapAsset',
        //'yii\bootstrap\BootstrapPluginAsset',
    ]; 
}
