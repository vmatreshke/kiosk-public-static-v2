###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_SelectedOptions = React.createClass

  propTypes:
    selectedOptions: PropTypes.array.isRequired

  render: ->
    if @hasOptions()
      `<li className="b-full-filter__item">
        <div className="b-full-filter__item__title">Текущий выбор</div>
        { this.renderListItems() }
      </li>`
    else null

  renderListItems: ->
    selectedOptions = @
    listItems = @props.selectedOptions.map (item, i) ->
      `<span className="b-full-filter__value"
             onClick={ selectedOptions.removeOption.bind(null, item.url) }
             key={ i }>
        { item.name }
      </span>`
    
    return `<div className="b-full-filter__widget">
              { listItems }
            </div>`

  hasOptions: ->
    @props.selectedOptions.length

  removeOption: (url) ->
    window.location = url

module.exports = CatalogFilterList_SelectedOptions