require 'wit'
require 'singleton'

class WitExtension
  include Singleton

  def initializer
    access_token = "7DO5OGFBNMKCLW57NIIO5I7CS27RAJCU"
    actions = {
        send: -> (request, response) {
          PubnubExtension.instance.client.publish(message: response['text'], channel: @conversation.uid)
          puts("sending... #{response['text']}")
        },

        findTheater:  -> (request) {
          context = request["context"]
          entities = request["entities"]

          showTime = first_entity_value(entities, "datetime")
          movie = first_entity_value(entities, "movie")

          if showTime && movie
            theater = search_theaters(showTime, movie)
            context["showTime"] = showTime
            context["movie"] = movie
            context["theatre"] = theater
          elsif !showTime
            context["missingTime"] = true
          end

          return context
        }
    }

    @client = Wit.new(access_token: access_token, actions: actions)
  end


  def client
    return @client
  end

  def set_conversation(conversation)
    @conversation = conversation
  end

  private

  def first_entity_value(entities, entity)
    return nil unless entities.has_key? entity
    val = entities[entity][0]['value']
    return nil if val.nil?
    return val.is_a?(Hash) ? val['value'] : val
  end

  def search_theaters(showTime, movie)
    # perform search query magic
    puts "Searching for Theater..."
    return "Random Theater"
  end

end