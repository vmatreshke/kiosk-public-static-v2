###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_Font = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    optionName: PropTypes.string.isRequired
    value:      PropTypes.string.isRequired
    items:      PropTypes.object.isRequired
    onChange:   PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <span className="b-design-option__item__name">
        { this.props.title }
      </span>
      { this.renderParamList() }
    </div>`

  renderParamList: ->
    #TODO: We can set inline font-family style with fullName value, instead of 
    #      boring className
    fontComponent = @
    listItems = _.map @props.items, (fullName, name) ->
      itemClasses = 'b-design-option__type b-design-option__type_' + name

      `<label className={ itemClasses }
              key={ name }>
         <input type="radio"
                defaultChecked={ name == fontComponent.props.value }
                name={ fontComponent.props.optionName }
                value={ name }
                onChange={ fontComponent.handleChange.bind(null, name) } />
         <span className="b-design-option__type__ind">Aa</span>
      </label>`

    return `<div className="b-design-option__item__val">
              { listItems }
            </div>`

  handleChange: (fontName) ->
    @props.onChange @props.optionName, fontName

module.exports = DesignSettings_Font