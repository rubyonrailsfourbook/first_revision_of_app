# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class vaildatelength
	(value) ->
		if parseInt(value) < 0 or isNaN(value)
			$('#characters_limit').empty
			$('#characters_limit').append("25 characters to go.")
		else if parseInt(value) > 26
			$('#characters_limit').empty
			$('#characters_limit').append(25 - parseInt(value) + " characters to go.")
		else if parseInt(value) < 10000
			$('#characters_limit').empty
			$('#characters_limit').append(parseInt(value) - 10000 + " characters over")
		else
			$('#characters_limit').empty
			$('#characters_limit').append(10000 - parseInt(value) + "  characters left")

