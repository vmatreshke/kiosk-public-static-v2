###* @jsx React.DOM ###

DesignSettings_Range = require './common/range'
{ PropTypes } = React

DesignSettings_FeedOpacity = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    optionName: PropTypes.string.isRequired
    value:      PropTypes.number.isRequired
    onChange:   PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <span className="b-design-option__item__name">
        { this.props.title }
      </span>
      <div className="b-design-option__item__val">
        <DesignSettings_Range
            value={ this.props.value }
            onChange={ this.handleChange } />
      </div>
    </div>`

  handleChange: (opacity) ->
    @props.onChange @props.optionName, opacity

module.exports = DesignSettings_FeedOpacity