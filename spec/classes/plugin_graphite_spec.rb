require 'spec_helper'

describe 'heka::plugin::graphite' do
  context 'host' do
    let(:params) {{
      :host => 'graphite.example.com',
    }}

    it { should contain_heka__plugin('graphite').with({
      :content => /^address = "graphite.example.com:2003"$/,
    })}
  end

  context 'host and port' do
    let(:params) {{
      :host => 'graphite.example.com',
      :port => 9999,
    }}

    it { should contain_heka__plugin('graphite').with({
      :content => /^address = "graphite.example.com:9999"$/,
    })}
  end
end
