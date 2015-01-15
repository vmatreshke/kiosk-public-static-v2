###* @jsx React.DOM ###

window.ColorList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    colorSet: React.PropTypes.object.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    colorSet:
      'bg-dark': '#000'
      'bg-white': '#fff'
      'layer-dark': '#000'
      'layer-light': '#fff'

  onChange: (color)->
    @setState value: color
  
  render: ->
    return null unless @props.colorSet

    colorSetList = _.map @props.colorSet, (color, key) =>
      `<ColorSelect name={_this.props.name} color={color} colorName={key} key={key} onChange={_this.onChange.bind(color, key)}/>`

    return `<div>{colorSetList}</div>`

window.ColorSelect = React.createClass
  propTypes:
    color: React.PropTypes.string.isRequired
    colorName: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired

  render: ->
    divStyle =
      'background-color': @props.color

    return `<label className="b-design-option__color" style={divStyle}>
      <input type="radio" name={this.props.name} value={this.props.colorName} onChange={this.props.onChange}/>
      </label>`