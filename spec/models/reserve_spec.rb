require 'rails_helper'

RSpec.describe Reserve, type: :model do
  let(:open_at)        { Time.current.change(hour: 10) }
  let(:restaurant)     { create(:restaurant) }
  let(:table)          { create(:table, restaurant: restaurant) }
  let!(:reserve) { create(:reserve, table: table,
                          start_at: open_at,
                          end_at: open_at + 1.hour)
  }

  it "valid reserve time" do
    start_at = reserve.end_at + 2.hour
    end_at   = start_at + 1.hour

    expect(build(:reserve, table: table, start_at: start_at, end_at: end_at)).to be_valid
  end

  it "invalid reserve time - equal first reserve" do
    start_at = reserve.start_at
    end_at   = reserve.end_at

    expect(build(:reserve, table: table, start_at: start_at, end_at: end_at)).not_to be_valid
  end

  it "invalid reserve time - cross first reserve" do
    start_at = reserve.start_at + 30.minutes
    end_at   = reserve.end_at + 30.minutes

    expect(build(:reserve, table: table, start_at: start_at, end_at: end_at)).not_to be_valid
  end


  it "valid restaurant working_hours" do
    start_at = reserve.start_at + 3.hours
    end_at   = reserve.end_at + 3.hours

    expect(build(:reserve, table: table, start_at: start_at, end_at: end_at)).to     be_valid
  end

  it "invalid with restaurant working_hours" do
    start_at = open_at - 1.hour
    end_at   = start_at + 1.hours

    expect(build(:reserve, table: table, start_at: start_at, end_at: end_at)).not_to be_valid
  end
end