$ ->
  # Touch detect
  if 'ontouchstart' of document
    $("html").addClass "feature_touch"
  else
    $("html").addClass "feature_no-touch"

  $('[tooltip]').tooltip()

  if $("[range_slider]").length
    $("[range_slider]").noUiSlider(
      start: [20, 80]
      connect: true
      range: {
        'min': 0
        'max': 100
      }
    )

  if $("[fontsize_slider]").length
    $("[fontsize_slider]").noUiSlider(
      start: 14
      step: 2
      range: {
        'min': 12
        'max': 16
      }
    )