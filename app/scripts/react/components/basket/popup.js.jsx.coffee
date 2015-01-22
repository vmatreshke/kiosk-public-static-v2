###* @jsx React.DOM ###

window.BasketPopup = React.createClass
  propTypes:
    cartUrl:      React.PropTypes.string.isRequired
    cartClearUrl: React.PropTypes.string.isRequired
    cartItems:    React.PropTypes.array.isRequired

  getDefaultProps: ->
    cartUrl: "/cart.html"
    cartClearUrl: "/cart.html?clear"
    items: null

  getInitialState: ->
    isVisible: false
    items: null

  componentDidMount: ()->
    $(document).on "click", @handleBodyClick
    $(document).on "cart:clicked", @handleCartClicked
    $(document).on "keyup", @handleBodyKey
    BasketStore.addChangeListener @_onChange

  componentWillUnmount: ()->
    $(document).off "click", @handleBodyClick
    $(document).off "cart:clicked", @handleCartClicked
    $(document).off "keyup", @handleBodyKey

  render: ->
    classNameValue = "b-float-cart"
    # Зачем убирать класс, когда можно просот не показывать весь компонент?
    classNameValue += " b-float-cart_invisible" if @state.isVisible is false
    return `<div className={classNameValue}><div className='b-float-cart__content' onClick={this.handleClick}>
          <BasketPopupList items={this.props.items}/>
          <BasketPopupControl cartUrl={this.props.cartUrl} cartClearUrl={this.props.cartClearUrl}/>
        </div></div>`

  _onChange: ()->
    @setState items: BasketStore.getBasketItems()
    @handleCartClicked()

  handleCartClicked: (e)->
    @setState isVisible: true

  handleClick: (e)->
    $(document).trigger "cart:clicked"

  handleBodyClick: ()->
    @setState isVisible: false if @state.isVisible

  handleBodyKey: (e)->
    @setState isVisible: false if e.keyCode == 27


window.BasketPopupList = React.createClass
  propTypes:
    items: React.PropTypes.array

  render: ->
    return null unless @props.items
    itemsList = @props.items.map((item) ->
      return (
        `<BasketPopupItem key={item.id} item={item}/>`
        )
    )

    return `<div className="b-float-cart__item-wrap">
        {itemsList}
      </div>`

window.BasketPopupItem = React.createClass
  propTypes:
    product_url: React.PropTypes.string
    good_id:     React.PropTypes.number
    price:       React.PropTypes.number
    count:       React.PropTypes.number
    image_url:   React.PropTypes.string
    title:       React.PropTypes.string
    description: React.PropTypes.string
    article:     React.PropTypes.string
    count:       React.PropTypes.number

  render: ->
    return `<div className="b-float-cart__item">
              <div className="b-float-cart__item__inner">
                <div className="b-float-cart__item__img">
                  <a href={this.props.product_url}>
                    <img src={this.props.image_url} alt={this.props.title}/>
                  </a>
                </div>
                <div className="b-float-cart__item__info">
                  <a className="b-float-cart__item__name" href={this.props.product_url}>{this.props.title}</a>
                  <div className="b-float-cart__item__param">{this.props.description}</div>
                  <div className="b-float-cart__item__param">{this.props.article}</div>
                </div>
                <div className="b-float-cart__item__q">{this.props.count}</div>
                <div className="b-float-cart__item__price">
                  <div className="b-float-cart__item__price-val">
                    {accounting.formatMoney((this.props.price.cents/100).toFixed(2) * this.props.count)}
                  </div>
                </div>
              </div>
            </div>`


window.BasketPopupControl = React.createClass
  propTypes:
    cartUrl:      React.PropTypes.string.isRequired
    cartClearUrl: React.PropTypes.string.isRequired

  render: ->
    return `<div className="b-float-cart__control">
          <a className="b-float-cart__url b-btn" href={this.props.cartUrl}>Перейти в корзину</a>
          <a className="b-float-cart__clear" href={this.props.cartClearUrl}>Очистить корзину</a>
        </div>`
