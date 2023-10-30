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

  def first_name(&block)
    @user.send('first_name=', block.call)
  end

  def last_name(&block)
    @user.send('last_name=', block.call)
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
