###* @jsx React.DOM ###

window.InstagramFeed_Controllable = React.createClass
  propTypes:
    isVisible: React.PropTypes.bool.isRequired
    clientId:  React.PropTypes.string.isRequired
    userId:    React.PropTypes.number.isRequired
    limit:     React.PropTypes.number

  getInitialState: ->
    isVisible: @props.isVisible

  componentDidMount: ->
    $(document).on "instagram:clicked", @toggleVisibleState

  componentWillUnmount: ->
    $(document).off "instagram:clicked", @toggleVisibleState

  render: ->
    if @state.isVisible
      return `<InstagramFeed clientId={this.props.clientId} userId={this.props.userId} limit={this.props.limit} />`
    else
      return `<span/>`

  toggleVisibleState: -> @setState(isVisible: !@state.isVisible) if InstagramFeed_Mixin.STATE_LOADED

window.InstagramFeed = React.createClass
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
    switch @state.currentState
      when @STATE_LOADED  then `<InstagramFeed_Carousel photos={ this.state.photos } />`
      when @STATE_LOADING then `<InstagramFeed_Spinner/>`
      when @STATE_ERROR   then `<InstagramFeed_Error/>`
      else console.warn 'Неизвестное состояние #{@state.currentState}'

window.InstagramFeed_Error = React.createClass
  render: ->
    `<div className='b-instafeed b-insafeed_error'>
      Ошибка при загрузке фотографий
    </div>`

window.InstagramFeed_Spinner = React.createClass
  render: ->
    `<div className='b-instafeed b-instafeed_loading'>
      <span className='b-instafeed__loader'/>
    </div>`

window.InstagramFeed_Photo = React.createClass
  propTypes:
    photo: React.PropTypes.object.isRequired

  render: ->
    `<a className='b-instafeed__photo' href={this.props.photo.standard_resolution.url}>
      <img className='lazyOwl' data-src={this.props.photo.low_resolution.url}/>
    </a>`


window.InstagramFeed_Carousel = React.createClass
  propTypes:
    photos: React.PropTypes.array.isRequired

  componentDidMount: ->
    @_initCarousel()

  componentWillUnmount: ->
    @_destroyCarousel()

  render: ->
    photos = _.map @props.photos, (photo) ->
      `<InstagramFeed_Photo
        photo={photo.images}
        key={photo.id} />`

    return `<div className="b-instafeed">{photos}</div>`

  _initCarousel: ->
    $(@getDOMNode()).owlCarousel
      items: 6
      itemsDesktop: 6
      pagination: false
      autoPlay: 5000
      navigation: true
      lazyLoad: true

  _destroyCarousel: ->
    $(@getDOMNode()).data('owlCarousel').destroy()


