class Message < ApplicationRecord
  belongs_to :conversation
  validates_inclusion_of :kind, :in => ["outgoing", "incoming"], allow_nil: false


end