###* @jsx React.DOM ###

window.AddToBasketButton = React.createClass
  propTypes:
    elementQuery: React.PropTypes.string
    dataAttr:     React.PropTypes.string

  getDefaultProps: ->
    elementQuery: '[good-select] option:selected'
    dataAttr:      'good'

  addToBasket: ->
    good = $(@props.elementQuery).data @props.dataAttr
    if good?
      BasketActions.addGood good
    else
      alert "Ошибка при добавлении товара в корзину. Нет атрибута good в выбранном пункте"
  
  render: ->
    return `<button className="b-btn" onClick={this.addToBasket}>В корзину</button>`
