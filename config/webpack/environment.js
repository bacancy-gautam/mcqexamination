const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Cocoon: ['Cocoon.js', 'default'],
    Popper: ['popper.js', 'default']
  })
)
module.exports = environment

