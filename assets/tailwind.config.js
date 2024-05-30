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
        "gold": "#d4af37"
    },
      extend: {},
    },
    plugins: [],
  }