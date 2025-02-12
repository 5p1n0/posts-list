// config/webpack/webpack.config.js
const { generateWebpackConfig, merge } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

const vueConfig = require('./rules/vue')

module.exports = merge(vueConfig, webpackConfig)