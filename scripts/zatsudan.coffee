# Description
#   A Hubot script that calls the docomo dialogue API
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_DOCOMO_DIALOGUE_API_KEY
#
# Commands:
#   hubotさん <message> - 雑談対話(docomo API)
#
module.exports = (robot) ->
  status = {}
  robot.respond /さん\s*(.*)/, (res) ->
    message = res.match[1]
    d = new Date
    now = d.getTime()
    options =
    # don't verify server certificate against a CA, SCARY!
      rejectUnauthorized: false

    res
      .http('https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue', options)
      .query(APIKEY: process.env.HUBOT_DOCOMO_DIALOGUE_API_KEY)
      .header('Content-Type', 'application/json')
      .post(JSON.stringify({ utt: message, context: status['id'], mode: status['mode'], t: status['t'] })) (err, response, body) ->
        if err?
          console.log "Encountered an error #{err}"
          res.send "error"
        else
          res.send JSON.parse(body).utt
          status =
            "time": now
            "id": JSON.parse(body).context
            "mode": JSON.parse(body).mode
