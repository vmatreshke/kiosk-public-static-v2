###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_PageBackground = React.createClass

  propTypes:
    title:    PropTypes.string.isRequired
    value:    PropTypes.string.isRequired
    items:    PropTypes.array.isRequired
    onChange: PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <div className="b-design-option__item__current-params">
        <span className="b-design-option__item__name">
          { this.props.title }
        </span>
        <div className="b-design-option__item__val">
          <div className="b-design-option__color b-design-option__color_img">
            <div className="b-design-option__color__ind">
              <img src={ this.props.value } />
            </div>
          </div>
        </div>
      </div>
      { this.renderParamList() }
    </div>`

  renderParamList: ->
    that = @
    listItems = _.map @props.items, (backgroundUrl) ->
      `<label className="b-design-option__color b-design-option__color_img"
              key={ backgroundUrl }>
         <input type="radio"
                checked={ backgroundUrl == that.props.value }
                onChange={ that.handleChange.bind(null, backgroundUrl) } />
        <span className="b-design-option__color__ind">
          <img src={ backgroundUrl } />
        </span>
      </label>`

    return `<div className="b-design-option__item__available-params">
              { listItems }
            </div>`

  handleChange: (backgroundUrl) ->
    @props.onChange backgroundUrl

module.exports = DesignSettings_PageBackground