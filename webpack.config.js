/**
 * Created by star on 2017/3/5.
 */
var webpack = require('webpack');
var extractTextWebpack = require('extract-text-webpack-plugin');
module.exports = {
    entry:{
        'common':'./src/common/js/common.js',
        'index':'./src/user/js/index.js',
        'zpDetail':'./src/user/js/zpDetail.js',
        'signin':'./src/user/js/signin.js',
        'upload':'./src/user/js/upload.js',
        'signup':'./src/user/js/signup.js',
        'adminSignup':'./src/user/js/adminSignup.js',
        'addActive':'./src/user/js/addActive.js',
        'setMessage':'./src/user/js/setMessage.js',
        'systemAdmin':'./src/user/js/systemAdmin.js',
        'verify':'./src/user/js/verify.js',
        'adminSignin':'./src/user/js/adminSignin.js',
        'adminDesSignin':'./src/user/js/adminDesSignin.js',
        'zpList':'./src/user/js/zpList.js',
        'userCenter':'./src/user/js/userCenter.js',
        'userManage':'./src/user/js/userManage.js',
        'activeList':'./src/user/js/activeList.js',
        'notes':'./src/user/js/notes.js',
        'production':'./src/user/js/production.js',
        'desiginerList':'./src/user/js/desiginerList.js',
        'activeDetail':'./src/user/js/activeDetail.js',
        'jQuery':['jquery']
    },
    output:{
        path:'./src/user/build/',
        filename:'js/[name].js',
        publicPath:'../',
        library:'jQuery',
        libraryTarget:'umd'
    },
    module:{
        loaders:[
            {
                test:/\.css/,
                loader:extractTextWebpack.extract({
                    fallback:'style-loader',
                    use:'css-loader'
                })
            },
            //{
            //    test: /\.(jpg|png|gif)$/,
            //    loader: 'file-loader'
            //},
            {
                test:/\.(png|jpg|jpge|woff|svg|eot|ttf)$/,
                loader:'url-loader?limit=5000&name=img/[name].[ext]'
            }
        ]
    },
    plugins:[
        new extractTextWebpack({
            filename:'css/[name].css',
            disable:false,
            allChunks:true
        }),
        //new webpack.optimize.UglifyJsPlugin({
        //    compress: {
        //        warnings: false
        //    }
        //}),
        new webpack.optimize.CommonsChunkPlugin({
            name:'jQuery',
            filename:'js/jquery.js'
        })
    ]
};