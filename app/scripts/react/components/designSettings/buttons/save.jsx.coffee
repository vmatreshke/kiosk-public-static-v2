###* @jsx React.DOM ###

{ PropTypes } = React

#TODO: i18n
BUTTON_TEXT = 'Сохранить'

DesignSettings_SaveButton = React.createClass

  propTypes:
    onClick: PropTypes.func.isRequired

  render: ->
    `<button className="b-design-option__save"
             onClick={ this.props.onClick }>
      { BUTTON_TEXT }
    </button>`

module.exports = DesignSettings_SaveButton