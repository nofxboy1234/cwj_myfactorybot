class MyFactoryBot
  def self.define(&block)
    instance_exec(&block)
  end

  def self.factory(_model_sym, &block)
    factory = MyFactory.new
    factory.instance_exec(&block)
  end

  def self.create(model_sym); end
end

class MyFactory
  def first_name; end

  def last_name; end
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
