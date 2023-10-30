class MyFactoryBot
  def self.define(&block)
    instance_exec(&block)
  end

  def self.factory(model_sym); end

  def self.create(model_sym); end
end

MyFactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Smith' }
  end
end

user = MyFactoryBot.create(:user)
# puts "First name: #{user.first_name}"
# puts "Last name: #{user.last_name}"
