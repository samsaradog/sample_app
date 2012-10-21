require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"    
  end
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }

  end # Home page
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end # Help page
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1', text:'About Us') }
    it { should have_selector('title', text: full_title('About')) }
  end # About Page
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end   # Contact Page
 
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
  end
end # static_pages
