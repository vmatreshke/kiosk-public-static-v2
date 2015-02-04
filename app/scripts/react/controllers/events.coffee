KioskEvents = new EventEmitter()

KioskEvents.keys =
  commandTooltipShow: -> 'command:tooltip:show'

module.exports = KioskEvents