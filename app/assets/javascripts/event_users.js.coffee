# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  event_user.setupForm()

event_user =
  setupForm: ->
    $('#new_event_user').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        event_user.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, event_user.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      alert(response.id)
      $('#event_user_stripe_card_token').val(response.id)
      $('#new_event_user')[0].submit()
    else
      alert(response.error.message)
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)