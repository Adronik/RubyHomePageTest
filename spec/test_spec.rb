feature 'Registration test' do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  after(:each) do
    page.driver.quit
  end

  scenario 'Fill in all mandatory fields for registration and click Create new user button', js: true  do
    visit 'http://simple-form-bootstrap.plataformatec.com.br/examples/vertical'
    fill_in(:user_name, :with => 'Alexander')
    fill_in(:user_email, :with => 'kjkb@jkkj.com')
    fill_in(:user_password, :with => 'Aqwerty123!')
    attach_file(:user_avatar, Rails.root + 'tmp/768px-LEGO_logo.svg.png')
    fill_in(:user_bio, :with => "I don't know what to say in bio I don't know what to say in bio I don't know what to say in bio I don't know what to say in bio")
    select('2022', :from => :user_birthday_1i)
    click_button 'Мне повезёт!'
    expect(page).to have_title('Google')
  end
end
