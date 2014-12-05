require 'spec_helper'

describe 'heka::plugin::dashboard' do
  context 'defaults' do
    let(:params) {{ }}

    it { should contain_heka__plugin('dashboard').with({
      :content => /^address = "127.0.0.1:4352"$/,
    })}
    it { should contain_heka__plugin('dashboard').with({
      :content => /^ticker_interval = 5$/,
    })}
  end

  context 'host and port' do
    let(:params) {{
      :host => '::1',
      :port => 9999,
    }}

    it { should contain_heka__plugin('dashboard').with({
      :content => /^address = "::1:9999"$/,
    })}
  end

  context 'interval' do
    let(:params) {{
      :interval => 1,
    }}

    it { should contain_heka__plugin('dashboard').with({
      :content => /^ticker_interval = 1$/,
    })}
  end
end
