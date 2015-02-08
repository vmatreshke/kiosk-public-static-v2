###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_ProductLayout = React.createClass

  propTypes:
    title:    PropTypes.string.isRequired
    value:    PropTypes.string.isRequired
    items:    PropTypes.object.isRequired
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
    listItems = _.map @props.items, (url, name) ->
      `<label className="b-design-option__layout"
              key={ name }>
        <input type="radio"
               checked={ name == that.props.value }
               onChange={ that.handleChange.bind(null, name) } />
        <span className="b-design-option__layout__ind">
          { name }
        </span>
      </label>`

    return `<div className="b-design-option__item__val">
              { listItems }
            </div>`

  handleChange: (layout) ->
    @props.onChange layout

module.exports = DesignSettings_ProductLayout