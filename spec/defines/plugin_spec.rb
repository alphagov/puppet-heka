require 'spec_helper'

describe 'heka::plugin' do
  let(:title) { 'dashboard' }

  context 'content param' do
    let(:params) {{
      :content => "[DashboardOutput]\n",
    }}

    it {
      should contain_file('/etc/heka/dashboard.toml').with({
        :content => "[DashboardOutput]\n",
        :source  => nil,
      })
    }
  end

  context 'source param' do
    let(:params) {{
      :source => 'puppet:///heka/dashboard.toml',
    }}

    it {
      should contain_file('/etc/heka/dashboard.toml').with({
        :content => nil,
        :source  => 'puppet:///heka/dashboard.toml',
      })
    }
  end

  context 'no params' do
    let(:params) {{ }}

    it {
      expect { should }.to raise_error(
        Puppet::Error, /^content and source param must be provided /
      )
    }
  end

  context 'content and source param' do
    let(:params) {{
      :content => "[DashboardOutput]\n",
      :source  => 'puppet:///heka/dashboard.toml',
    }}

    it {
      expect { should }.to raise_error(
        Puppet::Error, /^content and source params are mutually exclusive /
      )
    }
  end
end
