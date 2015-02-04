###* @jsx React.DOM ###

_pendingTooltip = null

getContainer = ->
  container = document.querySelector '[tooltip-container]'

  unless container?
    container = document.createElement 'div'
    container.setAttribute 'tooltip-container', ''
    document.body.appendChild container

  container

closeTooltip = ->
  container = getContainer()

  React.unmountComponentAtNode container
  _pendingTooltip = null

TooltipController =

  show: (position, filter, timeout = 3000) ->
    container = getContainer()

    closeTooltip()

    tooltip = React.renderComponent (
      `<Tooltip
          filter={ filter }
          position={ position }
          onClose={ closeTooltip } />`
    ), container

    _pendingTooltip = tooltip

module.exports = TooltipController

#*==========  Глобальные команды  ==========*#

KioskEvents.on KioskEvents.keys.commandTooltipShow(), (position, filter) ->
  TooltipController.show position, filter

#*-----  End of Глобальные команды  ------*#