###* @jsx React.DOM ###

window.LayoutList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    layoutSet: React.PropTypes.object.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    layoutSet:
      'layout-one': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
      'layout-two': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
  
  handleChange: (layout)->
    @setState value: layout

    if @props.onChange
      @props.onChange @props.name, layout

  render: ->
    return null unless @props.layoutSet

    layoutSetList = _.map @props.layoutSet, (i, layout) =>
      `<LayoutSelect layout={layout} key={layout} onChange={_this.handleChange.bind(i, layout)}/>`

    return `<div>{layoutSetList}</div>`

window.LayoutSelect = React.createClass
  propTypes:
    layout: React.PropTypes.string.isRequired

  render: ->
    return `<label className="b-design-option__layout">
      {this.props.layout}
      <input onChange={this.props.onChange} type="radio" value={this.props.layout} name="layout-stack"/>
      </label>`