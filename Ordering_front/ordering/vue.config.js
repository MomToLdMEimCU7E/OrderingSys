const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave:false,
  devServer: {
    proxy:{
      '/api':{
        target: 'http://localhost:9090',
        ws: true,
        changeOrigin: true
      }
    }
  }
})