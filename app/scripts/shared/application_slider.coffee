$ ->
  # Welcome slider

  defaultCarouselOptions =
    pagination: false
    autoPlay: 5000
    navigation: true

  slider = $('[application-slider]')
  slider.each ->
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

  sliderThumbsContainer = $('[slider-thumbs]')
  sliderThumbs = sliderThumbsContainer.find('.b-slider-thumbs__item')
  sliderThumbsContainer.on 'click', '.b-slider-thumbs__item', (e)->
    e.preventDefault()
    sliderThumbs.removeClass('active')
    $(this).addClass('active')
    number = $(this).index()
    slider.trigger('owl.goTo',number)
