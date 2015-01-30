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

  _createDesignComponent: (option) ->
    switch option.type
      when 'ColorList'
        `<DesignerColorList onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`

      when 'LayoutList'
        `<DesignerLayoutList onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`

      when 'BgList'
        `<DesignerBgList onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`
      
      when 'FontList'
        `<DesignerFontList onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`

      when 'ValueSlider'
        `<DesignerValueSlider onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`

      when 'Toggle'
        `<DesignerToggle onChange={this.handleChange.bind(this, option)} name={option.name} option={option.props}/>`

  render: ->
    designItems = _.map @props.options, (option) =>
      @._createDesignComponent option

    return `<div className="b-design-option">
        <div className="b-design-option__title">Управление дизайном</div>
        <span className="b-design-option__close">Закрыть</span>
        <div className="b-design-option__body">{designItems}</div>
        <button type="button" className="b-design-option__save">Сохранить</button>
      </div>`

window.DesignerColorList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<ColorList onChange={this.props.onChange} name={this.props.option.name} colorSet={this.props.option.colorSet} value={this.props.option.value}/>`
    designVal = 
      'background-color': @props.option.colorSet[@props.option.value]
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.name}</span>
        <div className="b-design-option__item__val">
          <div className="b-design-option__color" style={designVal}></div>
        </div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.DesignerLayoutList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<LayoutList onChange={this.props.onChange} name={this.props.option.name} layoutSet={this.props.option.layoutSet} value={this.props.option.value}/>`
    designVal = `<div className="b-design-option__color b-design-option__color_img"><img src="" alt=""/></div>`
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.name}</span>
        <div className="b-design-option__item__val">{designVal}</div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.DesignerBgList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<BgList onChange={this.props.onChange} name={this.props.option.name} bgSet={this.props.option.bgSet} value={this.props.option.value}/>`
    designVal = `<div className="b-design-option__color b-design-option__color_img"><img src="" alt=""/></div>`
    return `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">{this.props.name}</span>
        <div className="b-design-option__item__val">{designVal}</div>
      </div>
      <div className="b-design-option__item__available-params">{designComponent}</div>
      </div>`

window.DesignerFontList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<FontList onChange={this.props.onChange} name={this.props.option.name} fontSet={this.props.option.fontSet} value={this.props.option.value}/>`
    return `<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`

window.DesignerValueSlider = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<ValueSlider onChange={this.props.onChange} name={this.props.option.name} range={this.props.option.range} value={this.props.option.value} step={this.props.option.step}/>`
    return`<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`

window.DesignerToggle = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    option: React.PropTypes.array.isRequired

  render: ->
    designComponent = `<Toggle onChange={this.props.onChange} name={this.props.option.name} value={this.props.option.value}/>`
    return `<div className="b-design-option__item">
      <span className="b-design-option__item__name">{this.props.name}</span>
      <div className="b-design-option__item__val">{designComponent}</div>
      </div>`