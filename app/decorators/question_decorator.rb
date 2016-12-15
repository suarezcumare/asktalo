class QuestionDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

 attr_reader :question


  def initialize(question)
    @question = question
  end

  def method
    question.created_at > 2.days.ago
  end

  def method_missing(method_name, *args, &block)
    question.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    question.respond_to?(method_name, include_private) || super
  end
	
end
