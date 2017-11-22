class Project < ApplicationRecord
	belongs_to :user
	has_many :votes

	validates :project_title, presence: true
   	validates :project_description, presence: true 
    validates :location, presence: true
    validates :fund_goal, presence: true
    validate :start_date_should_be_after_today
    validate :end_date_at_least_same_with_start_date

    def self.search(search)
          where("project_title ILIKE ? OR project_description ILIKE ?", "%#{search}%","%#{search}%") 
    end

    def start_date_should_be_after_today
        if start_date <= Date.today
          errors.add(:start_date, "Can't be in the past or today.")
        end
    end

    def end_date_at_least_same_with_start_date
        if end_date < start_date
            errors.add :end_date, "Can't be earlier than start date"
        end
    end
end