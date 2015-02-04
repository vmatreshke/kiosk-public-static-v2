###* @jsx React.DOM ###

{ PropTypes } = React

Tooltip = React.createClass

  propTypes:
    title:    PropTypes.string
    url:      PropTypes.string
    position: PropTypes.shape(
      left: PropTypes.number
      top:  PropTypes.number
    ).isRequired

  getDefaultProps: ->
    title: 'Показать'
    url:   '#'

  render: ->
    `<div className="b-tooltip">
      { this.props.title } <a href={ this.props.url }>12 вариантов</a>
    </div>`

module.exports = Tooltip