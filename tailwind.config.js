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

  // daisyUI config (optional - here are the default values)
  daisyui: {
    themes: ["valentine"],
    darkTheme: "retro",
    base: true,
    styled: true,
    utils: true,
    prefix: "",
    logs: true,
    themeRoot: ":root",
  },
}