
desc 'this is the default task'
task 'default', ['test']

desc 'spec task'
task 'test', ->	jake.exec 'jasmine-node --coffee spec/', ->
	console.log 'All Test Passed'
,	printStdout:true, printStderr:true