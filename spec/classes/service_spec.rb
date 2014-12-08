require 'spec_helper'

describe 'heka' do
  context 'service_ensure running (default)' do
    let(:params) {{ }}

    it {
      should contain_service('heka').with({
        :ensure => 'running',
        :enable => true,
      })
    }
  end

  context 'service_ensure stopped' do
    let(:params) {{
      :service_ensure => 'stopped',
    }}

    it {
      should contain_service('heka').with({
        :ensure => 'stopped',
        :enable => false,
      })
    }
  end

  context 'service_ensure false' do
    let(:params) {{
      :service_ensure => false,
    }}

    it {
      should contain_service('heka').with({
        :ensure => false,
        :enable => false,
      })
    }
  end
end
