crumb :root do
  link "Home", root_path
end

crumb :edit_account do
  link "Edit Account", edit_user_registration_path
  parent :root
end

crumb :new_invitation do
  link "Invite user", new_user_invitation_path
  parent :root
end

crumb :employment_contracts do
  link "Employee Set Up Requests", employment_contracts_path
  parent :root
end

crumb :employment_contract do |contract|
  link contract.employee.name, employment_contract_path(contract)
  parent :employment_contracts
end

crumb :new_employment_contract do
  link "New", new_employment_contract_path
  parent :employment_contracts
end

crumb :edit_employment_contract do |contract|
  link "Edit", edit_employment_contract_path(contract)
  parent :employment_contract, contract
end


crumb :employees do
  link "Employees", employees_path
  parent :root
end

crumb :employee do |employee|
  link employee.name, employee_path(employee)
  parent :employees
end

crumb :new_employee do
  link "New", new_employee_path
  parent :root
end

crumb :edit_employee do |employee|
  link "Edit", edit_employee_path(employee)
  parent :employee, employee
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).