# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#event_postcode").jpostal({
    postcode : [ "#event_postcode" ],
    address  : {
                  "#event_prefecture_code" : "%3",
                  "#event_address_city" : "%4",
                  "#event_address_street" : "%5%6%7"
                }
  });