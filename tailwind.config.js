module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],

  // add daisyUI plugin
  plugins: [
    require("daisyui"),
  ],
    theme: {
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        'pinku': '#fce7f3',
        'line': '#84cc16',
        'silver': '#C0C0C0', 
        'good': '#ec4899',
        'ungood': '#f8fafc',
      },
      backgroundImage: {
        'desktop1': "url('/assets/akasakura.png')",
        'mobile1': "url('/assets/mbakasakura.png')",
        'desktop2': "url('/assets/ume.png')",
        'mobile2': "url('/assets/mbsakura.png')",
      },
    },
   

  // daisyUI config (optional - here are the default values)
  daisyui: {
    themes: false, // false: only light + dark | true: all themes | array: specific themes like this ["light", "dark", "cupcake"]
    darkTheme: "dark", // name of one of the included themes for dark mode
    base: true, // applies background color and foreground color for root element by default
    styled: true, // include daisyUI colors and design decisions for all components
    utils: true, // adds responsive and modifier utility classes
    prefix: "", // prefix for daisyUI classnames (components, modifiers and responsive class names. Not colors)
    logs: true, // Shows info about daisyUI version and used config in the console when building your CSS
    themeRoot: ":root", // The element that receives theme color CSS variables
  },
}