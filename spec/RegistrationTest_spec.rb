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
    choose(:user_color_green)
    check(:user_fruit_pear)
    select('House', :from => :user_music)
    select('English', :from => :user_language)
    choose(:user_pill_red)
    check(:user_choises_d)
    fill_in(:user_friends, :with => '123')
    find(:id, 'user_mood').set 90
    select('08', :from => :user_awake_4i)
    select('07', :from => :user_awake_5i)
    select('2022', :from => :user_first_kiss_1i)
    choose(:user_active_true)
    check(:user_terms)
    find(:xpath, "//input[contains(@name, 'commit')]").click
    page.first(:xpath, '//span[text()="Success"]').text.should match('SUCCESS')
    page.first(:xpath, '//p[text()="Form is valid"]').text.should match('Form is valid')
  end
end
