###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_Checkbox = React.createClass

  propTypes:
    title:    PropTypes.string.isRequired
    value:    PropTypes.array.isRequired
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
    listItems = _.map @props.items, (value, key) ->
      `<label className="b-design-option__cbox"
              key={ key }>
        <input type="checkbox"
               name={ value }
               defaultChecked={ that.isItemChecked(key) }
               onChange={ that.handleChange.bind(null, key) } />
        { value }
      </label>`

    return `<div className="b-design-option__item__val">
              { listItems }
            </div>`

  isItemChecked: (key) ->
    result = @props.value.filter (item) ->
      item == key

    !!result.length

  handleChange: (key, e) ->
    newValue = @props.value[..]
    index    = newValue.indexOf key

    if e.target.checked
      newValue.push key if index == -1
    else
      newValue.splice index, 1 if index != -1

    @props.onChange newValue

module.exports = DesignSettings_Checkbox