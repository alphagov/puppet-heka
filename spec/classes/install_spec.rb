require 'spec_helper'

describe 'heka::install' do
  it { should contain_package('heka') }
end
