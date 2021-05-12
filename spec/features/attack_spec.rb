# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
feature 'attack player 2' do
  scenario 'attack p2 and get confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "You connect an uppercut on Jay!"
  end
end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10
feature 'reduce hit points' do
  scenario 'attack button reduces p2 hit points by 10' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content "Jay's hit points 100"
    expect(page).to have_content "Jay's hit points 90"
  end
end
