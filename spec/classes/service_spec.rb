require 'spec_helper'

describe 'heka::service' do
  it { should contain_service('heka') }
end
