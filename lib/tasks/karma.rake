namespace :karma  do
  task :start => :environment do

    with_tmp_config :start
  end

  task :run => :environment do
    exit with_tmp_config :start, "--single-run"
  end

  private

  def with_tmp_config(command, args = nil)
    File.open(Rails.root.join('tmp','karma_unit.js'), 'w') do |f|
      f.write unit_js(application_spec_files)
      f.flush

      system "./node_modules/karma/bin/karma #{command} #{f.path} #{args}"
    end
  end

  def application_spec_files
    Rails.application.assets.each_file.select { |pathname| pathname.match(/spec\/javascripts\/app/) }
  end

  def unit_js(files)
    unit_js = File.open('spec/javascripts/karma/config/unit.js', 'r').read
    unit_js.gsub "APPLICATION_SPEC", "\"#{files.join("\",\n\"")}\""
  end
end
