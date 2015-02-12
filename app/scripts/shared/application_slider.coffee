$ ->
  # Welcome slider

  defaultCarouselOptions =
    pagination: false
    autoPlay: 5000
    navigation: true

  $('[application-slider]').each ->
    options = _.clone defaultCarouselOptions

    if $(@).hasClass 'b-slider_promo'
      options['singleItem'] = true
      options['autoHeight'] = true
      options['lazyLoad']   = true
      options['afterInit']  = -> @.$elem.addClass 'loaded'
    if $(@).hasClass 'application-slider_photos'
      options['singleItem']   = false
      options['items']        = 3
      options['itemsDesktop'] = 3
    if $(@).hasClass 'application-slider_instagram'
      options['singleItem']   = false
      options['items']        = 6
      options['itemsDesktop'] = 6
      options['lazyLoad']     = true

    $(@).owlCarousel options