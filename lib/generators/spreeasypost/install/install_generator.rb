module Spreeasypost
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        front_all = 'vendor/assets/javascripts/spree/frontend'
        back_all = 'vendor/assets/javascripts/spree/backend'
        front_all_js = front_all + '/all.js'
        back_all_js = back_all + '/all.js'
        !Dir.exists?(front_all) ? Dir.mkdir(front_all) : nil
        !Dir.exists?(back_all) ? Dir.mkdir(back_all) : nil
        !File.exist?(front_all_js) ? File.new(front_all_js, "w").close : nil
        !File.exist?(back_all_js) ? File.new(back_all_js, "w").close : nil
        append_file front_all_js, "//= require spree/frontend/spreeasypost\n"
        append_file back_all_js, "//= require spree/backend/spreeasypost\n"
      end

      def add_stylesheets
        front_all = 'vendor/assets/stylesheets/spree/frontend'
        back_all = 'vendor/assets/stylesheets/spree/backend'
        front_all_css = front_all + '/all.css'
        back_all_css = back_all + '/all.css'
        !Dir.exists?(front_all) ? Dir.mkdir(front_all) : nil
        !Dir.exists?(back_all) ? Dir.mkdir(back_all) : nil
        !File.exist?(front_all_css) ? File.new(front_all_css, "w").close : nil
        !File.exist?(back_all_css) ? File.new(back_all_css, "w").close : nil
        append_file front_all_css, " *= require spree/frontend/spreeasypost\n"
        inject_into_file back_all_css, " *= require spree/backend/spreeasypost\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spreeasypost'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
