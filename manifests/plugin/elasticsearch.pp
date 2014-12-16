# == Class: heka::plugin::elasticsearch
#
# Setup `ElasticSearchOutput` to send messages to Elasticsearch.
#
# === Parameters
#
# [*url*]
#   Elasticsearch URL
#
# [*logstash_v0*]
#   Whether to use Logstash V0 format.
#   Default: false
#
# [*encoder_options*]
#   Hash of arbitrary options for the encoder.
#   Default: {}
#
# [*output_options*]
#   Hash of arbitrary options for the output.
#   Default: {}
#
class heka::plugin::elasticsearch (
  $url,
  $logstash_v0 = false,
  $encoder_options = {},
  $output_options = {},
) {
  validate_bool($logstash_v0)
  validate_hash($encoder_options, $output_options)

  $encoder = $logstash_v0 ? {
    false => 'ESJsonEncoder',
    true  => 'ESLogstashV0Encoder',
  }

  heka::plugin { 'elasticsearch':
    content => template('heka/etc/heka/elasticsearch.toml.erb'),
  }
}
