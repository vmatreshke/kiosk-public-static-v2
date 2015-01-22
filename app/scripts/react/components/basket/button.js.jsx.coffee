###* @jsx React.DOM ###

window.BasketButton = React.createClass
  propTypes:
    # Если количество не установлено, то оно берется из BasketStore
    itemsCount: React.PropTypes.number
    cartUrl:    React.PropTypes.string.isRequired

  getDefaultProps: ->
    cartUrl: "/cart.html"

  getInitialState: ->
    itemsCount: @props.itemsCount || BasketStore.getBasketCount()

  componentDidMount: ->
    BasketStore.addChangeListener @_onChange

  componentDidUnmount: ->
    BasketStore.removeChangeListener @_onChange

  _onChange: ->
    @setState itemsCount: BasketStore.getBasketCount()

  render: ->
    if @state.itemsCount > 0
      return `<BasketButton_Full cartUrl={this.props.cartUrl} itemsCount={this.state.itemsCount}/>`
    else
      return `<BasketButton_Empty cartUrl={this.props.cartUrl}/>`

window.BasketButton_Full = React.createClass
  propTypes:
    itemsCount: React.PropTypes.object.isRequired
    cartUrl: React.PropTypes.object
  render: ->
    return `<a className='b-cart-trigger b-cart-trigger_full' href={this.props.cartUrl}><span className='b-cart-trigger__count'>{this.props.itemsCount}</span></a>`

window.BasketButton_Empty = React.createClass
  propTypes:
    cartUrl: React.PropTypes.object
  render: ->
    return `<a className='b-cart-trigger' href={this.props.cartUrl}></a>`
