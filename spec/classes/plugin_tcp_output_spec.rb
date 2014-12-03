require 'spec_helper'

describe 'heka::plugin::tcp_output' do
  context 'host and port' do
    let(:params) {{
      :host => 'heka.example.com',
      :port => 9999,
    }}

    it { should contain_heka__plugin('tcp_output').with({
      :content => /^address = "heka.example.com:9999"$/,
    })}
  end
end
