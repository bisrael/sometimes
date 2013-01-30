# Baseline setup
# --------------
inNode = typeof global isnt "undefined"
# Establish the root object, `window` in the browser, or `exports` or `global` on the server.
root = if inNode then global else @
rand = Math.random

require 'coffee-script' if inNode

# OH SO FUN HELPERS!
#
# RANDOMLY EXECUTES A BLOCK X percent OF THE TIME
#
# TEST WITH
#
# i = 0
# 100000.times ->
#   75.percent_of_the_time ->
#     i += 1
# i
#
# 40.percent_of_the_time ->
# 40..percent_of_the_time(function(){ // for javascript
Number::percentOfTheTime = (callback) ->
	throw "Cannot call percentOfTheTime more than 100 or less than 0" if @ < 0 or @ > 100
	do callback if rand() * 100 <= @

Number::times = (callback) ->
	return if not @
	throw "Times cannot be called on a number less than 0" if @ < 0
	do callback for [1..@]

# [3,6].times ->
Array::times = (callback) ->
	throw "Times must be called on an array of length 2" if @length < 2 or @length > 2
	max = ~~(rand()*(@[1] - @[0]))+@[0]
	do callback for [0..max]

# half_the_time ->
# sometimes ->
root.halfOfTheTime = root.sometimes = (callback) ->	50.percentOfTheTime callback
root.rarely = (callback) ->	5.percentOfTheTime callback
root.mostly = (callback) ->	95.percentOfTheTime callback