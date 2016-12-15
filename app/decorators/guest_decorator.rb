class GuestDecorator < Draper::Decorator

  decorates Guest
  delegate_all

  def menu
    h.render partial: 'layouts/menu/nav_guest'
  end


end
