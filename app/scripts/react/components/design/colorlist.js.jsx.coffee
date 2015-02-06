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
    @props.onChange? color
  
  render: ->
    colorSetList = _.map @props.colorSet, (color, key) =>
      checked = false

      checked = @props.value && @props.value == key
      
      `<ColorSelect name={_this.props.name} checked={checked} color={color} colorName={key} key={key} onChange={_this.handleChange.bind(color, key)}/>`

    return `<div>{colorSetList}</div>`

window.ColorSelect = React.createClass
  propTypes:
    color: React.PropTypes.string.isRequired
    colorName: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired
    checked: React.PropTypes.bool.isRequired

  render: ->
    divStyle =
      'background-color': @props.color

    return `<label className="b-design-option__color">
      <input type="radio" name={this.props.name} defaultChecked={this.props.checked} value={this.props.colorName} onChange={this.props.onChange}/>
      <span className="b-design-option__color__ind" style={divStyle}></span>
      </label>`