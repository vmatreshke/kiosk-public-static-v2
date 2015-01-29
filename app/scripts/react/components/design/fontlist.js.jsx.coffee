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
    @setState value: font
  
    if @props.onChange
      @props.onChange @props.name, font

  render: ->
    fontSetList = _.map @props.fontSet, (font, i) =>
      `<FontSelect font={font} key={font} onChange={_this.handleChange.bind(i, font)}/>`

    return `<div>{fontSetList}</div>`

window.FontSelect = React.createClass
  propTypes:
    font: React.PropTypes.string.isRequired

  render: ->
    className = "b-design-option__type b-design-option__type_" + @props.font
    return `<label className={className}>Aa<input type="radio" onChange={this.props.onChange} name="font-list-stack" value={this.props.font}/></label>`