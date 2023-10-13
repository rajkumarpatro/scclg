var THEMEMASCOT = {};
$(document).ready(function() {
    "use strict";


    var $document = $(document);
    var $document_body = $(document.body);
    var $window = $(window);
    var $html = $('html');
    var $body = $('body');
    var $wrapper = $('#wrapper');
    var $header = $('#header');
    var $footer = $('#footer');

    THEMEMASCOT.header = {

        init: function () {

            var t = setTimeout(function () {
                THEMEMASCOT.header.TM_fullscreenMenu();
                THEMEMASCOT.header.TM_sidePanelReveal();
                THEMEMASCOT.header.TM_scroolToTopOnClick();
                THEMEMASCOT.header.TM_scrollToFixed();
                THEMEMASCOT.header.TM_topnavAnimate();
                THEMEMASCOT.header.TM_scrolltoTarget();
                THEMEMASCOT.header.TM_menuzord();
                THEMEMASCOT.header.TM_navLocalScorll();
                THEMEMASCOT.header.TM_menuCollapseOnClick();
                THEMEMASCOT.header.TM_homeParallaxFadeEffect();
                THEMEMASCOT.header.TM_topsearch_toggle();
            }, 0);

        },

        TM_scroolToTop: function () {
            //alert('Helllo');
            if ($window.scrollTop() > 600) {
                $('.scrollToTop').fadeIn();
            } else {
                $('.scrollToTop').fadeOut();
            }
        },

        TM_scroolToTopOnClick: function () {
            $document_body.on('click', '.scrollToTop', function (e) {
                $('html, body').animate({
                    scrollTop: 0
                }, 800);
                return false;
            });
        },

        TM_scrollToFixed: function () {
            $('.navbar-scrolltofixed').scrollToFixed();
            $('.scrolltofixed').scrollToFixed({
                marginTop: $('.header .header-nav').outerHeight(true) + 10,
                limit: function () {
                    var limit = $('#footer').offset().top - $(this).outerHeight(true);
                    return limit;
                }
            });
            $('#sidebar').scrollToFixed({
                marginTop: $('.header .header-nav').outerHeight() + 20,
                limit: function () {
                    var limit = $('#footer').offset().top - $('#sidebar').outerHeight() - 20;
                    return limit;
                }
            });
        }
    };

    THEMEMASCOT.documentOnReady = {
        init: function () {         
            THEMEMASCOT.windowOnscroll.init();
        }
    };

    THEMEMASCOT.windowOnscroll = {
        init: function () {
            $window.on('scroll', function () {
                THEMEMASCOT.header.TM_scroolToTop();
                THEMEMASCOT.header.TM_activateMenuItemOnReach();
                THEMEMASCOT.header.TM_topnavAnimate();
            });
        }
    };

    $document.ready(
      THEMEMASCOT.documentOnReady.init
  );

    var i = ($(window).height(), $(window).width()),
        e = 767,
        a = {
            initialized: !1,
            initialize: function() {
                function a() {
                    f.easyPieChart({
                        barColor: !1,
                        trackColor: !1,
                        scaleColor: !1,
                        scaleLength: !1,
                        lineCap: !1,
                        lineWidth: !1,
                        size: !1,
                        animate: 7e3,
                        onStep: function(i, e, a) {
                            $(this.el).find(".percent").text(Math.round(a))
                        }
                    })
                }
                if (!this.initialized) {
                    this.initialized = !0, this.build();
                    var t = $("#page-preloader"),
                        n = t.find(".spinner-loader");
                    n.fadeOut(), t.delay(50).fadeOut("slow");
                    var s = $("#sliderpro1");
                    if (s.length > 0 && s.sliderPro({
                            width: 2e3,
                            height: 650,
                            fade: !0,
                            arrows: !0,
                            buttons: !1,
                            waitForLayers: !1,
                            thumbnailPointer: !1,
                            touchSwipe: !1,
                            autoplay: !0,
                            autoScaleLayers: !0
                        }), $(".section-parallax").each(function() {
                            var i = $(this);
                            $(window).scroll(function() {
                                var e = -($(window).scrollTop() / i.data("speed")),
                                    a = "center " + e + "px";
                                i.css({
                                    backgroundPosition: a
                                })
                            })
                        }), i > e) {
                        var o = $(".layout-theme"),
                            l = o.data("header"),
                            d = o.data("header-top");
                        l.length && $(window).on("scroll", function() {
                            var i = $(window).scrollTop(),
                                e = $(".header");
                                if(i>d){
                                    $("#header-img").hide();
                                }
                                else{
                                    $("#header-img").show();                                    
                                }
                            i > d ? e.addClass("bounce animated animation-done sticky") : e.removeClass("bounce animated animation-done sticky")
                        })
                    }
                    $(".dropdown").hover(function() {
                        $(".dropdown-menu", this).stop(!0, !0).slideDown("fast"), $(this).toggleClass("open")
                    }, function() {
                        $(".dropdown-menu", this).stop(!0, !0).slideUp("fast"), $(this).toggleClass("open")
                    }), $(".yamm .navbar-nav>li").hover(function() {
                        $(".dropdown-menu", this).fadeIn("fast")
                    }, function() {
                        $(".dropdown-menu", this).fadeOut("fast")
                    }), window.prettyPrint && prettyPrint(), $(document).on("click", ".yamm .dropdown-menu", function(i) {
                        i.stopPropagation()
                    });
                    var r = $(".isotope-filter");
                    r.imagesLoaded(function() {
                        r.isotope({
                            itemSelector: ".isotope-item"
                        })
                    }), $("#filter a").on("click", function(i) {
                        var e = $(this).attr("data-filter");
                        return r.isotope({
                            filter: e
                        }), !1
                    });
                    var f = $(".chart");
                    $("body").length && $(window).on("scroll", function() {
                        $(window).scrollTop();
                        $(".list-progress").waypoint(function() {
                            f.each(function() {
                                a()
                            })
                        }, {
                            offset: "80%"
                        })
                    }), $("#search-open, #search-close").on("click", function(i) {
                        i.preventDefault();
                        var e = $(".header-search ");
                        e.toggleClass("open-search"), e.toggleClass("open")
                    }), $(".jelect").jelect(), $("a[rel^='prettyPhoto']").prettyPhoto({
                        animation_speed: "normal",
                        theme: "light_square",
                        slideshow: 3e3
                    }), $(".btn-collapse").on("click", function() {
                        $(this).parents(".panel-group").children(".panel").removeClass("panel-default"), $(this).parents(".panel").addClass("panel-default"), $(this).is(".collapsed") ? $(".panel-title").removeClass("panel-passive") : $(this).next().toggleClass("panel-passive")
                    })
                }
            },
            build: function() {
                this.initOwlCarousel()
            },
            initOwlCarousel: function(i) {
                function e(i) {
                    var e = i,
                        a = e.data("after-move-delay"),
                        t = e.data("main-text-animation");
                    t && setTimeout(function() {
                        $(".main-slider_zoomIn").css("visibility", "visible").addClass("zoomIn"), $(".main-slider_slideInUp").css("visibility", "visible").addClass("slideInUp"), $(".main-slider_fadeInLeft").css("visibility", "visible").addClass("fadeInLeft"), $(".main-slider_fadeInRight").css("visibility", "visible").addClass("fadeInRight"), $(".main-slider_fadeInLeftBig").css("visibility", "visible").addClass("fadeInLeftBig"), $(".main-slider_fadeInRightBig").css("visibility", "visible").addClass("fadeInRightBig")
                    }, a)
                }
                $(".enable-owl-carousel").each(function(i) {
                    var a = $(this),
                        t = a.data("items"),
                        n = a.data("navigation"),
                        s = a.data("pagination"),
                        o = a.data("single-item"),
                        l = a.data("auto-play"),
                        d = a.data("transition-style"),
                        r = a.data("main-text-animation"),
                        f = a.data("after-init-delay"),
                        c = a.data("stop-on-hover"),
                        m = a.data("min480"),
                        h = a.data("min768"),
                        p = a.data("min992"),
                        v = a.data("min1200");
                    a.owlCarousel({
                        navigation: n,
                        pagination: s,
                        singleItem: o,
                        autoPlay: l,
                        transitionStyle: d,
                        stopOnHover: c,
                        navigationText: ["<i></i>", "<i></i>"],
                        items: t,
                        itemsCustom: [
                            [0, 1],
                            [465, m],
                            [750, h],
                            [975, p],
                            [1185, v]
                        ],
                        afterInit: function(i) {
                            r && setTimeout(function() {
                                $(".main-slider_zoomIn").css("visibility", "visible").removeClass("zoomIn").addClass("zoomIn"), $(".main-slider_fadeInLeft").css("visibility", "visible").removeClass("fadeInLeft").addClass("fadeInLeft"), $(".main-slider_fadeInLeftBig").css("visibility", "visible").removeClass("fadeInLeftBig").addClass("fadeInLeftBig"), $(".main-slider_fadeInRightBig").css("visibility", "visible").removeClass("fadeInRightBig").addClass("fadeInRightBig")
                            }, f)
                        },
                        beforeMove: function(i) {
                            r && ($(".main-slider_zoomIn").css("visibility", "hidden").removeClass("zoomIn"), $(".main-slider_slideInUp").css("visibility", "hidden").removeClass("slideInUp"), $(".main-slider_fadeInLeft").css("visibility", "hidden").removeClass("fadeInLeft"), $(".main-slider_fadeInRight").css("visibility", "hidden").removeClass("fadeInRight"), $(".main-slider_fadeInLeftBig").css("visibility", "hidden").removeClass("fadeInLeftBig"), $(".main-slider_fadeInRightBig").css("visibility", "hidden").removeClass("fadeInRightBig"))
                        },
                        afterMove: e,
                        afterUpdate: e
                    })
                })
            }
        };
    a.initialize()
}), (new WOW).init();