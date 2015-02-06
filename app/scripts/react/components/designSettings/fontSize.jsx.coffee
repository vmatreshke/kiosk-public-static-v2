###* @jsx React.DOM ###

DesignSettings_Range = require './common/range'
{ PropTypes } = React

DesignSettings_FontSize = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    optionName: PropTypes.string.isRequired
    value:      PropTypes.number.isRequired
    from:       PropTypes.number.isRequired
    to:         PropTypes.number.isRequired
    onChange:   PropTypes.func.isRequired

  render: ->
    `<div className="b-design-option__item">
      <span className="b-design-option__item__name">
        { this.props.title }
      </span>
      <div className="b-design-option__item__val">
        <DesignSettings_Range
            value={ this.props.value }
            from={ this.props.from }
            to={ this.props.to }
            step={ 1 }
            onChange={ this.handleChange } />
      </div>
    </div>`

  handleChange: (fontSize) ->
    @props.onChange @props.optionName, fontSize

module.exports = DesignSettings_FontSize