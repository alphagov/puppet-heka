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

  describe 'encoder_options' do
    context '{} (default)' do
      let(:params) {{
        :url => 'http://elasticsearch.example.com:9200',
      }}

      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^es_index_from_timestamp =.+$\Z/,
      })}
    end

    context 'populated with different types' do
      let(:params) {{
        :url              => 'http://elasticsearch.example.com:9200',
        :encoder_options  => {
          'int_quoted'    => '100',
          'int_unquoted'  => 200,
          'bool_quoted'   => 'true',
          'bool_unquoted' => false,
          'string'        => 'thing',
        },
      }}

      it { should contain_heka__plugin('elasticsearch').with_content(/^int_quoted = 100$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^int_unquoted = 200$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^bool_quoted = true$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^bool_unquoted = false$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^string = "thing"$/) }
    end
  end

  describe 'output_options' do
    context '{} (default)' do
      let(:params) {{
        :url => 'http://elasticsearch.example.com:9200',
      }}

      it { should contain_heka__plugin('elasticsearch').with({
        :content => /^es_index_from_timestamp =.+$\Z/,
      })}
    end

    context 'populated with different types' do
      let(:params) {{
        :url              => 'http://elasticsearch.example.com:9200',
        :output_options  => {
          'int_quoted'    => '100',
          'int_unquoted'  => 200,
          'bool_quoted'   => 'true',
          'bool_unquoted' => false,
          'string'        => 'thing',
        },
      }}

      it { should contain_heka__plugin('elasticsearch').with_content(/^int_quoted = 100$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^int_unquoted = 200$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^bool_quoted = true$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^bool_unquoted = false$/) }
      it { should contain_heka__plugin('elasticsearch').with_content(/^string = "thing"$/) }
    end
  end
end
