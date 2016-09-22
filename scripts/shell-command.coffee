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
#  hubot shell <command>
#

module.exports = (robot) ->
 robot.respond /shell (.*)$/i, (msg) ->
    command = msg.match[1]
    @exec = require('child_process').exec
    msg.send "This is the command #{command}."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

