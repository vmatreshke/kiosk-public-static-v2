###* @jsx React.DOM ###

window.InstagramFeed_Controllable_v2 = React.createClass
  propTypes:
    isVisible: React.PropTypes.bool.isRequired
    clientId:  React.PropTypes.string.isRequired
    userId:    React.PropTypes.number.isRequired
    limit:     React.PropTypes.number

  getDefaultProps: ->
    limit: 10

  getInitialState: ->
    isVisible: @props.isVisible

  componentDidMount: ->
    $(document).on "instagram:clicked", @toggleVisibleState

  componentWillUnmount: ->
    $(document).off "instagram:clicked", @toggleVisibleState

  render: ->
    if @state.isVisible
      return `<InstagramFeed_v2 clientId={this.props.clientId} userId={this.props.userId} limit={this.props.limit} />`
    else
      return `<span/>`

  toggleVisibleState: -> @setState(isVisible: !@state.isVisible) if InstagramFeed_Mixin.STATE_LOADED

window.InstagramFeed_v2 = React.createClass
  mixins: [InstagramFeed_Mixin]

  propTypes:
    clientId: React.PropTypes.string.isRequired
    userId: React.PropTypes.number.isRequired
    limit: React.PropTypes.number

  getInitialState: ->
    currentState: @STATE_LOADING
    isVisible: false
    photos: null
    username: ''
    hashtag: ''

  componentDidMount: ->
    @_loadPhotos()

  render: ->
    result = switch @state.currentState
      when @STATE_LOADED  then `<InstagramFeed_v2_Feed photos={ this.state.photos } username={ this.state.username } />`
      when @STATE_LOADING then `<InstagramFeed_v2_Spinner/>`
      when @STATE_ERROR   then `<InstagramFeed_v2_Error/>`
      else console.warn 'Неизвестное состояние #{@state.currentState}'
    `<div>
      <h2 className="b-item-list__title b-instafeed-v2__title">{ this.state.hashtag }</h2>
      { result }
    </div>`

window.InstagramFeed_v2_Error = React.createClass
  render: ->
    `<div className='b-instafeed-v2 b-insafeed_error'>
      Ошибка при загрузке фотографий
    </div>`

window.InstagramFeed_v2_Spinner = React.createClass
  render: ->
    `<div className='b-instafeed-v2 b-instafeed-v2_loading'>
      <span className='b-instafeed-v2__loader'/>
    </div>`

window.InstagramFeed_v2_Feed = React.createClass
  propTypes:
    photos: React.PropTypes.array.isRequired
    username: React.PropTypes.string.isRequired

  render: ->
    that = @
    photos = _.map @props.photos, (photo) ->
      `<InstagramFeed_v2_Photo
        photo={photo.images}
        username={that.props.username}
        key={photo.id} />`

    return `<div className="b-instafeed-v2">{photos}</div>`

window.InstagramFeed_v2_Photo = React.createClass
  propTypes:
    photo: React.PropTypes.object.isRequired
    username: React.PropTypes.string.isRequired

  render: ->
    `<a className='b-instafeed-v2__photo' rel='nofollow' target='_blank' href={ 'http://instagram.com/' + this.props.username }>
      <img src={this.props.photo.low_resolution.url}/>
    </a>`
