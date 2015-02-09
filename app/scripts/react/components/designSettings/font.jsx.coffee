###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_Font = React.createClass

  propTypes:
    title:    PropTypes.string.isRequired
    value:    PropTypes.string.isRequired
    items:    PropTypes.array.isRequired
    onChange: PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <span className="b-design-option__item__name">
        { this.props.title }
      </span>
      { this.renderParamList() }
    </div>`

  renderParamList: ->
    that = @
    listItems = _.map @props.items, (fontName) ->
      itemClasses = 'b-design-option__type b-design-option__type_' + fontName

      `<label className={ itemClasses }
              key={ fontName }>
         <input type="radio"
                checked={ fontName == that.props.value }
                onChange={ that.handleChange.bind(null, fontName) } />
         <span className="b-design-option__type__ind">Aa</span>
      </label>`

    return `<div className="b-design-option__item__val">
              { listItems }
            </div>`

  handleChange: (fontName) ->
    @props.onChange fontName

module.exports = DesignSettings_Font