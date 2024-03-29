Given("there are grades in the gradebook") do
    @teacher = User.create(email: "teacher@teacher.com", password: "default123", account_id: 1)
    @eric = create(:grade, :valid)
    @tomai = create(:grade, :valid)
    @schweller = create(:grade, :valid)
    @wylie = create(:grade, :valid)
end

Given("I sign in") do
    visit new_user_session_path
    fill_in "user_email", with: @teacher.email
    fill_in "user_password", with: "default123"
    click_on "Log in"
end

When("I visit the homepage") do
    visit root_path
end

Then ("I click on a user's name") do
    click_on @eric.student_name
end

When("I click {string}") do |string|
    click_on string
end

When("I fill out the form and submit") do
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Create Grade"
end

Then("I should have added a grade") do
    expect(page).to have_content("Grade was successfully created.")
end

Then("that post should be deleted") do
    expect(page).to have_content("Grade was successfully destroyed")
end

Then("I should see everyone's grades") do
    @grades = Grade.all
    @grades.each do |g|
        expect(page.body).to include(g.student_id)
    end
end


Then("I should see that user's detailed grade information") do
    expect(page).to have_content(@eric.student_id)
    expect(page).to have_content(@eric.student_name)
    expect(page).to have_content(@eric.student_grade)
end

When("I click {string} on a post") do |string|
    click_on string, :match => :first
end

Given("I am on the homepage") do
    visit '/'
end

When("I go to the log in page") do
    visit '/users/sign_in'
end

Then("I should not be able to see the {string} link") do |string|
    expect(page).not_to have_content(string)
end

Then("I should be able to see the {string} link") do |string|
    expect(page).to have_content(string)
end

Then("I should not be able to see the {string}button") do |string|
    expect(page).not_to have_content(string)
end

When("I fill out the form with a grade over {int} and submit") do |int|
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 101
    click_on "Create Grade"
end
  
Then("I should have not added a grade") do
    expect(page).to have_content("Student grade can't be greater than 100")
end

Then("I should see a column labeled Student ID") do
    expect(page).to have_content("Student ID")
end

Then("I should see a label called Student ID") do
    expect(page).to have_content("Student ID")
end

Then("I should see a box labeled Student id") do
    expect(page).to have_content("Student id")
end