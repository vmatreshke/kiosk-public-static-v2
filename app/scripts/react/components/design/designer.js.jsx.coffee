###* @jsx React.DOM ###

window.Designer = React.createClass
  propTypes:
    options: React.PropTypes.array.isRequired

  getDefaultProps: ()->
    options: [
      {"type": "ColorList", "name": "цвет страницы", "props": {"name":"background_color", "colorSet":{'dark': '#000', 'white': '#fff', 'gray': '#eee'}, "value":"white"}}
      {"type": "BgList", "name": "фон страницы", "props": {"name":"background_image", "bgSet":{'pokeball': 'https://s-media-cache-ak0.pinimg.com/originals/56/b8/bd/56b8bdb28de8e41c9acbaa993e16a1eb.jpg', 'bg2': 'https://s-media-cache-ak0.pinimg.com/originals/56/b8/bd/56b8bdb28de8e41c9acbaa993e16a1eb.jpg'}, "value":"pokeball"}}
      {"type": "FontList", "name": "шрифт", "props": {"name":"font_family", "value": "gotham"}}
      {"type": "ValueSlider", "name": "размер шрифта", "props": {"name":"font_size", "step": 1, "range":{"min": 13, "max": 15}, "value": 14 }}
      {"type": "Toggle", "name": "главная страница", "props": {"name":"banner", "label": "большой баннер", "value": true }}
      {"type": "LayoutList", "name": "лейаут страницы", "props": {"name":"layout", "layoutSet":{'one': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg', 'two': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'}, "value":"one"}}
    ]

  handleChange: (option, newValue)->
    newState = {}
    newState[option.props.name] = newValue
    @setState newState

  _createDesignComponent: (options) ->
    componentOptions = {}
    componentOptions.onChange = this.handleChange.bind(this, options)
    componentOptions.name = options.name
    componentOptions.options = options.props
    
    switch options.type
      when 'ColorList'
        `<ColorListProxy options={componentOptions}/>`

      when 'LayoutList'
        `<LayoutListProxy options={componentOptions}/>`

      when 'BgList'
        `<BgListProxy options={componentOptions}/>`
      
      when 'FontList'
        `<FontListProxy options={componentOptions}/>`

      when 'ValueSlider'
        `<ValueSliderProxy options={componentOptions}/>`

      when 'Toggle'
        `<ToggleProxy options={componentOptions}/>`

  render: ->
    designItems = _.map @props.options, (option) =>
      @._createDesignComponent option

    return `<div className="b-design-option">
        <div className="b-design-option__title">Управление дизайном</div>
        <span className="b-design-option__close">Закрыть</span>
        <div className="b-design-option__body">{designItems}</div>
        <button type="button" className="b-design-option__save">Сохранить</button>
      </div>`

window.ColorListProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<ColorList onChange={this.props.options.onChange} name={this.props.options.options.name} colorSet={this.props.options.options.colorSet} value={this.props.options.options.value}/>`
    designVal = 
      'background-color': @props.options.options.colorSet[@props.options.options.value]
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.options.name}</span>
        <div className="b-design-option__item__val">
          <div className="b-design-option__color" style={designVal}></div>
        </div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.LayoutListProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<LayoutList onChange={this.props.options.onChange} name={this.props.options.options.name} layoutSet={this.props.options.options.layoutSet} value={this.props.options.options.value}/>`
    designVal = `<div className="b-design-option__color b-design-option__color_img"><img src="" alt=""/></div>`
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.options.name}</span>
        <div className="b-design-option__item__val">{designVal}</div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.BgListProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<BgList onChange={this.props.options.onChange} name={this.props.options.options.name} bgSet={this.props.options.options.bgSet} value={this.props.options.options.value}/>`
    designVal = `<div className="b-design-option__color b-design-option__color_img"><img src="" alt=""/></div>`
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.options.name}</span>
        <div className="b-design-option__item__val">{designVal}</div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.FontListProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<FontList onChange={this.props.options.onChange} name={this.props.options.options.name} fontSet={this.props.options.options.fontSet} value={this.props.options.options.value}/>`
    return `<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.options.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`

window.ValueSliderProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<ValueSlider onChange={this.props.options.onChange} name={this.props.options.options.name} range={this.props.options.options.range} value={this.props.options.options.value} step={this.props.options.options.step}/>`
    return`<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.options.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`

window.ToggleProxy = React.createClass
  propTypes:
    options: React.PropTypes.object.isRequired

  render: ->
    designComponent = `<Toggle onChange={this.props.options.onChange} name={this.props.options.options.name} value={this.props.options.options.value}/>`
    return `<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.options.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`