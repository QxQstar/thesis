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
        'signin':'./src/user/js/signin.js'
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
                test:/\.(png|jpg|jpge)$/,
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