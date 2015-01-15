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

  onChange: (background)->
    @setState value: background
  
  render: ->
    return null unless @props.bgSet

    bgSetList = _.map @props.bgSet, (background, key) =>
      `<BackgroundSelect name={_this.props.name} background={background} key={key} onChange={_this.onChange.bind(background, key)}/>`

    return `<div>{bgSetList}</div>`

window.BackgroundSelect = React.createClass
  propTypes:
    background: React.PropTypes.string.isRequired
    name: React.PropTypes.string.isRequired

  render: ->
    return `<label className="b-design-option__color b-design-option__color_img">
        <img src={this.props.background} alt=""/>
        <input type="radio" name={this.props.name} value={this.props.background} onChange={this.props.onChange}/>
      </label>`