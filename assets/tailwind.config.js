/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      './js/**/*.js',
      '../lib/*_web.ex',
      '../lib/*_web/**/*.*ex',
    ],
    theme: {
    colors: {
        "light-beige": "#FAFAF5", 
        "white": "#ffffff",
        "gold": "#d4af37",
        "black": "#000000",
    },
      extend: {},
    },
    plugins: [],
  }