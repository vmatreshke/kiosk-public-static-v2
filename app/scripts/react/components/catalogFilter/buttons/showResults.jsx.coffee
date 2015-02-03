###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilter_ShowResultsButton = React.createClass

  propTypes:
    onClick: PropTypes.func.isRequired

  render: ->
   `<button className="b-btn b-full-filter__submit"
            onClick={ this.props.onClick }>
      Показать
    </button>`

module.exports = CatalogFilter_ShowResultsButton