module CartInMacros
  def cart_in(item, quantity)
    visit souvenir_path(item.id)
    fill_in 'souvenir_quantity', with: quantity
    click_on 'カートに入れる'
  end
end
