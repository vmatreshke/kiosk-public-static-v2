###* @jsx React.DOM ###

window.ColorList = React.createClass
  propTypes:
    colorSet: React.PropTypes.object.isRequired
    type: React.PropTypes.string.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    colorSet: 
      'bg-dark': '#000'
      'bg-white': '#fff'
      'layer-dark': '#000'
      'layer-light': '#fff'

  handleClick: (name)->
    @setState value: name
  
  render: ->
    return null unless @props.colorSet

    colorSetList = _.map @props.colorSet, (color, i) =>
      `<ColorSelect color={color} key={i} onClick={_this.handleClick.bind(color, i)}/>`

    return `<div>{colorSetList}</div>`

window.ColorSelect = React.createClass
  propTypes:
    color: React.PropTypes.string.isRequired

  render: ->
    divStyle =
      'background-color': @props.color

    return `<div className="b-design-option__color" onClick={this.props.onClick} style={divStyle}></div>`