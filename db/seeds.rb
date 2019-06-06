# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

forms = [{"title"=>"Contact us form", "description"=>"Contact Us Form", "is_active"=>true},
  {"title"=>"User sign up Form", "description"=>"Register user based on OTP", "is_active"=>true},
  {"title"=>"Customer Support", "description"=>"", "is_active"=>true},
  {"title"=>"Employee details form ", "description"=>"", "is_active"=>true}]

forms.each do |f|
  form = Form.create!(f)
  ap f
end

form_elements = [{"form_id"=>2, "key"=>"first_name", "label"=>"First Name", "field_placeholder"=>"Please Enter your first name", "tooltip"=>"First name should not be empty", "description"=>"", "component_type"=>"textfield", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
  {"form_id"=>2, "key"=>"last_name", "label"=>"Last Name", "field_placeholder"=>"Please Enter your Last name", "tooltip"=>"", "description"=>"", "component_type"=>"textfield", "format"=>nil, "field_validation"=>{"maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>"", "required"=>false}, "datasets"=>nil},
  {"form_id"=>2, "key"=>"email", "label"=>"Email", "field_placeholder"=>"Please Enter a Valid email", "tooltip"=>"Should be a valid email id", "description"=>"Notification messages will be send on this email id", "component_type"=>"email", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
  {"form_id"=>2, "key"=>"mobile_number", "label"=>"Mobile Number", "field_placeholder"=>"Please enter your 10 digit mobile number ", "tooltip"=>"", "description"=>"You'll receive 4 digit OTP on this number", "component_type"=>"phoneNumber", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil}]

FormElement.create!(form_elements)

element_3 = [{"form_id"=>3, "key"=>"customer_full_name", "label"=>"Name", "field_placeholder"=>"Please enter your full name", "tooltip"=>"", "description"=>"", "component_type"=>"textfield", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
{"form_id"=>3, "key"=>"annual_income", "label"=>"Annual Income", "field_placeholder"=>"Please enter your annual income", "tooltip"=>"Please enter a valid amount, do not use short forms (i.e 8 LPA)", "description"=>"", "component_type"=>"textfield", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>10, "minLength"=>4, "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
{"form_id"=>3, "key"=>"dob", "label"=>"Date of Birth", "field_placeholder"=>"", "tooltip"=>"", "description"=>"", "component_type"=>"datetime", "format"=>nil, "field_validation"=>{"maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>"", "required"=>false}, "datasets"=>nil},
{ "form_id"=>3, "key"=>"occupation", "label"=>"Occupation", "field_placeholder"=>"Please select your Profession", "tooltip"=>"", "description"=>"", "component_type"=>"select", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>{"values"=>[{"label"=>"Artist", "value"=>"1"}, {"label"=>"Doctor", "value"=>"2"}, {"label"=>"Other", "value"=>"100"}, {"label"=>"Banker", "value"=>"11"}, {"label"=>"Teacher", "value"=>"10"},
  {"label"=>"Engineer (Civil)", "value"=>"3"}, {"label"=>"Engineer (Telecom)", "value"=>"4"}]}},
  { "form_id"=>3, "key"=>"gemder", "label"=>"Gender", "field_placeholder"=>"", "tooltip"=>"", "description"=>"", "component_type"=>"radio", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>[{"label"=>"Male", "value"=>"male"}, {"label"=>"Female", "value"=>"female"}, {"label"=>"Other", "value"=>"other"}]},
  { "form_id"=>3, "key"=>"email", "label"=>"Email", "field_placeholder"=>"Please Enter a Valid email", "tooltip"=>"", "description"=>"Notification messages will be send on this email id", "component_type"=>"email", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil}]

FormElement.create!(element_3)

element_4 = [
  {"form_id"=>4, "key"=>"name", "label"=>"Full Name", "field_placeholder"=>"Please enter your full name", "tooltip"=>"", "description"=>"", "component_type"=>"textfield", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>50, "minLength"=>2, "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
  {"form_id"=>4, "key"=>"email", "label"=>"Email", "field_placeholder"=>"Please Enter a Valid email", "tooltip"=>"", "description"=>"", "component_type"=>"email", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
  {"form_id"=>4, "key"=>"mobile_number", "label"=>"Mobile Number", "field_placeholder"=>"", "tooltip"=>"", "description"=>"", "component_type"=>"phoneNumber", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>nil},
  {"form_id"=>4, "key"=>"annual_income", "label"=>"Annual Income", "field_placeholder"=>"", "tooltip"=>"", "description"=>"", "component_type"=>"select", "format"=>nil, "field_validation"=>{"required"=>true, "maxLength"=>"", "minLength"=>"", "maxDate"=>"", "minDate"=>""}, "datasets"=>{"values"=>[{"label"=>"< 1.2 LPA", "value"=>"0-12000"}, {"label"=>"1.2 LPA to 2.4 LPA", "value"=>"120000 - 240000"}, {"label"=>"2.4 LPA - 5.0 LPA", "value"=>"240000 - 500000"}, {"label"=>"5 LPA - 10 LPA", "value"=>"500000 - 1000000"}, {"label"=>"< 12 LPA", "value"=>"1200000 and above"}]}}
]

FormElement.create!(element_4)
