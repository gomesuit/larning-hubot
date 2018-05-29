# Description:
#  Execute a shell command.
#
# Dependencies:
#  None
#
# Configuration
#  Change the script if you want to exeute a different command
#
# Commands:
#  hubot exec <command>
#  hubot spawn <command>
#  hubot args <arg1> <arg2>
#

child_process = require('child_process')

module.exports = (robot) ->
 robot.respond /exec (.*)$/i, (msg) ->
    command = msg.match[1]
    msg.send "This is the command #{command}."
    command = 'du -sh /'

    child_process.exec command, (error, stdout, stderr) ->
      if error
        msg.send stderr
      else
        msg.send stdout

 robot.respond /spawn (.*)$/i, (msg) ->
    command = msg.match[1]
    msg.send "This is the command #{command}."

    result = child_process.spawn('du', ['-sh', '/'])
    result.stdout.on 'data', (data) ->
      msg.send 'stdout: ' + data
    result.stderr.on 'data', (data) ->
      msg.send 'stderr: ' + data

 robot.respond /args (.*) (.*)$/i, (msg) ->
    arg1 = msg.match[1]
    arg2 = msg.match[2]
    msg.send "#{arg1} #{arg2}"
