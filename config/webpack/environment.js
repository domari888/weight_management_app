const { environment } = require('@rails/webpacker')
// jQuery を Bootstrap 以外でも使用する
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProgressPlugin({
    $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment
