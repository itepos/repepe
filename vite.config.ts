import { defineConfig } from 'vite'
import svgLoader from 'vite-svg-loader'

// Configuração customizada do Vite para Slidev
// vite-svg-loader é necessário para o tema Penguin carregar ícones SVG
export default defineConfig({
  plugins: [svgLoader()],
})
