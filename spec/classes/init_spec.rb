require 'spec_helper'

describe 'heka' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "heka class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('heka::params') }

        it { should contain_class('heka::install') }
        it { should contain_class('heka::config') }
        it { should contain_class('heka::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'heka class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
