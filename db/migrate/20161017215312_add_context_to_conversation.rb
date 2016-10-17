class AddContextToConversation < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :context, :text
  end
end
