class Tadpole < ActiveRecord::Base
  belongs_to :frog
  delegate :pond, to: :frog, allow_nil: true

  before_destroy :confirm_frog

  private

  def confirm_frog
    !Frog.find_by(name: self.name).nil?
  end

end
