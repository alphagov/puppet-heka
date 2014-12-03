require 'spec_helper'

describe 'heka::config' do
  it { should contain_file('/etc/heka').with_ensure('directory') }
end
