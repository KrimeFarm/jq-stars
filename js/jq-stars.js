(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    jqStars: function(options) {
      var log, settings;
      settings = {
        debug: false,
        round: 20,
        callback: function() {},
        callbefore: function() {}
      };
      settings = $.extend(settings, options);
      log = function(msg) {
        if (settings.debug) {
          return typeof console !== "undefined" && console !== null ? console.log(msg) : void 0;
        }
      };
      return this.each(function() {
        var $color, $this, dataAssign, stars;
        $this = $(this);
        $color = $(".color", $this);
        stars = $this.attr("data-stars");
        dataAssign = $this.attr("data-assign-stars");
        if (dataAssign == null) {
          return $color.css("margin-left", "" + stars + "%");
        } else if (dataAssign != null) {
          $this.css("cursor", "pointer");
          return $this.on("click", function(e) {
            var clickedPos, clickedWidth, offset, percentageBefore, percentageRounded;
            settings.callbefore.call(this);
            offset = $(this).offset();
            clickedPos = e.clientX - offset.left;
            clickedWidth = $(this).width();
            percentageBefore = (clickedPos / clickedWidth) * 100;
            if (settings.round) {
              percentageRounded = Math.ceil(percentageBefore / settings.round) * settings.round;
            } else {
              percentageRounded = percentageBefore;
            }
            $color.css("margin-left", "" + percentageRounded + "%");
            $this.attr("data-stars-recived", percentageRounded);
            settings.callback.call(this);
          });
        }
      });
    }
  });

}).call(this);
