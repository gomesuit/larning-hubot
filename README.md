# slack-sample-hubiot


# 環境変数
```
export HUBOT_SLACK_TOKEN=XXXXXXXX-XXXXXXX
export HUBOT_LOG_LEVEL=debug
export HUBOT_JENKINS_URL="http://127.0.0.1:8080/"
# passwordの部分はtokenでもOK
export HUBOT_JENKINS_AUTH="username:password"
```

```
# コンソールで起動
bin/hubot

# botの名前を変更したい
bin/hubot -n <BOT_NAME>

# slack連携で起動
bin/hubot -a slack

# デーモンとして起動したい場合
npm install -g forever
npm install -g coffee-script
forever --minUptime 3000 --spinSleepTime 3000 start -c coffee node_modules/.bin/hubot -a slack
forever list

```



