require('capybara/rspec')
require('./app')
Capybara.app=Sinatra::Application
set(:show_exceptions, false)

describe('the wordify case path', {:type => :feature}) do
  it('processes an integer up 999999999999999 and returns the english-text version') do
    visit('/')
    fill_in('input', :with => '1000001')
    click_button('Wordify!')
    expect(page).to have_content('one million one')
  end
end
