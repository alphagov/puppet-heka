require 'spec_helper'

describe 'heka' do
  context 'package_ensure present (default)' do
    let(:params) {{ }}

    it { should contain_package('heka').with_ensure('present') }
  end

  context 'package_ensure 1.2.3' do
    let(:params) {{
      :package_ensure => '1.2.3',
    }}

    it { should contain_package('heka').with_ensure('1.2.3') }
  end
end
