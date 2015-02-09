###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_ColorItem = React.createClass

  propTypes:
    hexCode:  PropTypes.string.isRequired
    checked:  PropTypes.bool.isRequired
    onChange: PropTypes.func.isRequired

  render: ->
    itemStyles = backgroundColor: @props.hexCode

    return `<label className="b-design-option__color">
              <input type="radio"
                     checked={ this.props.checked }
                     onChange={ this.handleChange } />
             <span className="b-design-option__color__ind"
                   style={ itemStyles } />
           </label>`

  handleChange: ->
    @props.onChange @props.hexCode

module.exports = DesignSettings_ColorItem