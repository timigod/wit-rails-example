class ChatController < ApplicationController

  def start
    create_conversation
    add_channel_to_main_group
    render json: @conversation
  end

  def message
    validate_message_params
    set_conversation
    create_incoming_message(params[:message])
    WitClient.instance.client.run_actions(@conversation.uid, params[:message])
    puts "SENDING TO WIT #{params[:message]}"
  end

  private

  def validate_message_params
    param! :message, String, required: true
    param! :uid, String, required: true
  end

  def create_conversation
    @conversation = Conversation.create
    WitClient.instance.set_conversation(@conversation)
  end

  def add_channel_to_main_group
    PubnubClient.instance.client.channel_registration(action: :add, group: 'main', channel: @conversation.uid)
  end

  def create_incoming_message(message)
    create_message("incoming", message)
  end

  def create_message kind, message
    @message = @conversation.messages.create(
        body: message,
        kind: kind
    )
  end

  def set_conversation
    @conversation = Conversation.find_by_uid(params[:uid])
  end
end