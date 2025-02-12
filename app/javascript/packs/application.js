import { createApp } from 'vue'
import App from '../app.vue'

const app = createApp(App)

document.addEventListener('DOMContentLoaded', () => {
  app.mount('body')
})