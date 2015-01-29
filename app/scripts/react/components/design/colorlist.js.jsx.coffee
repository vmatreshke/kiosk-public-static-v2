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

  handleChange: (color)->
    @setState value: color
    
    if @props.onChange
      @props.onChange @props.name, color
  
  render: ->
    colorSetList = _.map @props.colorSet, (color, key) =>
      if @props.value && key == @props.value
        `<ColorSelect checked="true" name={_this.props.name} color={color} colorName={key} key={key} onChange={_this.handleChange.bind(color, key)}/>`
      else
        `<ColorSelect checked="false" name={_this.props.name} color={color} colorName={key} key={key} onChange={_this.handleChange.bind(color, key)}/>`

    return `<div>{colorSetList}</div>`

window.ColorSelect = React.createClass
  propTypes:
    color: React.PropTypes.string.isRequired
    colorName: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired
    checked: React.PropTypes.string.isRequired

  render: ->
    divStyle =
      'background-color': @props.color

    className = "b-design-option__color"

    if @props.checked == 'true'
      className += " b-design-option__color_checked"

    return `<label className={className} style={divStyle}>
      <input type="radio" name={this.props.name} checked={this.props.checked} value={this.props.colorName} onChange={this.props.onChange}/>
      </label>`