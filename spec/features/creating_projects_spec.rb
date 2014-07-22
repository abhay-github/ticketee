require 'spec_helper'

feature 'Creating Projects' do

	before do
	  	visit '/'
		click_link 'New Project'
	end

	scenario 'can create a project' do
		fill_in 'Name', 		with: 'textmate 2'
		fill_in 'Description',	with: 'an editor for os x'
		click_button 'Create Project'

		expect(page).to have_content 'Project has been created'

		project = Project.where(name: "textmate 2").first
		expect(page.current_url).to eq project_url(project)
		title = "textmate 2 - Projects - Ticketee"
		expect(page).to have_title title
	end

	scenario 'cannot create project without name' do
		click_button 'Create Project'
		expect(page).to have_content 'Name can\'t be blank'
	end
end