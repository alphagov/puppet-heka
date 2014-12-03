require 'spec_helper'

describe 'heka' do
  context 'param defaults' do
    let(:params) {{ }}

    it { should contain_class('heka::install') }
    it { should contain_class('heka::config') }
    it { should contain_class('heka::service') }
  end
end
