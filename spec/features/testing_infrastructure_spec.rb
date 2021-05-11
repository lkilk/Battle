feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Gladiator! Are You Ready For Battle!?'
  end
end

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them

feature 'Inputting Players names' do
  scenario 'Players submit names and then see them on screen' do
    visit('/')
    fill_in :player_1_name, with: 'Liam'
    fill_in :player_2_name, with: 'Jay'
    click_button 'Submit'
    expect(page).to have_content 'Liam vs. Jay'
  end
end
