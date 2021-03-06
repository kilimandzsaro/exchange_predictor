guard :rubocop do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end

guard :shell do
  watch(/app%r*/) { |m| `tail #{m[0]}` }
end

guard :bundler do
  watch("Gemfile")
end

guard :rspec, all_after_pass: false, all_on_start: false, cmd: "bundle exec rspec" do
  watch("spec/spec_helper.rb") { "spec" }
  watch("app/controllers/*.rb") { "spec/controllers" }
  watch("config/routes.rb") { "spec/routing" }
  watch(%r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb}) { |m| "spec/#{m[1]}" }
  watch(%r{^spec/.+_spec\.rb})

  watch(%r{^app/controllers/(.+)_(controller)\.rb}) do |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/requests/#{m[1]}_spec.rb"
    ]
  end

  watch(%r{^app/(.+)\.rb}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb}) { |m| "spec/lib/#{m[1]}_spec.rb" }
end
