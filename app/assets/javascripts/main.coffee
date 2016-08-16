document.addEventListener 'turbolinks:load', ->
  componentHandler.upgradeDom()
  ajaxDiscussion()

@addEventListener "popstate", (e)->
  Turbolinks.visit(e.target.location)

ajaxDiscussion = ->
  $('#morediscs').click ->

    xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = ->
      if (xhttp.readyState == 4 && xhttp.status == 200)
        $(xhttp.responseText).appendTo( ".page-content" )
    xhttp.open "GET", "/the_discussions/index/2", true
    xhttp.send()
