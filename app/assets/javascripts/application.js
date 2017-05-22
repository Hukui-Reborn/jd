// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap

//= require_tree .


$(document).ready(function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below
    $(this).removeClass("btn-default").addClass("btn-primary");
});
});



$(document).delegate(".toggleBtn", "click", function(e) {
            e.preventDefault();
            var t = $(this)
              , n = t.parent().siblings(".topicFold")
              , r = n.find(".fold")
              , i = t.find(".fa");
            n.toggleClass("topic-content-fold"),
            t.toggleClass("opened"),
            r.toggle(),
            i.hasClass(" fa-chevron-circle-down") ? i.removeClass("fa-chevron-circle-down").addClass("fa-chevron-circle-up") : i.removeClass("fa-chevron-circle-up").addClass("fa-chevron-circle-down")
        });
        var A = $(".topicIntroduction");
        for (var O = 0; O < A.length; O++) {
            var M = $(A[O])
              , _ = M.height()
              , D = M.parent()
              , P = D.height()
              , H = D.find(".fold")
              , B = D.siblings(".toggleBtn");
            _ <= P ? H.toggle() : B.css({
                visibility: "visible"
            })
        }
        var j = $(".tutorAvatar").find("img").attr("src")
          , F = $(".aboutTutor").find("img")
          , I = ["http:" + j]
          , q = $.trim($(".topicTitle").eq(0).text())
          , R = $(".topicTitle")
          , U = "我在行："
          , z = location.protocol + "//" + location.host + "/mentor/" + tutor.id
          , W = $.trim($("#tutorTitle").text())
          , X = []
          , V = []
          , J = ""
          , K = "";
        for (var O = 0, Q = F.length; O < Q; O++)
            I[O + 1] = "http:" + F[O].getAttribute("src");
        V.push({
            tag: "shareTutor",
            bdText: tutor.realname,
            bdDesc: tutor.realname,
            bdUrl: z,
            bdPic: I,
            onBeforeClick: function(e, t) {
                return e === "tsina" && (t.bdText = q + "【" + tutor.realname + "，" + W + "】（分享自@在行：领先的知识技能共享平台，找创业职场心理咨询摄影师上在行。）",
                t.bdPic = I.join("||"),
                t.bdUrl += r.parameter({
                    utm_source: "weibo",
                    utm_medium: "web",
                    utm_campaign: "mentor"
                })),
                t
            },
            bdSnsKey: {
                tsina: "1814846457"
            }
        }),

        $(".shareTopic").each(function(e) {
            var t = $(this).attr("data-tag")
              , n = $.trim(R.eq(e).text());
            $(".shareTopic").length > 1 ? U += e + 1 + "." + $.trim(R.eq(e).text()) + "；" : U += $.trim(R.eq(e).text()) + "；",
            X.push(t),
            V.push({
                tag: t,
                bdText: tutor.realname,
                bdDesc: tutor.realname,
                bdUrl: z + "/topic/" + t,
                bdPic: I,
                onBeforeClick: function(t, n) {
                    return t === "tsina" && (n.bdText = $.trim(R.eq(e).text()) + "【" + tutor.realname + "，" + W + "】（分享自@在行：领先的知识技能共享平台，找创业职场心理咨询摄影师上在行。）",
                    n.bdPic = I.join("||"),
                    n.bdUrl += r.parameter({
                        utm_source: "weibo",
                        utm_medium: "web",
                        utm_campaign: "topic"
                    })),
                    n
                },
                bdSnsKey: {
                    tsina: "1814846457"
                }
            })
        });
        var G = location.pathname.split("/");
        X.indexOf(G[G.length - 2]) > -1 ? (J = "【在行】" + q,
        U = tutor.realname + "（" + W + "）",
        $(".toggleBtn").eq(0).trigger("click"),
        K = "topic") : (J = "【在行名片】" + tutor.realname + "（" + tutor.summary + "）",
        U = U.slice(0, U.length - 1).slice(0, 115),
        K = "mentor"),
        window._bd_share_config = {
            share: V
        },
