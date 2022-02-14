# Method Question Controller
class QuestionsController < ApplicationController
  def ask; end

  def answer
    @answer = ['Great!', 'Silly question, get dressed and go to work!', "I don't care, get dressed and go to work!"]
    @question = params[:question]

    @answer = if @question == 'I am going to work'
                @answer.first
              elsif @question.include?('?')
                @answer[1]
              else
                @answer.last
              end
  end
end
