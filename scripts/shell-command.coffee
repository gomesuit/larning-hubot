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

child_process = require('child_process')

module.exports = (robot) ->
 robot.respond /shell (.*)$/i, (msg) ->
    command = msg.match[1]
    msg.send "This is the command #{command}."

    child_process.exec command, (error, stdout, stderr) ->
      if error
        msg.send stderr
      else
        msg.send stdout

 robot.respond /jenkins2 build (.*)$/i, (msg) ->
    url = process.env.HUBOT_JENKINS_URL
    jenkinscli = process.env.HUBOT_JENKINS_CLI_PATH
    identity = process.env.HUBOT_JENKINS_IDENTITY_PATH
    job = msg.match[1]
    command = "java -jar #{jenkinscli} -s #{url} -i #{identity} build #{job} -s -v"
    child_process.exec command, (error, stdout, stderr) ->
      if error
        msg.send stderr
      else
        msg.send stdout

 robot.respond /jenkins2 desc (.*)$/i, (msg) ->
    url = process.env.HUBOT_JENKINS_URL
    jenkinscli = process.env.HUBOT_JENKINS_CLI_PATH
    identity = process.env.HUBOT_JENKINS_IDENTITY_PATH
    job = msg.match[1]
    command = "java -jar #{jenkinscli} -s #{url} -i #{identity} get-job #{job}"

    child_process.exec command, (error, stdout, stderr) ->
      if error
        msg.send stderr
      else
        parser  = require 'xml2json'
        json = parser.toJson stdout
        content = JSON.parse(json)
        msg.send content.project.description

 robot.respond /jenkins2 list/, (msg) ->
    url = process.env.HUBOT_JENKINS_URL
    jenkinscli = process.env.HUBOT_JENKINS_CLI_PATH
    identity = process.env.HUBOT_JENKINS_IDENTITY_PATH
    command = "java -jar #{jenkinscli} -s #{url} -i #{identity} list-jobs"
    child_process.exec command, (error, stdout, stderr) ->
      if error
        msg.send stderr
      else
        msg.send stdout

