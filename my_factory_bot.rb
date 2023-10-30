class MyFactoryBot
  def self.define(&block)
    instance_exec(&block)
  end

  def self.factory(_model_sym, &block)
    @factory = MyFactory.new
    @factory.instance_exec(&block)
  end

  def self.create(_model_sym)
    @factory.user
  end
end

class MyFactory
  attr_reader :user

  def initialize
    @user = User.new
  end

  def method_missing(attr, *_args, &block)
    @user.send("#{attr}=", block.call)
  end
end

MyFactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Smith' }
    # email { 'john.smith@example.com' }
  end
end

user = MyFactoryBot.create(:user)
puts user.class.name
puts "First name: #{user.first_name}"
puts "Last name: #{user.last_name}"
