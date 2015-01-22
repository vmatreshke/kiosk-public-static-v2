BaseStore = require './_base'

_cartItems = []

window.BasketDispatcher.register (payload) ->
  action = payload.action
  
  switch action.actionType
    when 'productAddedToBasket'
      BasketStore._addItem action.productItem
      BasketStore.emitChange()
      break

    when 'receiveBasket'
      BasketStore._receiveBasket action.cartItems
      BasketStore.emitChange()
      break


window.BasketStore = _.extend new BaseStore(), {
  getBasketItems: ->
    _cartItems

  getBasketCount: ->
    total = 0
    _.forEach _cartItems, (item)->
      total += item.count
    return total

  _findItem: (productItem) ->
    thisItem = _.findIndex _cartItems, (item) ->
      item.product_item_id == productItem.product_item_id
    return _cartItems[thisItem]

  _addItem: (productItem)->
    cartItem = BasketStore._findItem productItem
    if cartItem?
      cartItem.count += 1
    else
      productItem.count = 1
      _cartItems.push productItem

  _receiveBasket: (cartItems)->
    if cartItems?
      _.forEach cartItems.items, (cartItem)->
        _cartItems.push cartItem.product_item


}
