###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_Color = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    optionName: PropTypes.string.isRequired
    value:      PropTypes.string.isRequired
    items:      PropTypes.object.isRequired
    onChange:   PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">
          { this.props.title }
        </span>
        <div className="b-design-option__item__val">
          <div style={{ backgroundColor: this.props.items[this.props.value] }}
               className="b-design-option__color__ind" />
        </div>
      </div>
      { this.renderParamList() }
    </div>`

  renderParamList: ->
    that = @
    listItems = _.map @props.items, (hexCode, name) ->
      itemStyles = backgroundColor: hexCode

      `<label className="b-design-option__color"
              key={ name }>
         <input type="radio"
                name={ that.props.optionName }
                defaultChecked={ name == that.props.value }
                value={ name }
                onChange={ that.handleChange.bind(null, name) } />
        <span style={ itemStyles }
              className="b-design-option__color__ind" />
      </label>`

    return `<div className="b-design-option__item__available-params">
              { listItems }
            </div>`

  handleChange: (value) ->
    @props.onChange @props.optionName, value

module.exports = DesignSettings_Color