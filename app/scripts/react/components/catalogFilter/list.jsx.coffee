###* @jsx React.DOM ###

CatalogFilterList_SelectedOptions = require './list/selectedOptions'
CatalogFilterList_Checkbox        = require './list/checkbox'
CatalogFilterList_Range           = require './list/range'
CatalogFilterList_Color           = require './list/color'
CatalogFilter_ShowResultsButton   = require './buttons/showResults'
{ PropTypes } = React

CatalogFilterList = React.createClass

  propTypes:
    options: PropTypes.array.isRequired

  render: ->
    `<ul className="b-full-filter__list-wrap">
      <CatalogFilterList_SelectedOptions />
      { this.renderListItems() }
      <li className="b-full-filter__item">
        <CatalogFilter_ShowResultsButton onClick={ this.showResults } />
      </li>
    </ul>`

  renderListItems: ->
    listItems = @props.options.map (item, i) ->
      switch item.type
        when 'checkbox'
          { title, items } = item

          `<CatalogFilterList_Checkbox
               title={ title }
               items={ items }
               key={ i } />`
        when 'range'
          { title, units, from, to } = item

          `<CatalogFilterList_Range
               title={ title }
               units={ units }
               from={ from }
               to={ to }
               key={ i } />`
        when 'color'
          { title, items } = item

          `<CatalogFilterList_Color
              title={ title }
              items={ items }
              key={ i } />`
        else console.warn? 'Unknown item type of CatalogFilterList component', item

  showResults: ->
    console.log 'Displaying filtered results'

module.exports = CatalogFilterList