def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Liam'
  fill_in :player_2_name, with: 'Jay'
  click_button 'Submit'
end

def gameplay
  click_button 'Attack'
  click_button 'Return to game'
end

def endgame
  click_button 'Attack'
end
