###* @jsx React.DOM ###

DesignSettingsMixin           = require './mixins/designSettings'
DesignSettings_Color          = require './common/color'
DesignSettings_Checkbox       = require './common/checkbox'
DesignSettings_SaveButton     = require './buttons/save'
DesignSettings_PageBackground = require './pageBackground'
DesignSettings_FeedOpacity    = require './feedOpacity'
DesignSettings_Font           = require './font'
DesignSettings_FontSize       = require './fontSize'
DesignSettings_ProductLayout  = require './productLayout'
DesignSettings_ProductsInRow  = require './productsInRow'
{ PropTypes } = React

#TODO: i18n
DESIGN_SETTINGS_TITLE = 'Управление дизайном'

DesignSettings = React.createClass
  mixins: [DesignSettingsMixin]

  propTypes:
    pageColor:           PropTypes.object.isRequired
    pageBackground:      PropTypes.object.isRequired
    feedColor:           PropTypes.object.isRequired
    feedOpacity:         PropTypes.object.isRequired
    font:                PropTypes.object.isRequired
    fontColor:           PropTypes.object.isRequired
    fontSize:            PropTypes.object.isRequired
    activeElementsColor: PropTypes.object.isRequired
    productLayout:       PropTypes.object.isRequired
    catalog:             PropTypes.object.isRequired
    productsInRow:       PropTypes.object.isRequired
    mainPage:            PropTypes.object.isRequired

  getInitialState: ->
    initialSettings = Object.keys(@props).reduce (previous, current) =>
      previous[current] = @props[current].value
      previous
    , {}

    settings: initialSettings

  render: ->
    `<div className="b-design-option">
      <div className="b-design-option__title">
        { DESIGN_SETTINGS_TITLE }
      </div>
      <div className="b-design-option__close" />
      <div className="b-design-option__body">
        <DesignSettings_Color
            title={ this.props.pageColor.title }
            optionName={ this.props.pageColor.optionName }
            value={ this.state.settings.pageColor }
            items={ this.props.pageColor.items }
            onChange={ this.updateSettings } />
        <DesignSettings_PageBackground
            title={ this.props.pageBackground.title }
            optionName={ this.props.pageBackground.optionName }
            value={ this.state.settings.pageBackground }
            items={ this.props.pageBackground.items }
            onChange={ this.updateSettings } />
        <DesignSettings_Color
            title={ this.props.feedColor.title }
            optionName={ this.props.feedColor.optionName }
            value={ this.state.settings.feedColor }
            items={ this.props.feedColor.items }
            onChange={ this.updateSettings } />
        <DesignSettings_FeedOpacity
            title={ this.props.feedOpacity.title }
            optionName={ this.props.feedOpacity.optionName }
            value={ this.state.settings.feedOpacity }
            onChange={ this.updateSettings } />
        <DesignSettings_Color
            title={ this.props.fontColor.title }
            optionName={ this.props.fontColor.optionName }
            value={ this.state.settings.fontColor }
            items={ this.props.fontColor.items }
            onChange={ this.updateSettings } />
        <DesignSettings_Color
            title={ this.props.activeElementsColor.title }
            optionName={ this.props.activeElementsColor.optionName }
            value={ this.state.settings.activeElementsColor }
            items={ this.props.activeElementsColor.items }
            onChange={ this.updateSettings } />
        <DesignSettings_Font
            title={ this.props.font.title }
            optionName={ this.props.font.optionName }
            value={ this.state.settings.font }
            items={ this.props.font.items }
            onChange={ this.updateSettings } />
        <DesignSettings_FontSize
            title={ this.props.fontSize.title }
            optionName={ this.props.fontSize.optionName }
            value={ this.state.settings.fontSize }
            from={ this.props.fontSize.from }
            to={ this.props.fontSize.to }
            onChange={ this.updateSettings } />
        <DesignSettings_ProductLayout
            title={ this.props.productLayout.title }
            optionName={ this.props.productLayout.optionName }
            value={ this.state.settings.productLayout }
            items={ this.props.productLayout.items }
            onChange={ this.updateSettings } />
        <DesignSettings_Checkbox
            title={ this.props.catalog.title }
            optionName={ this.props.catalog.optionName }
            value={ this.state.settings.catalog }
            items={ this.props.catalog.items }
            onChange={ this.updateSettings } />
        <DesignSettings_ProductsInRow
            title={ this.props.productsInRow.title }
            optionName={ this.props.productsInRow.optionName }
            value={ this.state.settings.productsInRow }
            from={ this.props.productsInRow.from }
            to={ this.props.productsInRow.to }
            onChange={ this.updateSettings } />
        <DesignSettings_Checkbox
            title={ this.props.mainPage.title }
            optionName={ this.props.mainPage.optionName }
            value={ this.state.settings.mainPage }
            items={ this.props.mainPage.items }
            onChange={ this.updateSettings } />
      </div>
      <DesignSettings_SaveButton onClick={ this.saveSettings } />
    </div>`

  updateSettings: (optionName, optionValue) ->
    newSettings = @state.settings
    newSettings[optionName] = optionValue

    @setState(settings: newSettings)

  saveSettings: ->
    console.log 'saveSettings', @state.settings

module.exports = DesignSettings