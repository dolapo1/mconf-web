class Permission < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :subject, :polymorphic => true

  validates :user, :presence => true
  validates :subject, :presence => true
  # note: has to be role_id, not the association name (role)
  validates :role_id, :presence => true,
    :uniqueness => {:scope => [:user_id, :subject_id, :subject_type]}

  attr_accessible :role_id, :user_id

  # TODO: permissions
  # def title
  #   objective ?
  #     I18n.t(action, :scope => objective.underscore, :count => :other) :
  #     I18n.t(action)
  # end
  # def <=>(other)
  #   title <=> other.title
  # end
  # def to_array
  #   [action, objective].compact.map(&:to_sym)
  # end
end