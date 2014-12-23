$ ->
  # mobile navigation

  menuCopy = $('[ks-mob-nav]')
  searchBlock = $('[ks-search]')

  menuCopy.mmenu({
    classes: false,
    counters: false
  })

  if(searchBlock.length)
    searchBlock.clone().prependTo(menuCopy.find('#mm-0')).wrap('<li/>')

  navOpen = $('[ks-open-nav]')

  menuCopy.on 'opened.mm', ()->
    navOpen.addClass 'mmenu-open_active'
  menuCopy.on 'closed.mm', ()->
    navOpen.removeClass 'mmenu-open_active'


