When("I am on the {string} page") do |page_name|
    visit page_path(page_name)
end

When("I am on the {string} for my user") do |page_name|
    visit page_path(page_name)
end

Given("I visit the Create article page") do
    visit new_article_path
end

def page_path(path)
    if path == 'This is so sad'
        article_title = Article.find_by(title: path)
        article_path(article_title)
    elsif path == 'Registration'
        new_user_registration_path
    elsif path == 'account page'
        user_path(@user)
    elsif path == 'Edit my account'
        edit_user_registration_path
    elsif path == 'Login'
        new_user_session_path
    elsif path == 'Create Article' || path == 'New Article'
        new_article_path
    else
        root_path
    end
end  
