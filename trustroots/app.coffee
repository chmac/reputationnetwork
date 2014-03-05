Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'home',
    path: '/'
    template: 'home'

Router.map ->
  @route 'rate',
    path: '/rate'
    template: 'rate'
