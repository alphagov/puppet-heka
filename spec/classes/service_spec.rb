require 'spec_helper'

describe 'heka::service' do
  describe 'heka::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('foo') }
  end

  describe 'heka::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('foo') }
  end
end

