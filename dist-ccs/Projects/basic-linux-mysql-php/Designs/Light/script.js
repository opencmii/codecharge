jQuery.fn.outerHTML = function(s) {
	"use strict";
	return s ? this.before(s).remove() : jQuery("<p>").append(this.eq(0).clone()).html();
};
jQuery(function ($) {
    "use strict";
    fixInputs('checkbox', 'checkbox');
    fixInputs('radio', 'radiobutton');
});

function fixInputs(type, className) {
    "use strict";
    jQuery('input[type="' + type + '"]').each(function () {
        var cur = jQuery(this);
        var parent = cur.parent();
        if (cur.parent('label').length > 0) {
            parent.toggleClass(className);
        } else {
            var siblingLabel = cur.siblings('label[for="' + cur.attr('id') + '"]');
            var label = jQuery('label[for="' + cur.attr('id') + '"]');
            if (label.length > 0 && label.css("display") !== "none" && siblingLabel.length == 0) {
                label.toggleClass("label-" + type);
            }
            label = jQuery('<label/>').insertAfter(cur);
            if (siblingLabel.length > 0) {
                label.attr('for', cur.attr('id'));
                label.append(jQuery(siblingLabel[0]).text());
                siblingLabel.remove();
            }
            label.append(cur);
            label.toggleClass(className);
        }
    });
}

/* Created by Artisteer v4.1.0.60473 */
/*jshint forin:true, noarg:true, noempty:true, eqeqeq:true, bitwise:true, strict:true, undef:true, curly:false, browser:true, jquery:false */
/*global jQuery BackgroundHelper */

// css helper
browser = function ($) {
    'use strict';
    var data = [
        { str: navigator.userAgent, sub: 'Chrome', ver: 'Chrome', name: 'chrome' },
        { str: navigator.vendor, sub: 'Apple', ver: 'Version', name: 'safari' },
        { prop: window.opera, ver: 'Opera', name: 'opera' },
        { str: navigator.userAgent, sub: 'Firefox', ver: 'Firefox', name: 'firefox' },
        { str: navigator.userAgent, sub: 'MSIE', ver: 'MSIE', name: 'ie' }
    ];
    var v = function (s, n) {
        var i = s.indexOf(data[n].ver);
        return (i !== -1) ? parseFloat(s.substring(i + data[n].ver.length + 1)) : 0;
    };
    var result = { name: 'unknown', version: 0 };
    var html = $('html');
    for (var n = 0; n < data.length; n++) {
        result[data[n].name] = false;
        if ((data[n].str && (data[n].str.indexOf(data[n].sub) !== -1)) || data[n].prop) {
            result.name = data[n].name;
            result[result.name] = true;
            result.version = v(navigator.userAgent, n) || v(navigator.appVersion, n);
            html.addClass(result.name + ' ' + result.name + parseInt(result.version, 10));
        }
    }
    return result;
} (jQuery);

jQuery(function ($) {
    if (typeof responsiveDesign === "undefined") {
        $("html").addClass("desktop");
    }
});

