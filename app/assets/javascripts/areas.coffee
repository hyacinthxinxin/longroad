# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'turbolinks:load', ->
  console.log(localStorage.getItem('current_device_tab'))
  if hash = localStorage.getItem('current_device_tab')
    $('a[href="#' + hash + '"]').tab('show')
  else
    $('a[href="#device-scene"]').tab('show')

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) ->
    localStorage.setItem('current_device_tab', $(e.target).attr("href").substr(1))
    console.log(localStorage.getItem('current_device_tab'))
  )