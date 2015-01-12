###* @jsx React.DOM ###

window.PageColor = React.createClass
  propTypes:
    colors: React.PropTypes.object.isRequired

  getDefaultProps: ->
    colors: 
      'bg-dark': '#000'
      'bg-white': '#fff'
  
  render: ->
    return null unless @props.colors
    colorList = _.map @props.colors, (color) ->
      `<ColorSelect color={color}/>`

    return `<div>{colorList}</div>`

window.LayerColor = React.createClass
  propTypes:
    colors: React.PropTypes.object.isRequired

  getDefaultProps: ->
    colors: 
      'layer-dark': '#000'
      'layer-light': '#fff'
  
  render: ->
    return null unless @props.colors
    colorList = _.map @props.colors, (color) ->
      `<ColorSelect color={color}/>`

    return `<div>{colorList}</div>`

window.ColorSelect = React.createClass
  propTypes:
    background: React.PropTypes.string.isRequired

  render: ->
    divStyle =
      'background-color': @props.color

    return `<div className="b-design-option__color" style={divStyle}></div>`

window.PageBackgroundImage = React.createClass
  propTypes:
    backgrounds: React.PropTypes.object.isRequired

  getDefaultProps: ->
    backgrounds: 
      'bg-pic-pikachu': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
      'bg-pic-slowpoke': 'http://cs304103.vk.me/g38535380/e_f3dd7860.jpg'
  
  render: ->
    return null unless @props.backgrounds
    backgroundList = _.map @props.backgrounds, (background) ->
      `<backgroundSelect background={background}/>`

    return `<div>{backgroundList}</div>`

window.backgroundSelect = React.createClass
  propTypes:
    background: React.PropTypes.string.isRequired

  render: ->
    return `<div className="b-design-option__color b-design-option__color_img">
        <img src={this.props.background} alt=""/>
      </div>`