if typeof global isnt "undefined"
	require '../lib/sometimes.coffee'

describe 'sometimes', ->
	it 'should just assert some stuff', -> expect(true).toBe(true)
	it 'should do stuff 25 to 50 times', ->
		i = 0
		[25,50].times -> i += 1
		expect(i).toBeGreaterThan(24)
		expect(i).toBeLessThan(51)

	it 'should do stuff 75 percent of the time', ->
		i = 0
		100000.times ->	75.percentOfTheTime ->	i += 1
		expect(i).toBeGreaterThan(73000)
		expect(i).toBeLessThan(76000)

	it 'should do stuff rarely', ->
		i = 0
		100000.times -> rarely -> i += 1
		expect(i).toBeLessThan(8000)

	it 'should do stuff most of the time', ->
		i = 0
		100000.times ->	mostly ->	i += 1
		expect(i).toBeGreaterThan(90000)

	it 'should do stuff 99 percent of the time', ->
		i = 0
		100000.times -> 99.percentOfTheTime -> i += 1
		expect(i).toBeGreaterThan(97000)

	it 'should do stuff 1 percent of the time', ->
		i = 0
		100000.times -> 1.percentOfTheTime -> i += 1
		expect(i).toBeLessThan(1100)