$ = jQuery

$.fn.extend
  jqStars: (options) ->
    settings =
      debug: false
      round: 20
      callback: () ->
      callbefore: () ->

    settings = $.extend settings, options

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    return @each ()->
      # variables
      $this = $(this)
      $color = $(".color", $this)
      stars = $this.attr "data-stars"
      dataAssign = $this.attr "data-assign-stars"

      if !dataAssign?
        $color.css "margin-left", "#{stars}%"

      if dataAssign?
        $this.css "cursor", "pointer"
        $this.on "click", (e) ->

          settings.callbefore.call(this)

          offset = $(this).offset()
          clickedPos = e.clientX - offset.left
          clickedWidth = $(this).width()
          percentageBefore = ( clickedPos / clickedWidth) * 100

          if settings.round
            percentageRounded = Math.ceil(percentageBefore / settings.round) * settings.round
          else
            percentageRounded = percentageBefore

          $color.css "margin-left", "#{percentageRounded}%"
          $this.attr "data-stars-recived", percentageRounded

          settings.callback.call(this)

          return
