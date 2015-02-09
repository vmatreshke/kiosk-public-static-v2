###* @jsx React.DOM ###

DesignSettings_ColorItem       = require './color/item'
DesignSettings_ColorCustomItem = require './color/customItem'
{ PropTypes } = React

DesignSettings_Color = React.createClass

  propTypes:
    value:    PropTypes.string.isRequired
    title:    PropTypes.string.isRequired
    items:    PropTypes.array.isRequired
    onChange: PropTypes.func.isRequired

  render: ->
    selectedItemStyles = backgroundColor: @props.value

    return `<div className="b-design-option__item">
              <div className="b-design-option__item__current-params">
                <span className="b-design-option__item__name">
                  { this.props.title }
                </span>
                <div className="b-design-option__item__val">
                  <div className="b-design-option__color__ind"
                       style={ selectedItemStyles } />
                </div>
              </div>
              { this.renderParamList() }
            </div>`

  renderParamList: ->
    that = @
    listItems = _.map @props.items, (hexCode) ->
      `<DesignSettings_ColorItem
          hexCode={ hexCode }
          checked={ hexCode == that.props.value }
          onChange={ that.handleChange }
          key={ hexCode } />`

    return `<div className="b-design-option__item__available-params">
              { listItems }
            </div>`

  handleChange: (hexCode) ->
    @props.onChange hexCode

module.exports = DesignSettings_Color