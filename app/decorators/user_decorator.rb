class UserDecorator <  Draper::Decorator
  delegate_all

  def menu
      h.render partial: 'layouts/menu/nav_user'
  end



end
