document.addEventListener 'turbolinks:load', ->
  componentHandler.upgradeDom()
  ajax()

@addEventListener "popstate", (e)->
  Turbolinks.visit(e.target.location)

ajax = ->

  ie = 2
  $('#morediscs').click ->
    $.get "/the_discussions/index/#{ie.toString()}", (html)->
      readyhtml = ""
      splitarray = html.split '<tr>'
      splitarray[0] = ''
      splitarray[splitarray.length - 1] = splitarray[splitarray.length - 1].split('</tr>')[0]
      for i in [0...splitarray.length]
        if i != 0
          readyhtml += '<tr>' + splitarray[i]
      readyhtml += '</tr>'
      $('#append').append readyhtml
      ie += 1

  $('.newDisc').click ->
    disc = $('#the_discussion_topic').val().replace(/\s+/g, " ").trim()
    if (disc.length > 10 && disc.length < 100)
      $('#append').prepend "<tr class = \"hide\"><td class=\"mdl-data-table__cell--non-numeric disc\"><a href = \"\">#{disc}</a></td></tr>"
      $('.hide').show('slow')
    else
      if (!$('.hide.red').length)
        $('#append').prepend "<tr class = \"hide red\"><td class=\"mdl-data-table__cell--non-numeric disc\">Your topic is either too long or too short</td></tr>"
      $('.hide').stop().show(1000).delay(4000).hide(1000)
