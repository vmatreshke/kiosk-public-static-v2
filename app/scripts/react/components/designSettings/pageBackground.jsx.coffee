###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_PageBackground = React.createClass

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
          <div className="b-design-option__color b-design-option__color_img">
            <div className="b-design-option__color__ind">
              <img src={ this.props.items[this.props.value] } />
            </div>
          </div>
        </div>
      </div>
      { this.renderParamList() }
    </div>`

  renderParamList: ->
    pageBackgroundComponent = @
    listItems = _.map @props.items, (url, name) ->
      `<label className="b-design-option__color b-design-option__color_img"
              key={ name }>
         <input type="radio"
                name={ pageBackgroundComponent.props.optionName }
                defaultChecked={ name == pageBackgroundComponent.props.value }
                value={ name }
                onChange={ pageBackgroundComponent.handleChange.bind(null, name) } />
        <span className="b-design-option__color__ind">
          <img src={ url } />
        </span>
      </label>`

    return `<div className="b-design-option__item__available-params">
              { listItems }
            </div>`

  handleChange: (backgroundName) ->
    @props.onChange @props.optionName, backgroundName

module.exports = DesignSettings_PageBackground