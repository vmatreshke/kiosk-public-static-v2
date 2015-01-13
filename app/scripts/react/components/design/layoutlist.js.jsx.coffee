###* @jsx React.DOM ###

window.LayoutList = React.createClass
  propTypes:
    layoutSet: React.PropTypes.object.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    layoutSet: ['default', 'verdana', 'gotham', 'apercu']

  handleClick: (number)->
    console.log number
  
  render: ->
    return null unless @props.fontSet

    fontSetList = _.map @props.fontSet, (font, i) =>
      console.log font
      `<FontSelect font={font} key={font} onClick={_this.handleClick.bind(font, i)}/>`

    return `<div>{fontSetList}</div>`

window.FontSelect = React.createClass
  propTypes:
    font: React.PropTypes.string.isRequired

  render: ->
    className = "b-design-option__type b-design-option__type_" + @props.font
    return `<span className={className} onClick={this.props.onClick}>Aa</span>`