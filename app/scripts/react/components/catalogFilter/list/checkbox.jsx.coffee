###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Checkbox = React.createClass

  propTypes:
    title:     PropTypes.string.isRequired
    paramName: PropTypes.string.isRequired
    items:     PropTypes.array.isRequired

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
               className="b-cbox__native" />
        <div className="b-cbox__val">
          { item.name }
        </div>
      </label>`

    return `<div className="b-full-filter__widget">
              { listItems}
            </div>`

  getFieldName: (item) ->
    "#{ @props.paramName }[#{ item.paramValue }]"

module.exports = CatalogFilterList_Checkbox