jQuery(function ($) {
    'use strict';
    var i, j, k, l, m;
    if (!browser.ie || browser.version !== 9) {
        return;
    }
    var splitByTokens = function (str, startToken, endToken, last) {
        if (!last) {
            last = false;
        }
        var startPos = str.indexOf(startToken);
        if (startPos !== -1) {
            startPos += startToken.length;
            var endPos = last ? str.lastIndexOf(endToken) : str.indexOf(endToken, startPos);

            if (endPos !== -1 && endPos > startPos) {
                return str.substr(startPos, endPos - startPos);
            }
        }
        return '';
    };

    var splitWithBrackets = function (str, token, brackets) {
        /*jshint nonstandard:true */
        if (!token) {
            token = ',';
        }
        if (!brackets) {
            brackets = '()';
        }
        var bracket = 0;
        var startPos = 0;
        var result = [];
        if (brackets.lenght < 2) {
            return result;
        }
        var pos = 0;
        while (pos < str.length) {
            var ch = str[pos];
            if (ch === brackets[0]) {
                bracket++;
            }
            if (ch === brackets[1]) {
                bracket--;
            }
            if (ch === token && bracket < 1) {
                result.push(str.substr(startPos, pos - startPos));
                startPos = pos + token.length;
            }
            pos++;
        }
        result.push(str.substr(startPos, pos - startPos));
        return result;
    };

    var byteToHex = function (d) {
        var hex = Number(d).toString(16);
        while (hex.length < 2) {
            hex = "0" + hex;
        }
        return hex;
    };

    for (i = 0; i < document.styleSheets.length; i++) {
        var s = document.styleSheets[i];
        var r = [s];
        for (j = 0; j < s.imports.length; j++) {
            r.push(s.imports[j]);
        }
        for (j = 0; j < r.length; j++) {
            s = r[j];
            var n = [];
            for (k = 0; k < s.rules.length; k++) {
                var css = s.rules[k].cssText || s.rules[k].style.cssText;
                if (!css) {
                    continue;
                }
                var value = splitByTokens(css, '-svg-background:', ';');
                if (value === '') {
                    continue;
                }
                var values = splitWithBrackets(value);
                for (l = 0; l < values.length; l++) {
                    var g = splitByTokens(values[l], 'linear-gradient(', ')', true);
                    if (g === '') {
                        continue;
                    }
                    var args = splitWithBrackets(g);
                    if (args.length < 3) {
                        continue;
                    }
                    var maxOffset = 0;
                    var stops = [];
                    for (m = 1; m < args.length; m++) {
                        var stopValues = splitWithBrackets($.trim(args[m]), ' ');
                        if (stopValues.length < 2) {
                            continue;
                        }
                        var stopColor = $.trim(stopValues[0]);
                        var stopOpacity = 1;
                        if (stopColor == 'transparent') {
                            stopColor = '#000000';
                            stopOpacity = 0;
                        }
                        var colorRgba = splitByTokens(stopColor, 'rgba(', ')', true);
                        var stopOffset = $.trim(stopValues[1]);
                        if (colorRgba !== "") {
                            var rgba = colorRgba.split(',');
                            if (rgba.length < 4) {
                                continue;
                            }
                            stopColor = '#' + byteToHex(rgba[0]) + byteToHex(rgba[1]) + byteToHex(rgba[2]);
                            stopOpacity = rgba[3];
                        }
                        var isPx = stopOffset.indexOf('px') !== -1;
                        if (isPx) {
                            maxOffset = Math.max(maxOffset, parseInt(stopOffset, 10) || 0);
                        }
                        stops.push({ offset: stopOffset, color: stopColor, opacity: stopOpacity, isPx: isPx });
                    }
                    var stopsXML = '';
                    var lastStop = null;
                    for (m = 0; m < stops.length; m++) {
                        if (stops[m].isPx) {
                            stops[m].offset = ((parseInt(stops[m].offset, 10) || 0) / (maxOffset / 100)) + '%';
                        }
                        stopsXML += '<stop offset="' + stops[m].offset + '" stop-color="' + stops[m].color + '" stop-opacity="' + stops[m].opacity + '"/>';
                        if (m === stops.length - 1) {
                            lastStop = stops[m];
                        }
                    }
                    var isLeft = $.trim(args[0]) === 'left';
                    var direction = 'x1="0%" y1="0%" ' + (isLeft ? 'x2="100%" y2="0%"' : 'x2="0%" y2="100%"');
                    var gradientLength = '100%';
                    if (maxOffset > 0) {
                        gradientLength = maxOffset + 'px';
                    }
                    var size = (isLeft ? 'width="' + gradientLength + '" height="100%"' : 'width="100%" height="' + gradientLength + '"');
                    var last = "";
                    if (lastStop !== null && maxOffset > 0) {
                        last = '<rect ' +
                            (isLeft ?
                                'x="' + maxOffset + '" y="0"' :
                                'x="0" y="' + maxOffset + '"') +
                            ' width="100%" height="100%" style="fill:' + lastStop.color + ';opacity:' + lastStop.opacity + ';"/>';

                    }
                    var svgGradient = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"><linearGradient id="g" gradientUnits="objectBoundingBox" ' + direction + '>' + stopsXML + '</linearGradient><rect x="0" y="0" ' + size + ' fill="url(#g)" />' + last + '</svg>';
                    values[l] = values[l].replace('linear-gradient(' + g + ')', 'url(data:image/svg+xml,' + escape(svgGradient) + ')');
                }
                n.push({ s: s.rules[k].selectorText, v: 'background: ' + values.join(",") });
            }
            for (k = 0; k < n.length; k++) {
                s.addRule(n[k].s, n[k].v);
            }
        }
    }
});

jQuery(function ($) {
    'use strict';
    // ie < 9 slider multiple background fix
    if (!browser.ie || browser.version > 8) return;
    
    function split(str) {
        str = str.replace(/"/g, '').replace(/%20/g, '');
        return  str.split(/\s*,\s*/);
    }

    $('.slider .slide-item').each(function () {
        var bgs = split($(this).css('background-image'));
        // needs to use the last image
        if (bgs.length > 1) {
            $(this).css("background-image", bgs[bgs.length - 1]);
        }
    });
});

jQuery(function ($) {
    "use strict";
    // ie8
    if (!browser.ie || browser.version > 8) return;
    $('.shapes').css('z-index', 1);
    
    // ie7
    if (!browser.ie || browser.version > 7) return;
    var textblockTexts = $('.textblock div[class$="-text"]');
    textblockTexts.each(function () {
        var tbText = $(this);
        var valign = tbText.css('vertical-align') ? tbText.css('vertical-align') : 'top';
        if (valign === 'middle') {
            var wrapper = tbText.wrap('<div/>').parent();
            tbText.css({
                'position': 'relative',
                'top': '-50%',
                'height': 'auto'
            });
            wrapper.css({
                'position': 'absolute',
                'top': '50%'
            });
        } else if (valign === 'bottom') {
            tbText.css({
                'position': 'absolute',
                'height': 'auto',
                'bottom': 0
            });
        }
    });
});

/* Set wmode=transparent for youtube and other video hostings to show it under the menus, lightboxes etc. */
jQuery(function ($) {
    "use strict";
    var video = ["youtube"];

    $("iframe[src]").each(function () {
        var iframe = $(this),
            src = iframe.attr("src"),
            isVideo = false,
            i;

        for (i = 0; i < video.length; i++) {
            if (src.toLowerCase().indexOf(video[i].toLowerCase()) !== -1) {
                isVideo = true;
                break;
            }
        }

        if (!isVideo) {
            return;
        }

        if (src.lastIndexOf("?") !== -1) {
            src += "&amp;wmode=transparent";
        } else {
            src += "?wmode=transparent";
        }
        iframe.attr("src", src);
    });
});

jQuery(function ($) {
    "use strict";
    $(window).bind("resize", function () { navigatorResizeHandler($("html").hasClass("responsive")); });
});

var navigatorResizeHandler = (function ($) {
    "use strict";
    return function (responsiveDesign) {
        if (responsiveDesign) return;
        $(".slider").each(function () {
            var slider = $(this);
            var sliderWidth = slider.width();
            var nav = slider.siblings(".slidenavigator");
            if (nav.length) {
                // left offset
                var left = nav.attr("data-left");
                // (margin = containerWidth - (objectPosition + objectWidth)) < 0
                var margin = sliderWidth - sliderWidth * parseFloat(left) / 100 - nav.outerWidth(false);
                if (margin < 0) {
                    nav.css("margin-left", margin);
                }
            }
        });
    };
})(jQuery);

var processElementMultiplyBg = (function($) {
    return (function(selector, info) {
        if (!selector || !info || !info.bgimage || !info.bgposition || !info.images || !info.positions) return;
        var el = $(selector);
        var bgimages = info.images.split(",");
        var bgpositions = info.positions.split(",");
        for (var i = bgimages.length - 1; i >= 0; i--) {
            var bgimage = $.trim(bgimages[i]);
            if (bgimage === "")
                continue;
            el.append("<div style=\"position:absolute;top:0;left:0;width:100%;height:100%;background:" + bgimage + " " + bgpositions[i] + " no-repeat\">");
        }
        el.css('background-image', info.bgimage);
        el.css('background-position', info.bgposition);
    });
})(jQuery);

jQuery(function($) {
    "use strict";
     $(window).bind("resize", function () {
        /*global responsiveDesign */
        "use strict";
        if (typeof responsiveDesign !== "undefined" && responsiveDesign.isResponsive)
            return;
        var sheetLeft = $(".sheet").offset().left;
        $("header.header #flash-area").each(function () {
            var object = $(this);
            object.css("left", sheetLeft + "px");
        });
    });
});

jQuery(function($) {
    "use strict";
    $('nav.nav').addClass("desktop-nav");
});


jQuery(function ($) {
    "use strict";
    if (!browser.ie || browser.version > 7) {
        return;
    }
    $('ul.hmenu>li:not(:first-child)').each(function () { $(this).prepend('<span class="hmenu-separator"> </span>'); });
});

jQuery(function ($) {
    "use strict";
    $("ul.hmenu a:not([href])").attr('href', '#').click(function (e) { e.preventDefault(); });
});


jQuery(function ($) {
    "use strict";
    if (!browser.ie || browser.version > 7) {
        return;
    }

    /* Fix width of submenu items.
    * The width of submenu item calculated incorrectly in IE6-7. IE6 has wider items, IE7 display items like stairs.
    */
    $.each($("ul.hmenu ul"), function () {
        var maxSubitemWidth = 0;
        var submenu = $(this);
        var subitem = null;
        $.each(submenu.children("li").children("a"), function () {
            subitem = $(this);
            var subitemWidth = subitem.outerWidth(false);
            if (maxSubitemWidth < subitemWidth) {
                maxSubitemWidth = subitemWidth;
            }
        });
        if (subitem !== null) {
            var subitemBorderLeft = parseInt(subitem.css("border-left-width"), 10) || 0;
            var subitemBorderRight = parseInt(subitem.css("border-right-width"), 10) || 0;
            var subitemPaddingLeft = parseInt(subitem.css("padding-left"), 10) || 0;
            var subitemPaddingRight = parseInt(subitem.css("padding-right"), 10) || 0;
            maxSubitemWidth -= subitemBorderLeft + subitemBorderRight + subitemPaddingLeft + subitemPaddingRight;
            submenu.children("li").children("a").css("width", maxSubitemWidth + "px");
        }
    });
});
jQuery(function () {
    "use strict";
    setHMenuOpenDirection({
        container: "div.sheet",
        defaultContainer: "#main",
        menuClass: "hmenu",
        leftToRightClass: "hmenu-left-to-right",
        rightToLeftClass: "hmenu-right-to-left"
    });
});

var setHMenuOpenDirection = (function ($) {
    "use strict";
    return (function(menuInfo) {
        var defaultContainer = $(menuInfo.defaultContainer);
        defaultContainer = defaultContainer.length > 0 ? defaultContainer = $(defaultContainer[0]) : null;

        $("ul." + menuInfo.menuClass + ">li>ul").each(function () {
            var submenu = $(this);

            var submenuWidth = submenu.outerWidth(false);
            var submenuLeft = submenu.offset().left;

            var mainContainer = submenu.parents(menuInfo.container);
            mainContainer = mainContainer.length > 0 ? mainContainer = $(mainContainer[0]) : null;

            var container = mainContainer || defaultContainer;
            if (container !== null) {
                var containerLeft = container.offset().left;
                var containerWidth = container.outerWidth(false);

                if (submenuLeft + submenuWidth >= containerLeft + containerWidth) {
                    /* right to left */
                    submenu.addClass(menuInfo.rightToLeftClass).find("ul").addClass(menuInfo.rightToLeftClass);
                } else if (submenuLeft <= containerLeft) {
                    /* left to right */
                    submenu.addClass(menuInfo.leftToRightClass).find("ul").addClass(menuInfo.leftToRightClass);
                }
            }
        });
    });
})(jQuery);

jQuery(function ($) {
    $("ul.hmenu ul li").hover(function () { $(this).prev().children("a").addClass("hmenu-before-hovered"); }, 
        function () { $(this).prev().children("a").removeClass("hmenu-before-hovered"); });
});

jQuery(function ($) {
    'use strict';

    if (browser.ie && browser.version < 8) {
        $(window).bind('resize', function() {
            var c = $('div.content');
            var s = c.parent().children('.layout-cell:not(.content)');
            var w = 0;
            c.hide();
            s.each(function() { w += $(this).outerWidth(true); });
            c.w = c.parent().width(); c.css('width', c.w - w + 'px');
            c.show();
        });
    }

    $(window).trigger('resize');
});

jQuery(function($) {
    "use strict";
    if (!$('html').hasClass('ie7')) {
        return;
    }
    $('ul.vmenu li:not(:first-child),ul.vmenu li li li:first-child,ul.vmenu>li>ul').each(function () { $(this).append('<div class="vmenu-separator"> </div><div class="vmenu-separator-bg"> </div>'); });
});



var artButtonSetup = (function ($) {
    'use strict';
    return (function (className) {
        $.each($("a." + className + ", button." + className + ", input." + className), function (i, val) {
            var b = $(val);
            if (!b.hasClass('button')) {
                b.addClass('button');
            }
            if (b.is('input')) {
                b.val(b.val().replace(/^\s*/, '')).css('zoom', '1');
            }
            b.mousedown(function () {
                var b = $(this);
                b.addClass("active");
            });
            b.mouseup(function () {
                var b = $(this);
                if (b.hasClass('active')) {
                    b.removeClass('active');
                }
            });
            b.mouseleave(function () {
                var b = $(this);
                if (b.hasClass('active')) {
                    b.removeClass('active');
                }
            });
        });
    });
})(jQuery);
jQuery(function () {
    'use strict';
    artButtonSetup("button");
});

jQuery(function($) {
    'use strict';
    $('input.search-button, form.search input[type="submit"]').attr('value', '');
});

var Control = (function ($) {
    'use strict';
    return (function () {
        this.init = function(label, type, callback) {
            var chAttr = label.find('input[type="' +type + '"]').attr('checked');
            if (chAttr === 'checked') {
              label.addClass('checked');
            }

            label.mouseleave(function () {
              $(this).removeClass('hovered').removeClass('active');
            });
            label.mouseover(function () {
              $(this).addClass('hovered').removeClass('active');
            });
            label.mousedown(function (event) {
              if (event.which !== 1) {
                  return;
              }
              $(this).addClass('active').removeClass('hovered');
            });
            label.mouseup(function (event) {
              if (event.which !== 1) {
                  return;
              }
              callback.apply(this);
              $(this).removeClass('active').addClass('hovered');
            });
        };
    });
})(jQuery);


jQuery(function ($) {
    'use strict';
    $('.pager').contents().filter(
        function () {
            return this.nodeType === this.TEXT_NODE;
        }
    ).remove();
});
var fixRssIconLineHeight = (function ($) {
    "use strict";
    return function (className) {
        $("." + className).css("line-height", $("." + className).height() + "px");
    };
})(jQuery);

jQuery(function ($) {
    "use strict";
    var rssIcons = $(".rss-tag-icon");
    if (rssIcons.length){
        fixRssIconLineHeight("rss-tag-icon");
        if (browser.ie && browser.version < 9) {
            rssIcons.each(function () {
                if ($.trim($(this).html()) === "") {
                    $(this).css("vertical-align", "middle");
                }
            });
        }
    }
});
var ThemeLightbox = (function ($) {
    'use strict';
    return (function () {
        var images = $(".lightbox");
        var current;
        this.init = function (ctrl) {
            $(".lightbox").mouseup({ _ctrl: ctrl }, function (e) {
                if ((e.data._ctrl === true && !e.ctrlKey) || (e.which && e.which !== 1)) {
                    return;
                }

                images = $(".lightbox");

                current = images.index(this);

                var imgContainer = $('.lightbox-wrapper');
                if (imgContainer.length === 0) {
                    imgContainer = $('<div class="lightbox-wrapper">').css('line-height', $(window).height() + "px")
                    .appendTo($("body"));

                    var closeBtn = $('<div class="close"><div class="cw"> </div><div class="ccw"> </div><div class="close-alt">&#10007;</div></div>')
                .click(close);
                    closeBtn.appendTo(imgContainer);
                    showArrows();
                }

                move(current);
            });
        };

        function move(index) {
            if (index < 0 || index >= images.length) {
                return;
            }

            showError(false);

            current = index;

            $(".lightbox-wrapper .lightbox-image:not(.active)").remove();

            var active = $(".lightbox-wrapper .active");
            var target = $('<img class="lightbox-image" alt="" src="' + getFullImgSrc($(images[current]).attr("src")) + '" />').click(function () {
                if ($(this).hasClass("active")) {
                    move(current + 1);
                }
            });

            if (active.length > 0) {
                active.after(target);
            } else {
                $(".lightbox-wrapper").append(target);
            }

            showArrows();
            showLoader(true);

            bindMouse($(".lightbox-wrapper").add(target));

            target.load(function () {
                showLoader(false);

                active.removeClass("active");
                target.addClass("active");
            });

            target.error(function () {
                showLoader(false);
                active.removeClass("active");
                target.addClass("active");
                target.attr("src", $(images[current]).attr("src"));
            });
        }

        function showArrows() {
            if ($(".lightbox-wrapper .arrow").length === 0) {
                $(".lightbox-wrapper").append(
                    $('<div class="arrow left"><div class="arrow-t ccw"> </div><div class="arrow-b cw"> </div><div class="arrow-left-alt">&#8592;</div></div>')
                        .css("top", $(window).height() / 2 - 40)
                        .click(function () {
                            if (!$(this).hasClass("disabled")) {
                                move(current - 1);
                            }
                        })
                );
                $(".lightbox-wrapper").append(
                    $('<div class="arrow right"><div class="arrow-t cw"> </div><div class="arrow-b ccw"> </div><div class="arrow-right-alt">&#8594;</div></div>')
                        .css("top", $(window).height() / 2 - 40)
                        .click(function () {
                            if (!$(this).hasClass("disabled")) {
                                move(current + 1);
                            }
                        })
                );
            }

            if (current === 0) {
                $(".lightbox-wrapper .arrow.left").addClass("disabled");
            } else {
                $(".lightbox-wrapper .arrow.left").removeClass("disabled");
            }

            if (current === images.length - 1) {
                $(".lightbox-wrapper .arrow.right").addClass("disabled");
            } else {
                $(".lightbox-wrapper .arrow.right").removeClass("disabled");
            }
        }

        function showError(enable) {
            if (enable) {
                $(".lightbox-wrapper").append($('<div class="lightbox-error">The requested content cannot be loaded.<br/>Please try again later.</div>')
                        .css({ "top": $(window).height() / 2 - 60, "left": $(window).width() / 2 - 170 }));
            } else {
                $(".lightbox-wrapper .lightbox-error").remove();
            }
        }

        function showLoader(enable) {
            if (!enable) {
                $(".lightbox-wrapper .loading").remove();
            }
            else {
                $('<div class="loading"> </div>').css({ "top": $(window).height() / 2 - 16, "left": $(window).width() / 2 - 16 }).appendTo($(".lightbox-wrapper"));
            }
        }

        var close = function () {
            $(".lightbox-wrapper").remove();
        };

        function bindMouse(img) {
            img.bind('mousewheel DOMMouseScroll', function (e) {
                var orgEvent = window.event || e.originalEvent;
                var delta = (orgEvent.wheelDelta ? orgEvent.wheelDelta : orgEvent.detail * -1) > 0 ? 1 : -1;
                move(current + delta);
                e.preventDefault();
            }).mousedown(function (e) {
                // close on middle button click
                if (e.which === 2) {
                    close();
                }
                e.preventDefault();
            });
        }

        function getFullImgSrc(src) {
            var fileName = src.substring(0, src.lastIndexOf('.'));
            var ext = src.substring(src.lastIndexOf('.'));
            return fileName + "-large" + ext;
        }

    });
})(jQuery);

jQuery(function () {
    'use strict';
    new ThemeLightbox().init();
});

(function($) {
    'use strict';
    // transition && transitionEnd && browser prefix
    $.support.transition = (function() {
        var thisBody = document.body || document.documentElement,
            thisStyle = thisBody.style,
            support = thisStyle.transition !== undefined ||
                thisStyle.WebkitTransition !== undefined ||
                thisStyle.MozTransition !== undefined ||
                thisStyle.MsTransition !== undefined ||
                thisStyle.OTransition !== undefined;
        return support && {
            event: (function() {
                return "webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend";
            })(),
            prefix: (function() {
                return ({
                        opera: "-o-",
                        firefox: "-moz-",
                        chrome: "-webkit-",
                        safari: "-webkit-",
                        ie: "-ms-"
                    }[browser.name]);
            })()
        };
    })();

    window.BackgroundHelper = function () {
        var slides = [];
        var direction = "next";
        var motion = "horizontal";
        var width = 0;
        var height = 0;
        var multiplier = 1;
        var transitionDuration = "";

        this.init = function(motionType, dir, duration) {
            direction = dir;
            motion = motionType;
            slides = [];
            width = 0;
            height = 0;
            multiplier = 1;
            transitionDuration = duration;
        };

        this.processSlide = function(element, modify) {
            this.updateSize(element, null);
            var pos = [];

            var bgPosition = element.css("background-position");
            var positions = bgPosition.split(",");
            $.each(positions, function (i) {
                var position = $.trim(this);
                var point = position.split(" ");
                if (point.length > 1) {
                    var x = point[0].indexOf('%') === -1 ? parseInt(point[0], 10) : 0;
                    var y = point[1].indexOf('%') === -1 ? parseInt(point[1], 10) : 0;
                    pos.push({ x: x, y: y });
                }
            });

            slides.push({
                "images": element.css("background-image"),
                "sizes": element.css("background-size"),
                "positions": pos
            });
            
            if (modify)
                element.css("background-image", "none");
        };
        
        this.updateSize = function (element, initialSize) {
            width = element.outerWidth(false);
            height = element.outerHeight();
            if (initialSize && parseInt(initialSize.width, 10) !== 0) {
                multiplier = width / initialSize.width;
                if (motion === "fade") {
                    $.each(element.children(), function (i) {
                        $(this).css("background-position", getCssPositions(slides[i].positions, { x: 0, y: 0 }));
                    });
                }
            }
        };

        this.setBackground = function(element, items) {
            var bg = [];
            var sizes = [];
            $.each(items, function (i, o) {
                bg.push(o.images);
                sizes.push(o.sizes);
            });
            element.css({
                "background-image": bg.join(", "),
                "background-size": sizes.join(", "),
                "background-repeat": "no-repeat"
            });
        };

        this.setPosition = function(element, items) {
            var pos = [];
            $.each(items, function(i, o) {
                pos.push(o.positions);
            });
            element.css({
                "background-position": pos.join(", ")
            });
        };

        this.current = function(index) {
            return slides[index] || null;
        };

        this.next = function(index) {
            var next;
            if (direction === "next") {
                next = (index + 1) % slides.length;
            } else {
                next = index - 1;
                if (next < 0) {
                    next = slides.length - 1;
                }
            }
            return slides[next];
        };

        this.items = function(prev, next, move) {
            var prevItem = { x: 0, y: 0 };
            var nextItem = { x: 0, y: 0 };
            var isDirectionNext = direction === "next";
            if (motion === "horizontal") {
                nextItem.x = isDirectionNext ? width : -width;
                nextItem.y = 0;
                if (move) {
                    prevItem.x += isDirectionNext ? -width : width;
                    nextItem.x += isDirectionNext ? -width : width;
                }
            } else if (motion === "vertical") {
                nextItem.x = 0;
                nextItem.y = isDirectionNext ? height : -height;
                if (move) {
                    prevItem.y += isDirectionNext ? -height : height;
                    nextItem.y += isDirectionNext ? -height : height;
                }
            }
            var result = [ ];
            if (!!prev) {
                result.push({ images: prev.images, positions: getCssPositions(prev.positions, prevItem), sizes: prev.sizes });
            }
            if (!!next) {
                result.push({ images: next.images, positions: getCssPositions(next.positions, nextItem), sizes: next.sizes });
            }
            
            if (direction === "next") {
                result.reverse();
            }

            return result;
        };

        this.transition = function(container, on) {
            container.css($.support.transition.prefix + "transition", on ? transitionDuration + " ease-in-out background-position" : "");
        };
        
        function getCssPositions(positions, offset) {
            var result = [];
            if (positions === undefined) {
                return "";
            }
            offset.x = offset.x || 0;
            offset.y = offset.y || 0;
            for (var i = 0; i < positions.length; i++) {
                result.push((positions[i].x * multiplier + offset.x) + "px " + (positions[i].y * multiplier + offset.y) + "px");
            }
            return result.join(", ");
        }
    };


    var Slider = function (element, settings) {

        var interval = null;
        var active = false;
        var children = element.find(".active").parent().children();
        var last = false;
        var running = false;

        this.settings = $.extend({ }, {
            "animation": "horizontal",
            "direction": "next",
            "speed": 600,
            "pause": 2500,
            "auto": true,
            "repeat": true,
            "navigator": null,
            "clickevents": true,
            "hover": true,
            "helper": null
        }, settings);

        this.move = function (direction, next) {
            var activeItem = element.find(".active"),
                nextItem = next || activeItem[direction](),
                innerDirection = this.settings.direction === "next" ? "forward" : "back",
                reset = direction === "next" ? "first" : "last",
                moving = interval,
                slider = this, tmp;

            active = true;

            if (moving) { this.stop(true); }

            if (!nextItem.length) {
                nextItem = element.find(".slide-item")[reset]();
                if (!this.settings.repeat) { last = true; active = false; return; }
            }

            if ($.support.transition) {
                nextItem.addClass(this.settings.direction);
                tmp = nextItem.get(0).offsetHeight;
                
                activeItem.addClass(innerDirection);
                nextItem.addClass(innerDirection);
                
                element.trigger("beforeSlide", children.length);
                
                element.one($.support.transition.event, function () {
                    nextItem.removeClass(slider.settings.direction)
                        .removeClass(innerDirection)
                        .addClass("active");
                    activeItem.removeClass("active")
                        .removeClass(innerDirection);
                    active = false;
                    setTimeout(function () {
                        element.trigger("afterSlide", children.length);
                    }, 0);
                });
            } else {
                element.trigger("beforeSlide", children.length);
                
                activeItem.removeClass("active");
                nextItem.addClass("active");
                active = false;
                
                element.trigger("afterSlide", children.length);
            }

            this.navigate(nextItem);

            if (moving) { this.start(); }
        };

        this.navigate = function (position) {
            var index = children.index(position);
            $(this.settings.navigator).children().removeClass("active").eq(index).addClass("active");
        };

        this.to = function (index) {
            var activeItem = element.find(".active"),
                children = activeItem.parent().children(),
                activeIndex = children.index(activeItem),
                slider = this;

            if (index > (children.length - 1) || index < 0) {
                return;
            }

            if (active) {
                return element.one("afterSlide", function () {
                    slider.to(index);
                });
            }
            
            if (activeIndex === index) {
                return;
            }

            this.move(index > activeIndex ? "next" : "prev", $(children[index]));
        };

        this.next = function () {
            if (!active) {
                if (last) { this.stop(); return;  }
                this.move("next");
            }
        };

        this.prev = function () {
            if (!active) {
                if (last) { this.stop(); return; }
                this.move("prev");
            }
        };

        this.start = function (force) {
            if (!!force) {
                setTimeout($.proxy(this.next, this), 10);
            }
            interval = setInterval($.proxy(this.next, this), this.settings.pause);
            running = true;
        };

        this.stop = function (pause) {
            clearInterval(interval);
            interval = null;
            running = !!pause;
            active = false;
        };

        this.active = function () {
            return running;
        };

        this.moving = function () {
            return active;
        };
        
        this.navigate(children.filter(".active"));

        if (this.settings.clickevents) {
            $(this.settings.navigator).on("click", "a", { slider: this }, function (event) {
                var activeIndex = children.index(children.filter(".active"));
                var index = $(this).parent().children().index($(this));
                if (activeIndex !== index) {
                    event.data.slider.to(index);
                }
                event.preventDefault();
            });
        }
        
        if (this.settings.hover) {
            var slider = this;
            element.add(this.settings.navigator)
                   .add(element.siblings(".shapes")).hover(function () {
                if (element.is(":visible") && !last) { slider.stop(true); }
            }, function () {
                if (element.is(":visible") && !last) { slider.start(); }
            });
        }
    };

    $.fn.slider = function (arg) {
        return this.each(function () {
            var element = $(this),
                data = element.data("slider"),
                options = typeof arg === "object" && arg;

            if (!data) {
                data = new Slider(element, options);
                element.data("slider", data);
            }
            
            if (typeof arg === "string" && data[arg]) {
                data[arg]();
            } else if (data.settings.auto && element.is(":visible")) {
                data.start();
            }
        });
    };

})(jQuery);




if (typeof window.resizeData === 'undefined') window.resizeData = {};

resizeData['headline'] = {
   responsive: [
                  { left: 0.61, top: 0.06, visible: true }, 
                  { left: 0.61, top: 0.06, visible: true }, 
                  { left: 0.61, top: 0.06, visible: true }, 
                  { left: 0.61, top: 0.06, visible: true }, 
                  { left: 0.61, top: 0.06, visible: true }, 
               ],
   area: {
       x: 0,
       y: 0
   },
   width: 144,
   height: 35,
   autoWidth: true};

resizeData['slogan'] = {
   responsive: [
                  { left: 0.61, top: 0.26, visible: true }, 
                  { left: 0.61, top: 0.26, visible: true }, 
                  { left: 0.61, top: 0.26, visible: true }, 
                  { left: 0.61, top: 0.26, visible: true }, 
                  { left: 0.61, top: 0.26, visible: true }, 
               ],
   area: {
       x: 0,
       y: 0
   },
   width: 99,
   height: 17,
   autoWidth: true};

// used to apply compicated values in style like '!important!
function applyCss(object, param, value) {
    var rg = new RegExp(param + '\s*:\s*.*;', "i");
    var style = object.attr('style');
    var str = param + ': ' + value + ';';
    if (rg.test(style)) {
        style = style.replace(rg, str);
    }
    else {
        style += '; ' + str;
    }

    object.attr('style', style);
}

// convert universal coord to pixels
function uniToPx(uni, size, parentSize) {
    uni = parseFloat(uni || '0');
    if (uni < 0) {
        uni = uni * size;
    } else if (uni >= 1) {
        uni = parentSize - (2 - uni) * size;
    } else {
        uni = uni * (parentSize - size);
    }

    return uni;
}

var headerObjectResizer = {
            defaultResponsive: true, // use default or custom responsive with script reposition
    

    resize: (function ($) {
        'use strict';
        return function () {
            var responsiveType = 0;
            // if we don't use full custom responsive so we MUST cleanup all styles
            var cleanUpStyles = false;
            // when use default respo so while in desktop mode always use 0-type, in other case cleanup our styles
            if (headerObjectResizer.defaultResponsive) {
                if (typeof responsiveDesign === 'undefined' || responsiveDesign.isResponsive) {
                    cleanUpStyles = true;
                }
            } else if (typeof responsiveDesign !== 'undefined') {
                if (responsiveDesign.responsiveType === 'tabletlandscape') {
                    responsiveType = 1;
                } else if (responsiveDesign.responsiveType === 'tabletportrait') {
                    responsiveType = 2;
                } else if (responsiveDesign.responsiveType === 'phonelandscape') {
                    responsiveType = 3;
                } else if (responsiveDesign.responsiveType === 'phoneportrait') {
                    responsiveType = 4;
                }
            }
            var sheet = $('.sheet');
            var sheetWidth = sheet.width();

            var header = $('header');
            var height = 0;

            var sheetLeft = 0;
            if (headerObjectResizer.isPageWidthInPage) sheetLeft = sheet.offset().left;

            // move html shapes
            $('header.header .shapes>*, header.header .textblock, header.header>.headline, header.header>.slogan, header.header>.positioncontrol, header.header>.logo').each(function () {
                var object = $(this);
                height = object.parent().height();

                var cls = object.attr('class').split(' ');
                $.each(cls, function (key, val) {
                    val = $.trim(val);
                    if (val.length === 0) return;
                    if (val.indexOf('') !== 0) return;

                    val = val.substring(4);
                    var data = resizeData[ val ];
                    if (typeof data === 'undefined') return;

                    if (cleanUpStyles) {
                        object.css('display', '');
                        object.css('left', '');
                        object.css('margin-left', '');
                        return false;
                    }

                    var respData = data.responsive[ responsiveType ];
                    if (!respData.visible) {
                        object.css('display', 'none');
                        return false;
                    }

                    var x = uniToPx(respData.left, data.autoWidth ? object.width() : data.width, sheetWidth);
                    x += sheetLeft + data.area.x;

                    var y = uniToPx(respData.top, data.height, height);
                    y += data.area.y;

                    object.css('left', x + 'px');
                    object.css('top', y + 'px');
                    applyCss(object, 'margin-left', '0px !important');
                    return false;
                });
            });

            // move images in slide's background-images
            var slides = $('.slide-item').add(header);
            $.each(slides, function (slideIdx, slide) {
                slide = $(slide);
                var bgImage = slide.css('background-image') ? slide.css('background-image').split(',') : [];
                var bgPosition = slide.css('background-position') ? slide.css('background-position').split(',') : [];
                if (bgImage.length !== bgPosition.length) return;

                if (cleanUpStyles) {
                    slide.css('background-position', '');
                    return;
                }

                height = slide.height();
                if (height === 0) height = slide.parent().height();

                $.each(bgImage, function (idx, val) {
                    var findImageIdx = val.lastIndexOf('Images/');
                    var findDotIdx = val.lastIndexOf('.');
                    if (findImageIdx === -1 || findDotIdx === -1) return;

                    var name = val.substring(findImageIdx + 7, findDotIdx);

                    var data = resizeData[ name ];
                    if (typeof data === 'undefined') return;

                    var respData = data.responsive[ responsiveType ];
                    // big default coordinates for hiding
                    var x = 9999, y = 9999;
                    if (respData.visible) {
                        x = uniToPx(respData.left, data.width, sheetWidth);
                        x += data.area.x;

                        y = uniToPx(respData.top, data.height, height);
                    }

                    bgPosition[ idx ] = x + 'px ' + y + 'px';
                });

                slide.css('background-position', bgPosition.join(','));
            });

        };
    })(jQuery),

    initialize: function ($) {
        $(window).bind('responsiveResize', this.resize);
        $(window).trigger('resize', this);
    }
};

headerObjectResizer.initialize(jQuery);

jQuery(function ($) {
    "use strict";
    if (!browser.ie || browser.version > 8)
        return;
    processElementMultiplyBg(".header", {
        "bgimage": "url('Images/header.png')",
        "bgposition": "0 0",
        "images": "",
        "positions": ""
    });
});
if (typeof window.resizeData === 'undefined') window.resizeData = {};

jQuery(function ($) {
    "use strict";
    if (!browser.ie || browser.version > 8)
        return;
    processElementMultiplyBg(".header", {
        "bgimage": "",
        "bgposition": "",
        "images": "",
        "positions": ""
    });
});

var winOnLoad = window.onload;
window.onload = null;


var artEventHelper = {
    'bind': function (obj, evt, fn) {
        "use strict";
        if (obj.addEventListener) {
            obj.addEventListener(evt, fn, false);
        }
        else if (obj.attachEvent) {
            obj.attachEvent('on' + evt, fn);
        }
        else {
            obj['on' + evt] = fn;
        }
    }
};

var userAgent = navigator.userAgent.toLowerCase();
var browser = {
    version: (userAgent.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
    safari: /webkit/.test(userAgent) && !/chrome/.test(userAgent),
    chrome: /chrome/.test(userAgent),
    opera: /opera/.test(userAgent),
    msie: /msie/.test(userAgent) && !/opera/.test(userAgent),
    mozilla: /mozilla/.test(userAgent) && !/(compatible|webkit)/.test(userAgent)
};

var artLoadEvent = (function () {
    "use strict";
    var list = [];

    var done = false;
    var ready = function () {
        if (done) {
            return;
        }
        done = true;
        for (var i = 0; i < list.length; i++) {
            list[i]();
        }
    };

    if (document.addEventListener && !browser.opera) {
        document.addEventListener('DOMContentLoaded', ready, false);
    }

    if (browser.msie && window === top) {
        (function ieFixWork() {
            try {
                document.documentElement.doScroll('left');
            } catch (e) {
                setTimeout(ieFixWork, 10);
                return;
            }
            ready();
        })();
    }

    if (browser.opera) {
        document.addEventListener('DOMContentLoaded', function operaDOMLoader() {
            for (var i = 0; i < document.styleSheets.length; i++) {
                if (document.styleSheets[i].disabled) {
                    setTimeout(operaDOMLoader, 10);
                    return;
                }
            }
            ready();
        }, false);
    }

    if (browser.safari) {
        var numStyles;
        (function safariDOMLoader() {
            if (document.readyState !== 'loaded' && document.readyState !== 'complete') {
                setTimeout(safariDOMLoader, 10);
                return;
            }
            if ('undefined' === typeof numStyles) {
                numStyles = document.getElementsByTagName('style').length;
                var links = document.getElementsByTagName('link');
                for (var i = 0; i < links.length; i++) {
                    numStyles += (links[i].getAttribute('rel') === 'stylesheet') ? 1 : 0;
                }
                if (document.styleSheets.length !== numStyles) {
                    setTimeout(safariDOMLoader, 0);
                    return;
                }
            }
            ready();
        })();
    }

    artEventHelper.bind(window, 'load', ready);

    return ({
        add: function (f) {
            list.push(f);
        }
    });
})();

(function () {
    // fix ie blinking
    "use strict";
    var m = document.uniqueID && document.compatMode && !window.XMLHttpRequest && document.execCommand;
    try { if (!!m) { m("BackgroundImageCache", false, true); } }
    catch (oh) { }
})();

function xGetElementsByClassName(clsName, parentEle, tagName) {
    "use strict";
    var elements = null;
    var found = [];
    var s = String.fromCharCode(92);
    var re = new RegExp('(?:^|' + s + 's+)' + clsName + '(?:$|' + s + 's+)');
    if (!parentEle) {
        parentEle = document;
    }
    if (!tagName) {
        tagName = '*';
    }
    elements = parentEle.getElementsByTagName(tagName);
    if (elements) {
        for (var i = 0; i < elements.length; ++i) {
            if (elements[i].className.search(re) !== -1) {
                found[found.length] = elements[i];
            }
        }
    }
    return found;
}

var styleUrlCached = null;
function GetStyleUrl() {
    "use strict";
    if (null === styleUrlCached) {
        var ns;
        styleUrlCached = '';
        ns = document.getElementsByTagName('link');
        for (var i = 0; i < ns.length; i++) {
            var l = ns[i];
            if (l.href && /style\.css(\?.*)?$/.test(l.href)) {
                styleUrlCached = l.href.replace(/style\.css(\?.*)?$/, '');
                return styleUrlCached;
            }
        }

        ns = document.getElementsByTagName('style');
        for (var j = 0; j < ns.length; j++) {
            var matches = new RegExp('import\\s+"([^"]+\\/)style\\.css"').exec(ns[j].innerHTML);
            if (null !== matches && matches.length > 0) {
                styleUrlCached = matches[1];
                return styleUrlCached;
            }
        }
    }
    return styleUrlCached;
}

function fixPNG(element) {
    "use strict";
    if (/MSIE (5\.5|6).+Win/.test(navigator.userAgent)) {
        var src;
        if (element.tagName === 'IMG') {
            if (/\.png$/.test(element.src)) {
                src = element.src;
                element.src = new GetStyleUrl() + "Images/Spacer.gif";
            }
        }
        else {
            src = element.currentStyle.backgroundImage.match(/url\("(.+\.png)"\)/i);
            if (src) {
                src = src[1];
                element.runtimeStyle.backgroundImage = "none";
            }
        }
        if (src) {
            element.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "')";
        }
    }
}

function artHasClass(el, cls) {
    "use strict";
    return (el && el.className && (' ' + el.className + ' ').indexOf(' ' + cls + ' ') !== -1);
} /* end Page */


function artButtonsSetupJsHover(className, parent) {
    "use strict";
    if (!parent) {
        parent = document;
    }
    var tags = ["input", "a", "button"];
    for (var j = 0; j < tags.length; j++) {
        var buttons = xGetElementsByClassName(className, parent, tags[j]);
        for (var i = 0; i < buttons.length; i++) {
            var button = buttons[i];
            if (!button.tagName || !button.parentNode) {
                return;
            }
            if (!artHasClass(button.parentNode, 'button-wrapper')) {
                if (!artHasClass(button, 'button')) {
                    button.className += ' button';
                }
                var wrapper = document.createElement('span');
                wrapper.className = "button-wrapper";
                if (artHasClass(button, 'active')) {
                    wrapper.className += ' active';
                }
                var spanL = document.createElement('span');
                spanL.className = "button-l";
                spanL.innerHTML = " ";
                wrapper.appendChild(spanL);
                var spanR = document.createElement('span');
                spanR.className = "button-r";
                spanR.innerHTML = " ";
                wrapper.appendChild(spanR);
                button.parentNode.insertBefore(wrapper, button);
                wrapper.appendChild(button);
            }
            artEventHelper.bind(button, 'mouseover', mouseOver);
            artEventHelper.bind(button, 'mouseout', mouseOut);
            artEventHelper.bind(button, 'mousedown', mouseDown);
            artEventHelper.bind(button, 'mouseup', mouseUp);
            if (button.tagName.toLowerCase() === "input" && (browser.chrome || browser.mozilla)) {
                button.style.margin = "0 -3px";
            }
        }
    }
    function mouseOver(e) {
        e = e || window.event;
        wrapper = (e.target || e.srcElement).parentNode;
        wrapper.className += " hover";
    }
    function mouseOut(e) {
        e = e || window.event;
        button = e.target || e.srcElement;
        wrapper = button.parentNode;
        wrapper.className = wrapper.className.replace(/hover/, "");
        if (!artHasClass(button, 'active')) {
            wrapper.className = wrapper.className.replace(/active/, "");
        }
    }
    function mouseDown(e) {
        e = e || window.event;
        button = e.target || e.srcElement;
        wrapper = button.parentNode;
        if (!artHasClass(button, 'active')) {
            wrapper.className += " active";
        }
    }
    function mouseUp(e) {
        e = e || window.event;
        button = e.target || e.srcElement;
        wrapper = button.parentNode;
        if (!artHasClass(button, 'active')) {
            wrapper.className = wrapper.className.replace(/active/, "");
        }
    }
}




artLoadEvent.add(function () { 
    "use strict";
    artButtonsSetupJsHover("Button"); 
});

artLoadEvent.add(function () {
    "use strict";
    if (typeof window.AjaxPanelEvents === "undefined") {
        window.AjaxPanelEvents = [];
    }
    window.AjaxPanelEvents.push({
        eventName: "afterUpdate",
        func: function (updatePanel) {
            artButtonsSetupJsHover("Button", updatePanel);
        }
    });

    if (jQuery('body').ccsBind) {
        jQuery('body').ccsBind(function () {
            artButtonsSetupJsHover("Button");
        });
    }
});

artLoadEvent.add(function () {
    "use strict";
    // select all tables with table class
    var tables = document.getElementsByTagName('table');
    var formTables = [];
    for (var i = 0; i < tables.length; i++) {
        var table = tables[i];
        if (-1 !== table.className.indexOf(' table') || -1 !== table.className.indexOf(' article')) {
            formTables[formTables.length] = table;
        }
    }
});

if (winOnLoad) {
    artLoadEvent.add(winOnLoad);
}

// menu

artLoadEvent.add(function () {
    "use strict";
    var uls = document.getElementsByTagName('ul');
    for (var i = 0; i < uls.length; i++) {
        var ul = uls[i];
        if (-1 !== ul.className.indexOf('menu')) {
            if (typeof ul.spansExtended === "undefined") {
                var temp = new ArtMenu_SpansSetup(ul);
                ul.spansExtended = true;
            }
        }
    }
});

function ArtMenu_GetElement(e, name) {
    "use strict";
    name = name.toLowerCase();
    for (var n = e.firstChild; null !== n; n = n.nextSibling) {
        if (1 === n.nodeType && name === n.nodeName.toLowerCase()) {
            return n;
        }
    }
    return null;
}

function ArtMenu_GetElements(e, name) {
    "use strict";
    name = name.toLowerCase();
    var elements = [];
    for (var n = e.firstChild; null !== n; n = n.nextSibling) {
        if (1 === n.nodeType && name === n.nodeName.toLowerCase()) {
            elements[elements.length] = n;
        }
    }
    return elements;
}

// isIncluded the same as in Functions.js if this script is used independently
function isIncluded(href1, href2) {
    "use strict";
    if (href1 === null || href2 === null) {
        return href1 === href2;
    }
    if (href1.indexOf("?") === -1 || href1.split("?")[1] === "") {
        return href1.split("?")[0] === href2.split("?")[0];
    }
    if (href2.indexOf("?") === -1 || href2.split("?")[1] === "") {
        return href1.replace("?", "") === href2.replace("?", "");
    }
    if (href1.split("?")[0] !== href2.split("?")[0]) {
        return false;
    }
    var params = href1.split("?")[1];
    params = params.split("&");
    var i, par1, par2, nv;
    par1 = [];
    for (i in params) {
        if (params.hasOwnProperty(i)) {
            if (typeof (params[i]) === "function") {
                continue;
            }
            nv = params[i].split("=");
            if (nv[0] !== "FormFilter") {
                par1[nv[0]] = nv[1];
            }
        }
    }
    params = href2.split("?")[1];
    params = params.split("&");
    par2 = [];
    for (i in params) {
        if (params.hasOwnProperty(i)) {
            if (typeof (params[i]) === "function") {
                continue;
            }
            nv = params[i].split("=");
            if (nv[0] !== "FormFilter") {
                par2[nv[0]] = nv[1];
            }
        }
    }
    /*if (par1.length !== par2.length)
    return false;*/
    for (i in par1) {
        if (par1[i] !== par2[i]) {
            return false;
        }
    }
    return true;
}

function ArtMenu_SpansSetup(menuUL) {
    "use strict";
    var menuULLI = ArtMenu_GetElements(menuUL, 'li');
    for (var i = 0; i < menuULLI.length; i++) {
        var li = menuULLI[i];
        if ('separator' === li.className) {
            continue;
        }
        var a = ArtMenu_GetElement(li, 'a');
        if (null === a) {
            continue;
        }
        if (isIncluded(a.href, window.location.href)) {
            a.className = 'active';
        }
        var spant = document.createElement('span');
        spant.className = 't';
        while (a.firstChild) {
            spant.appendChild(a.firstChild);
        }
        a.appendChild(document.createElement('span')).className = 'l';
        a.appendChild(document.createElement('span')).className = 'r';
        a.appendChild(spant);
    }
}

// set menu active link
jQuery(function () {
    "use strict";
    jQuery(".hmenu, .vmenu").find("a").each(function () {
        if (location.href.indexOf(this.href) > -1) {
            var a = jQuery(this);
            a.addClass("active");
            a.siblings('ul').addClass("active");
            a.parents('ul.vmenu ul').addClass('active');
            a.parents('ul.vmenu ul').siblings('a').addClass('active');
            a.parents('ul.hmenu ul').siblings('a').addClass('active');
        }

    });
});

// set vmenu active link
/* begin VMenu */
jQuery(function () {
    "use strict";
    if (!jQuery('html').hasClass('ie7')) {
        return;
    }
    jQuery('ul.vmenu li:not(:first-child),ul.vmenu li li li:first-child,ul.vmenu>li>ul').each(function () {
        jQuery(this).append('<div class="vmenu-separator"> </div><div class="vmenu-separator-bg"> </div>');
    });
});
/* end VMenu */

/* begin VMenuItem */
jQuery(function () {
    "use strict";
    jQuery('ul.vmenu a.submenu').click(function () {
        if (location.href.indexOf(this.href) > -1) {
            return false;
        }
        var a = jQuery(this);
        if (a.hasClass("active")) {
            return true;
        }
        a.parents('ul.vmenu').find("ul, a").removeClass('active');
        a.parent().children('ul').addClass('active');
        a.parents('ul.vmenu ul').addClass('active');
        a.parents('ul.vmenu li').children('a').addClass('active');
        return false;
    });
});
/* end VMenuItem */

/* Fix heading for components */
jQuery(function () {
    "use strict";
    var onUpdateHandler = function () {
        jQuery('.MainTable .Header').each(function () {
            jQuery('td.th', this).css('width', '100%');
            var headerText = jQuery('strong', this).text();
            jQuery('strong', this).replaceWith('<h2 class="postheader"><span class="postheadericon"></span>' + headerText + '</h2>');
            jQuery(this).attr('class', 'postmetadataheader');
        });
    };
    onUpdateHandler();
    if (typeof window.AjaxPanelEvents === "undefined") {
        window.AjaxPanelEvents = [];
    }
    window.AjaxPanelEvents.push({
        eventName: "afterUpdate",
        func: onUpdateHandler
    });
    if (jQuery('body').ccsBind) {
        jQuery('body').ccsBind(onUpdateHandler);
    }
});
/* end fix heading */

