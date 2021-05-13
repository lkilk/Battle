feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'GLADIATORS!Are You Ready For Battle!?'
  end
end

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them

feature 'Inputting Players names' do
  scenario 'Players submit names and then see them on screen' do
    sign_in_and_play
    expect(page).to have_content 'Liam vs. Jay'
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points
feature 'view p1 hit points' do
  scenario 'Player 1 hit points are visible' do
    sign_in_and_play
    expect(page).to have_content "Liam's hit points 100"
  end
end

feature 'view p2 hit points' do
  scenario 'Player 2 hit points are visible' do
    sign_in_and_play
    expect(page).to have_content "Jay's hit points 100"
  end
end

feature 'player can lose' do
  context 'When HP reached 0, receive lose message' do
    before do
    sign_in_and_play
    # 20.times do gameplay
    # end
    # endgame
    gameplay
    allow(Kernel).to receive(:rand).and_return(100)
  endgame
    expect(page).to have_content "Jay loses!"
  end
  # scenario 'Player 2 loses' do
  #   click_button 'Attack'
  #   # expect(page).not_to have_content "You dropkick Liam in the face!"
  #   expect(page).to have_content "Jay loses!"
  #   end
  end
end
