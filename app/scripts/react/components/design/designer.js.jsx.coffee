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
    switch options.type
      when 'ColorList'
        `<DesignerElementLayout name={options.name} type="color" set={options.props.colorSet} value={options.props.value}>
          <ColorList name={options.props.name} colorSet={options.props.colorSet} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`

      when 'BgList'
        `<DesignerElementLayout name={options.name} type="image" set={options.props.bgSet} value={options.props.value}>
          <BackgroundList name={options.props.name} bgSet={options.props.bgSet} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`

      when 'LayoutList'
        `<DesignerElementLayout name={options.name} type="simplified">
          <LayoutList name={options.props.name} layoutSet={options.props.layoutSet} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`
      
      when 'FontList'
        `<DesignerElementLayout name={options.name} type="simplified">
          <FontList name={options.props.name} fontSet={options.props.fontSet} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`

      when 'ValueSlider'
        `<DesignerElementLayout name={options.name} type="simplified">
          <ValueSlider name={options.props.name} step={options.props.step} range={options.props.range} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`

      when 'Toggle'
        `<DesignerElementLayout name={options.name} type="simplified">
          <Toggle name={options.props.name} value={options.props.value} onChange={this.handleChange.bind(this, options)}/>
        </DesignerElementLayout>`

  render: ->
    designItems = _.map @props.options, (option) =>
      @._createDesignComponent option

    return `<div className="b-design-option">
        <div className="b-design-option__title">Управление дизайном</div>
        <span className="b-design-option__close">Закрыть</span>
        <div className="b-design-option__body">{designItems}</div>
        <button type="button" className="b-design-option__save">Сохранить</button>
      </div>`

window.DesignerElementLayout = React.createClass
  render: ->
    if @props.type? && @props.type == 'simplified'
      return `<div className="b-design-option__item">
        <span className="b-design-option__item__name">{this.props.name}</span>
        <div className="b-design-option__item__val">{this.props.children}</div>
        </div>`
    else
      return `<div className="b-design-option__item">
          <div className="b-design-option__item__current-params">
            <span className="b-design-option__item__name">{this.props.name}</span>
            <DesignerElementValueLayout value={this.props.value} type={this.props.type} set={this.props.set}/>
          </div>
          <div className="b-design-option__item__available-params">{this.props.children}</div>
          </div>`

window.DesignerElementValueLayout = React.createClass
  propTypes:
    type: React.PropTypes.string.isRequired
    set: React.PropTypes.array
    value: React.PropTypes.string
  
  render: ->
    value = @props.set[@props.value]
    if @props.type == 'color'
      divStyle =
        'background-color': value
      return `<div className="b-design-option__item__val">
          <div className="b-design-option__color__ind" style={divStyle}/>
        </div>`
    if @props.type == 'image'
      return `<div className="b-design-option__item__val">
          <div className="b-design-option__color b-design-option__color_img">
            <div className="b-design-option__color__ind">
              <img src={value} alt=""/>
            </div>
          </div>
        </div>`
    return `null`
