require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'start_date_should_be_after_today' do
        subject { Project.new(end_date: 2.days.ago) }
      it {should_not allow_value(1.day.ago).
            for(:start_date)}
      end

    describe 'end_date_at_least_same_with_start_date' do
      subject { Project.new(start_date: 1.days.ago) }
      it {should_not allow_value(2.day.ago).
            for(:end_date)}
      end
end
