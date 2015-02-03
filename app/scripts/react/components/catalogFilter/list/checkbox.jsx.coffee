###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Checkbox = React.createClass

  propTypes:
    title: PropTypes.string.isRequired
    items: PropTypes.array.isRequired

  render: ->
    `<li className="b-full-filter__item">
      <div className="b-full-filter__item__title">
        { this.props.title }
      </div>
      { this.renderListItems() }
    </li>`

  renderListItems: ->
    listItems = @props.items.map (item, i) ->
      `<label className="b-cbox" key={ i }>
        <input type="checkbox"
               defaultChecked={ item.checked }
               className="b-cbox__native" />
        <div className="b-cbox__val">
          { item.name }
        </div>
      </label>`

    return `<div className="b-full-filter__widget">
              { listItems}
            </div>`

module.exports = CatalogFilterList_Checkbox