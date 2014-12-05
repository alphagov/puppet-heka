require 'spec_helper'

describe 'heka::plugin::elasticsearch' do
  describe 'url' do
    let(:params) {{
      :url => 'http://elasticsearch.example.com:9200',
    }}

    it { should contain_heka__plugin('elasticsearch').with({
      :content => %r{^server = "http://elasticsearch.example.com:9200"$},
    })}
  end

  describe 'logstash_v0' do
    context 'false (default)' do
      let(:params) {{
        :url => 'http://elasticsearch.example.com:9200',
      }}

      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^encoder = "ESJsonEncoder"$/,
      })}
      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^\[ESJsonEncoder\]$/,
      })}
    end

    context 'true' do
      let(:params) {{
        :url         => 'http://elasticsearch.example.com:9200',
        :logstash_v0 => true,
      }}

      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^encoder = "ESLogstashV0Encoder"$/,
      })}
      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^\[ESLogstashV0Encoder\]$/,
      })}
    end
  end
end
