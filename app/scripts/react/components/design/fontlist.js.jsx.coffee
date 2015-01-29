###* @jsx React.DOM ###

window.FontList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    fontSet: React.PropTypes.object.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    fontSet: 
      'default': 'default'
      'verdana': 'verdana'
      'gotham': 'gotham'
      'apercu': 'apercu'

  handleChange: (font)->  
    if @props.onChange
      @props.onChange font

  render: ->
    fontSetList = _.map @props.fontSet, (font, key) =>
      checked = false

      if @props.value && @props.value == key
        checked = true

      `<FontSelect font={font} key={font} name={_this.props.name} checked={checked} onChange={_this.handleChange.bind(key, font)}/>`

    return `<div>{fontSetList}</div>`

window.FontSelect = React.createClass
  propTypes:
    font: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired
    checked: React.PropTypes.bool.isRequired

  render: ->
    className = "b-design-option__type b-design-option__type_" + @props.font
    return `<label className={className}>
      <input type="radio" onChange={this.props.onChange} defaultChecked={this.props.checked} name={this.props.name} value={this.props.font}/>
      <span className="b-design-option__type__ind">Aa</span>
      </label>`