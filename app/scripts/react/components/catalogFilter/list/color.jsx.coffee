###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Color = React.createClass

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
      `<label className="b-cbox b-cbox_color" key={ i }>
        <input type="checkbox"
               name={ that.getFieldName(item) }
               defaultChecked={ item.checked }
               title={ item.name }
               className="b-cbox__native"
               onChange={ that.handleChange } />
        <div style={{ "background-color": item.hexCode }}
             className="b-cbox__val" />
      </label>`

    return `<div ref="list"
                 className="b-full-filter__widget">
              { listItems}
            </div>`

  getFieldName: (item) ->
    "#{ @props.filterName }[#{ @props.paramName }][#{ item.paramValue }]"

  handleChange: (e) ->
    elRect     = e.target.getBoundingClientRect()
    listRect   = @refs.list.getDOMNode().getBoundingClientRect()
    offsetLeft = 15

    filter   = $(@getDOMNode()).closest('form').serialize()
    position =
      left: listRect.right + offsetLeft
      top:  elRect.top + document.body.scrollTop - elRect.height / 2

    KioskEvents.emit KioskEvents.keys.commandTooltipShow(), position, filter

module.exports = CatalogFilterList_Color