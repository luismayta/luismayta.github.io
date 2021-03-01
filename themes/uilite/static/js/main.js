/*
 *=================================
 * Hugo UILite Portfolio v0.8
 *=================================
 *
 * Free version https://uicard.io/products/hugo-uilite
 * Pro version https://uicard.io/products/hugo-uilite-pro
 * Demo https://demo.uicard.io/hugo-uilite-portfolio-demo/
 *
 * Coded By UICardio
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 */

let menuBtn = $('#menuBar')

menuBtn.click(function () {
  $('.hamburger-menu').toggleClass('animate')

  if ($('.secondaryMenu').hasClass('active')) {
    $('.secondaryMenu').removeClass('active')
    setTimeout(function () {
      $('.primaryMenu').addClass('active')
    }, 400)
  } else {
    $('.primaryMenu').removeClass('active')

    setTimeout(function () {
      $('.secondaryMenu').addClass('active')
    }, 350)
  }
})

$(document).ready(function () {
  var elements = $('.sidebar > .main-info *')

  for (let i = 0; i < elements.length; i++) {
    setTimeout(function () {
      $(elements[i].tagName).addClass('bs')
    }, 400 * i - 90 * i)
  }

  setTimeout(function () {
    $('.main-content').addClass('active')
  }, 1900)
})

$('[data-toggle="tooltip"]').tooltip()
