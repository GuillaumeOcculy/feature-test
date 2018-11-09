require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'user deletes' do
    User.create(name: 'plop')
    puts User.count
    visit root_path
    expect {
      click_link 'Destroy'
    }.to change(User, :count).by(-1)
    puts User.count
  end

  scenario 'project new', js: true do
    visit new_project_path
    form = find('#new_project')
    binding.pry
    find('.add_fields').click()

    find('.nested-fields')

    within(".nested-fields") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'caplin'
    end
    
  end
end
