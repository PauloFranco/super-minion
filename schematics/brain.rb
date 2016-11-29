require 'discordrb'
require 'dotenv'
Dotenv.load


bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: 245229699507159043, prefix: '!', advanced_funcionality: true

bot.bucket :version, limit: 3, time_span: 60, delay: 10
bot.bucket :repo, limit: 3, time_span: 60, delay: 10
bot.bucket :bug, limit: 3, time_span: 60, delay: 10
bot.bucket :curse, limit: 3, time_span: 60, delay: 10
bot.bucket :wowhead, limit: 2, time_span: 60, delay: 10
bot.bucket :fun, limit: 3, time_span: 60, delay: 10


bot.command :alpha, bucket: :version, description: 'Teach miserable whelps the way to being test subjects' do |event|
  event.respond 'The latest alpha version can be downloaded at https://github.com/FailcoderAddons/supervillain-ui'
end

bot.command :repo, bucket: :repo, description: 'Displays master\'s hidden stash of loot. To steal it, press the green download button, download it as zip and extract it, delete all SVUI folders on wow/interface/addons, and put your new folders there.' do |event|
  event.respond 'Super Villain UI is being maintained at https://github.com/FailcoderAddons/supervillain-ui'
end

bot.command :bug, bucket: :bug,  description: 'Points out where to take the nasties' do |event|
  event.respond 'Bugs can be reported on the appropriate channels via Discord  (#bug-reports or #bug-reports-critical) and also via github: https://github.com/FailcoderAddons/supervillain-ui/issues'
end

bot.command :curse, bucket: :curse, description: 'Release a curse of doom upon your foes (link to curse version)' do |event|
  event.respond 'You can download SVUI from curse via: https://mods.curse.com/addon-packs/wow/supervillain-ui-complete'
end

bot.command :wowhead, bucket: :wowhead, description: 'Makes me go fetch your evil plans for you' do |event, *query|
  event.respond 'http://www.wowhead.com/search?q='+ query.join('+')
end

bot.command :banana, bucket: :fun, help_available: false do |event|


last_roll = 1
last_last_roll = 2
random = rand(1..10)
while (random == last_roll || random==last_last_roll)
random = rand(1..10)
end
last_last_roll = last_roll
last_roll = random
case random

when 1
  event.respond 'I will wake up our dark overlord from his endless sleep for you. *Maybe* he will not kill you for doing that.'
when 2
  event.respond 'You just called villain anonymous dating hotline. Your princess will be kidnaped and brought to you shortly.'
when 3
  event.respond 'My favourite digimon is pikachu. His best ability is kamehameha.'
when 4
  event.respond 'You have just subscribed to *please kill me randomly*. Your death will come swiftly *soon*. Or will it? :wink:'
when 5
  event.respond 'Ring ring ring ring ring ring ring bananaphone!'
when 6
  event.respond "I once had a pet ogre named Mr. Fluffy. That's because he used to smush my enemies to death with his club."
when 7
  event.respond 'There is no place like my secret dungeon of endless torment.'
when 8
  event.respond 'I once went on a tinder date with this cute mortal. It was all going really well untill she managed to untie herself and run from my basement.'
when 9
  event.respond "Today is a good day for mass enslavement."
when 10
  event.respond "997 cuts... 998 cuts... 999 cuts... 1000! Whew, it feels so good when you finish your flayling routine."
end
end

bot.run  :async

bot.update_status 'Online', 'use !help', nil

bot.sync
