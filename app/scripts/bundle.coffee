require './libs'
require './shared/app'
require './shared/cart'
require './shared/load_more'
require './shared/lightbox'
require './shared/jump'
require './shared/product_images_slider'
require './shared/application_slider'
require './shared/theme_switcher'
require './shared/mobile_navigation'
require './shared/checkout'

window.Routes    = require './routes/routes'
window.ApiRoutes = require './routes/api'

require './react/components/basket/button'
require './react/components/basket/popup'
require './react/components/product/add_to_basket_button'
require './react/components/instagram/instagram_feed_mixin'
require './react/components/instagram/instagram'
require './react/components/instagram/instagram_v2'
require './react/components/design/designer'
require './react/components/design/colorlist'
require './react/components/design/bglist'
require './react/components/design/fontlist'
require './react/components/design/toggle'
require './react/components/design/valueslider'
require './react/components/design/layoutlist'
global.CatalogFilter  = require './react/components/catalogFilter/catalogFilter'
global.DesignSettings = require './react/components/designSettings/designSettings'

require './react/dispatchers/basket'
require './react/actions/view/basket'
require './react/stores/basket'
window.Api = require './react/api/api'


window.KioskEvents = require './react/controllers/events'
TooltipController  = require './react/controllers/tooltip'
new TooltipController()

ReactUjs.initialize()
