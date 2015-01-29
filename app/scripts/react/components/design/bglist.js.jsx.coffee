###* @jsx React.DOM ###

window.BgList = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    bgSet: React.PropTypes.object.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    bgSet: 
      'bg-pikachu': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
      'bg-slowpoke': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'

  handleChange: (background)->
    if @props.onChange
      @props.onChange background
  
  render: ->
    bgSetList = _.map @props.bgSet, (background, key) =>
      checked = false

      if @props.value && @props.value == key
        checked = true

      `<BackgroundSelect name={_this.props.name} checked={checked} background={background} key={key} onChange={_this.handleChange.bind(background, key)}/>`

    return `<div>{bgSetList}</div>`

window.BackgroundSelect = React.createClass
  propTypes:
    background: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired
    checked: React.PropTypes.bool.isRequired

  render: ->
    return `<label className="b-design-option__color b-design-option__color_img">
        <input type="radio" name={this.props.name} defaultChecked={this.props.checked} value={this.props.background} onChange={this.props.onChange}/>
        <span className="b-design-option__color__ind"><img src={this.props.background} alt=""/></span>
      </label>`