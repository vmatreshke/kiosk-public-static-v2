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
    @props.onChange? layout

  render: ->
    layoutSetList = _.map @props.layoutSet, (layout, key) =>
      checked = false

      checked = @props.value && @props.value == key
      
      `<LayoutSelect name={_this.props.name} layoutName={key} layout={layout} key={key} checked={checked} onChange={_this.handleChange.bind(layout, key)}/>`

    return `<div>{layoutSetList}</div>`

window.LayoutSelect = React.createClass
  propTypes:
    layout: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired
    checked: React.PropTypes.bool.isRequired

  render: ->
    return `<label className="b-design-option__layout">
        <input onChange={this.props.onChange} type="radio" defaultChecked={this.props.checked} value={this.props.layout} name={this.props.name}/>
        <span className="b-design-option__layout__ind">{this.props.layoutName}</span>
      </label>`