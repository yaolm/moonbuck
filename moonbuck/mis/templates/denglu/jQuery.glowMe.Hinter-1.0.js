/*
 * jQuery glowMe Hinter: A glowing twitter-like textbox hinter
 *
 * Copyright 2011 Alan Fall & Digital Grief (http://www.digital-grief.com)
 * (alan@digital-grief.com)
 * 
 * Changelog:
 * 1.0
 * First release.
 * 
 * Released under the MIT & GPL licenses
 *
*/


(function ($) {

  $.fn.glowMe = function (options) {
    $.fn.glowMe.defaults = {

      hintColor: '#5F5F5F',
      // Hint color
      borderColor: '#ccc',
      // Border Color
      bgColor: '#eee',
      // Background Color
      bgHoverSpeed: 650,
      // Mouseover transition speed
      bgHoverOutSpeed: 300,
      // Mouseleave transition speed
      bgHoverEase: "swing",
      // Mouseover ease type
      bgHoverOutEase: "linear",
      // Mouseleave ease type
      hoverFontColor: "#000",
      // Color of the font when the input box is focused
      glowThickness: "10px",
      // Thickness of the glow effect(CSS3: box-shadow)
      glowColor: "#D4D4D4" // Color of the glow(CSS3: box-shadow)
    };

    options = $.extend($.fn.glowMe.defaults, options);

    return this.each(function () {

      var focused = false;
      var x = $(this);
      var opera_check = $.browser.opera ? opera_check = true : opera_check = false;

      x.data('dval', x.val()).css({
        'outline': 'none',
        'color': options.hintColor,
        'border': '1px solid ' + options.borderColor
      }).data('dback', x.css('background-color'))

      .hover(function () {

        x.stop(true, true).animate({
          backgroundColor: options.bgColor
        }, options.bgHoverSpeed, options.bgHoverEase)

      }, function () {

        if (focused == true) {
          x.animate({
            backgroundColor: options.bgColor
          }, options.bgHoverSpeed, options.bgHoverEase)
        } else {

          x.stop(true, false).animate({
            backgroundColor: x.data('dback')
          }, options.bgHoverOutSpeed, options.hoverOutEase);
        }
      })

      .focus(function () {
        focused = true;

        x.css({
          '-webkit-box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
          '-o-box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
          '-moz-box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
          '-ms-box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
          '-khtml-box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
          'box-shadow': '0px 0px ' + options.glowThickness + options.glowColor,
        }).data('dcolor', x.css('color')).css('color', options.hoverFontColor).data('default', x.attr("title").toLowerCase())
        if (opera_check == false && focused == true) {
          x.animate({
            backgroundColor: options.bgColor
          }, options.bgHoverSpeed, options.bgHoverEase).css('background-color', options.bgColor)
		  .css('background-color', options.bgColor); // In case jQuery Color Animation is not loaded.
        } else {

          x.css('background-color', options.bgColor);

        }
      }).keypress(function (event) {

        if (x.val().toLowerCase() == x.data('default') || "") {
          x.val("");
        }

      }).blur(function () {
        focused = false;
        if (opera_check == false) {
          x.animate({
            backgroundColor: x.data('dback')
          }, options.bgHoverOutSpeed, options.hoverOutEase)
			.css('background-color', x.data('dback')); // In case jQuery Color Animation is not loaded.
        } else {

          x.css('background-color', x.data('dback'));
        }

        x.css({
          '-moz-box-shadow': 'none',
          '-o-box-shadow': 'none',
          '-webkit-box-shadow': 'none',
          '-ms-box-shadow': 'none',
          '-khtml-box-shadow': 'none',
          'box-shadow': 'none',
          'color': x.data('dcolor')
        })

        if (x.val() == "") {
          x.val(x.data('dval'));
        }
      });
    });
  }

})(jQuery);