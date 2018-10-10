require 'spec_helper'

feature 'Admin controller' do

  #---------- Checking the login scenarios/cases for admin
  scenario 'Login  with valid email and password' do
    login_page 'admin@gmail.com', 'abc123'
    expect(page).to have_content('New')
  end

  scenario 'with invalid email and password' do
    login_page 'valid@example.com', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank email' do
    login_page '', 'abc123'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    login_page 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  scenario 'with blank email and password' do
    login_page '', ''

    expect(page).to have_content('Log in')
  end

  def login_page(email,password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    # fill_in 'realtor_password', with: password
    # fill_in 'Confirmation', with: confirmation
    click_button 'Log in'
  end

  #---------- Checking the sign up link
  scenario 'Link to sign up' do
    sign_up
    expect(page).to have_content('New Realtor Account')
  end

  def sign_up
    visit login_path
    click_link 'Sign up now!'
  end

#_____________________Realtors______________________#

  #---------- Checking the listing of realtors
  scenario 'Checking the listing of realtors' do
    list_realtor_page
    expect(page).to have_content('Profile')
  end

  def list_realtor_page
    visit admins_path
    click_link 'List Realtors'
  end

  #---------- Checking the sign up for new realtor
  scenario 'Checking realtor sign up page' do
    sign_up_realtor_page
    expect(page).to have_content('New Realtor')
  end

  def sign_up_realtor_page
    visit signup_path
    click_link 'New Realtor Account'
  end

  #---------- Checking if the new realtor gets added through the Realtor Creation page
  scenario 'Checking if a new realtor is added' do
    new_realtor_page 'admin@gmail.com', 'admin',"abc1234","abc1234","0123456879","Wilson Apartments"
    expect(page).to have_content('Profile')
  end

  def new_realtor_page(email,name,password,confirmation,phone,company)
    visit new_realtor_url
    fill_in 'Email', with: email
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    fill_in 'Confirmation', with: confirmation
    fill_in 'Confirmation', with: phone
    fill_in 'Company', with: company
    click_button 'Create Realtor'
  end

  #---------- Checking Realtor's account for Admin
  scenario 'Checking Realtor''s account for Admin' do
    admin_realtor_page
    expect(page).to have_content('Profile')
  end

  def admin_realtor_page
    visit admins_path
    click_link 'Realtor''s account'
  end


  #_____________________House Hunters______________________#

  #---------- Checking the sign up for House Hunter
  scenario 'Checking House Hunter sign up page' do
    sign_up_hh_page
    expect(page).to have_content('New House Hunter')
  end

  def sign_up_hh_page
    visit signup_path
    click_link 'New House Hunter Account'
  end

  #---------- Checking the listing of House Hunters
  scenario 'Checking the listing of House Hunters' do
    hh_list_page
    expect(page).to have_content('House')
  end

  def hh_list_page
    visit admins_path
    click_link 'List House Hunters'
  end

  #---------- Checking if the new house hunter gets added through the HH Creation page
  scenario 'Checking if a new House Hunter is added' do
    new_hh_page 'admin@gmail.com', 'admin',"abc1234","abc1234","0123456879","Email"
    expect(page).to have_content('Profile')
  end

  def new_hh_page(email,name,password,confirmation,phone,contact)
    visit new_realtor_url
    fill_in 'Email', with: email
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    fill_in 'Confirmation', with: confirmation
    fill_in 'Confirmation', with: phone
    fill_in 'Company', with: contact
    click_button 'Create House Hunter'
  end

  #---------- Checking House Hunter's account for Admin
  scenario 'Checking House Hunters''s account for Admin' do
    admin_hh_page
    expect(page).to have_content('Profile')
  end

  def admin_hh_page
    visit admins_path
    click_link 'House Hunter''s account'
  end


end