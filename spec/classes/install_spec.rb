require 'spec_helper'

describe 'heka::install' do
  describe 'heka::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_package('foo') }
  end

  describe 'heka::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('foo') }
  end
end
