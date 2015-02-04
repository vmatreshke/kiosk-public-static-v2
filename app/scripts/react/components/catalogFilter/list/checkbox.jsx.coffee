###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Checkbox = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    paramName:  PropTypes.string.isRequired
    filterName: PropTypes.string.isRequired
    items:      PropTypes.array.isRequired

  render: ->
    `<li className="b-full-filter__item">
      <div className="b-full-filter__item__title">
        { this.props.title }
      </div>
      { this.renderListItems() }
    </li>`

  renderListItems: ->
    that = @
    listItems = @props.items.map (item, i) ->
      `<label className="b-cbox" key={ i }>
        <input type="checkbox"
               name={ that.getFieldName(item) }
               defaultChecked={ item.checked }
               className="b-cbox__native"
               onChange={ that.handleChange } />
        <div className="b-cbox__val">
          { item.name }
        </div>
      </label>`

    return `<div className="b-full-filter__widget">
              { listItems}
            </div>`

  getFieldName: (item) ->
    "#{ @props.filterName }[#{ @props.paramName }][#{ item.paramValue }]"

  handleChange: (e) ->
    elRect     = e.target.getBoundingClientRect()
    offsetLeft = 15

    filter     = $(@getDOMNode()).closest('form').serialize()
    position =
      left: elRect.right + offsetLeft
      top:  elRect.top + document.body.scrollTop - elRect.height / 2

    KioskEvents.emit KioskEvents.keys.commandTooltipShow(), position, filter

module.exports = CatalogFilterList_Checkbox