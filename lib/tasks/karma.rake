namespace :karma  do
  task :start => :environment do
    with_tmp_config :start
  end

  task :run => :environment do
    exit with_tmp_config :start, "--single-run"
  end

  private

  def with_tmp_config(command, args = nil)
    File.open(Rails.root.join('karma.conf.js'), 'w') do |f|
      f.write unit_js(application_spec_files)
      f.flush

      system "./node_modules/karma/bin/karma #{command} #{f.path} #{args}"
    end
  end

  def application_spec_files
    app_files  = Rails.application.assets.find_asset("application.coffee").to_a.map {|e| e.pathname.to_s }
    spec_files = Rails.application.assets.find_asset("spec_helper.coffee").to_a.map {|e| e.pathname.to_s }
    app_files + spec_files
  end

  def unit_js(files)
    contents = File.open('spec/javascripts/karma/config/unit.js', 'r', &:read)
    contents.gsub!("APPLICATION_SPEC", "\"#{files.join("\",\n\"")}\"")
  end
end
