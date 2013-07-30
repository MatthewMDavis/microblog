require 'active_support/inflector'

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' },
               :rspec_env    => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', cli: '--drb --format Fuubar --color', all_on_start: false, all_after_pass: false, :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})      { |m| "spec/lib/#{m[1]}_spec.rb" }
 
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)\.rb})                { |m| "spec/requests/#{m[1]}_spec.rb" }  
  watch(%r{^app/decorators/(.+)_decorator\.rb$})      { |m| "spec/requests/#{m[1]}_controller_spec.rb" }
  watch('app/controllers/application_controller.rb')  { "spec/requests" }
 
  watch(%r{^app/views/(.+)/(.+)\.rabl$})                 { |m| "spec/requests/#{m[1]}_controller_spec.rb" }
  watch(%r{^spec/requests/support/views/(.+)_view\.rb$}) { |m| "spec/requests/#{m[1]}_controller_spec.rb" }
end

guard 'puma' do
  watch('Gemfile.lock')
  watch(%r{^config|lib|api/.*})
end
