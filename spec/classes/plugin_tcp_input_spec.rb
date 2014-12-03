require 'spec_helper'

describe 'heka::plugin::tcp_input' do
  context 'port' do
    let(:params) {{
      :port => 9999,
    }}

    it { should contain_heka__plugin('tcp_input').with({
      :content => /^address = ":9999"$/,
    })}
  end

  context 'host and port' do
    let(:params) {{
      :host => '127.0.0.1',
      :port => 9999,
    }}

    it { should contain_heka__plugin('tcp_input').with({
      :content => /^address = "127.0.0.1:9999"$/,
    })}
  end
end
