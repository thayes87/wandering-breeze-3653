class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def avg_contestant_exp 
    contestants.pluck(:years_of_experience).sum/contestant_count.to_f 
  end
end
