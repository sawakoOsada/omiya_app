module CartInMacros
  def cart_in
    visit souvenirs_path(souvenir.id)
    fill_in '数量', with: '1'
    click_on 'カートに入れる'
  end
end
