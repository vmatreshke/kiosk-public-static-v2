###* @jsx React.DOM ###

window.BgList = React.createClass
  propTypes:
    bgSet: React.PropTypes.object.isRequired
    type: React.PropTypes.string.isRequired
    value: React.PropTypes.string

  getDefaultProps: ->
    bgSet: 
      'bg-pikachu': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
      'bg-slowpoke': 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'

  handleClick: (name)->
    @setState value: name
  
  render: ->
    return null unless @props.bgSet

    bgSetList = _.map @props.bgSet, (background, i) =>
      `<BackgroundSelect background={background} key={i} onClick={_this.handleClick.bind(background, i)}/>`

    return `<div>{bgSetList}</div>`

window.BackgroundSelect = React.createClass
  propTypes:
    background: React.PropTypes.string.isRequired

  render: ->
    return `<div className="b-design-option__color b-design-option__color_img" onClick={this.props.onClick}>
        <img src={this.props.background} alt=""/>
      </div>`