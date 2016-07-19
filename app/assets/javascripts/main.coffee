ready = ->
  componentHandler.upgradeDom()

document.addEventListener('turbolinks:load', ready)
