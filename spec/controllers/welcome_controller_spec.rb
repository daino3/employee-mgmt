require 'rails_helper'

describe WelcomeController do
  describe 'GET index' do
    subject { get :index }
    it { should render_template('welcome/index') }
  end
end
