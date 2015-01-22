window.BasketActions =
  addGood: (good) ->
    @_addItemToServer good

  _addItemToServer: (good, count=1) ->

    $.ajax
      dataType: 'json'
      method:   'post'
      data:
        good_id: good.good_id
        count:   count
      url:       Routes.vendor_cart_items_path()
      error: (xhr, status, err) ->
        console.error? err
      success: (response) ->
        BasketDispatcher.handleServerAction
          actionType: 'productAddedToBasket'
          cartItem:    cartItem

  # Принимает корзина с сервера через html.
  # Таким образом мы передаем товары в Store при загрузке страницы.
  receiveBasket: (cartItems) ->
    BasketDispatcher.handleViewAction
      actionType: 'receiveBasket'
      cartItems: cartItems
