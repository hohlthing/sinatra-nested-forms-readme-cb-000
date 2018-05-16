require_relative 'config/environment'
require_relative 'models/courses.rb'
require_relative 'models/students.rb'

class App < Sinatra::Base

  get '/' do
    erb :new
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:courses].each do |details|
      Course.new(details)
    end

    @courses = Course.all

    erb :student
  end

end
