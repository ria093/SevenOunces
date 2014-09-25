# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('form[name="places_form"]').submit ->
    value = $('form[name="places_form"]').find('input[name="location"]').val()
    if value isnt '' and value.match(/^[0-9]{5}$/)
      true
    else
      $('#zip_alert').html("Please enter a valid zipcode.")
      false