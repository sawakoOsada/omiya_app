module CartInMacros
  def cart_in
    visit souvenir_path(souvenir.id)
    fill_in 'souvenir_quantity', with: '1'
    click_on 'カートに入れる'
  end
end
