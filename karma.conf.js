module.exports = function(config) {
  config.set({

    // base path
    basePath: './',

    // frameworks to use
    frameworks: ['jasmine'],

    // list of files / patterns to load in the browser
    files: [
      "/Users/daino/.rvm/gems/ruby-2.1.0/gems/underscore-rails-1.8.3/vendor/assets/javascripts/underscore.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/jquery-rails-4.0.4/vendor/assets/javascripts/jquery.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/jquery-rails-4.0.4/vendor/assets/javascripts/jquery_ujs.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/jquery-ui-rails-5.0.5/app/assets/javascripts/jquery-ui/core.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/jquery-ui-rails-5.0.5/app/assets/javascripts/jquery-ui/datepicker.js",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/lib/properties.coffee",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/angularjs-rails-1.4.0/vendor/assets/javascripts/angular.js",
"/Users/daino/Programs/employee-mgmt/vendor/assets/javascripts/angular-foundation.min.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/angularjs-rails-1.4.0/vendor/assets/javascripts/angular-resource.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.abide.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.accordion.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.alert.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.clearing.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.dropdown.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.equalizer.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.interchange.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.joyride.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.magellan.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.offcanvas.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.orbit.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.reveal.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.slider.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.tab.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.tooltip.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation/foundation.topbar.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/foundation-rails-5.5.2.1/vendor/assets/javascripts/foundation.js",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/employee_mgmt.js.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/controllers/employees_controller.js.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/controllers/new_employee_controller.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/directives/datepicker.js.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/services/department.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/app/services/employee.coffee",
"/Users/daino/Programs/employee-mgmt/app/assets/javascripts/application.js",
"/Users/daino/.rvm/gems/ruby-2.1.0/gems/angularjs-rails-1.4.0/vendor/assets/javascripts/angular-mocks.js",
"/Users/daino/Programs/employee-mgmt/vendor/test/assets/javascripts/jasmine-jquery.js",
"/Users/daino/Programs/employee-mgmt/spec/javascripts/app/services/employee_spec.coffee",
"/Users/daino/Programs/employee-mgmt/spec/javascripts/spec_helper.coffee",
      {pattern: 'spec/javascripts/fixtures/*.json', watched: true, served: true, included: false}
    ],

    // list of files to exclude
    exclude: [],

    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress'],

    // web server port
    port: 9876,

    // enable / disable colors in the output (reporters and logs)
    colors: true,

    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,

    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera (has to be installed with `npm install karma-opera-launcher`)
    // - Safari (only Mac; has to be installed with `npm install karma-safari-launcher`)
    // - PhantomJS
    // - IE (only Windows; has to be installed with `npm install karma-ie-launcher`)
    browsers: ['PhantomJS'],

    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,

    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false,

    // Preprocessors
    preprocessors: {
      'app/assets/javascripts/**/*.coffee': ['coffee'],
      'app/assets/javascripts/**/*.coffee.erb': ['coffee'],
      'spec/javascripts/**/*.coffee': ['coffee'],
      '**/*.slim': ['slim', 'ng-html2js']
    },

    ngHtml2JsPreprocessor: {
      stripPrefix: 'app/assets/templates/',
      stripSufix: '.slim'
    }
  });
};
