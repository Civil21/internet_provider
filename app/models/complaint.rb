class Complaint < ApplicationRecord
  belongs_to :consumer, optional: true
  belongs_to :employee, optional: true
  has_one :solved
  has_many :solveds


  enum state: {
    open: 0,
    in_process: 1,
    close_consumer: 2,
    close_without_resolved: 3,
    resolved: 4
  }

  states.each do |state, value|
    scope state.pluralize.to_sym, -> {where(state: value)}
  end

  def name
    "#{id}"
  end
end
