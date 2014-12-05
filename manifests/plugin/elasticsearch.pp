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
class heka::plugin::elasticsearch (
  $url,
  $logstash_v0 = false,
) {
  validate_bool($logstash_v0)

  $encoder = $logstash_v0 ? {
    false => 'ESJsonEncoder',
    true  => 'ESLogstashV0Encoder',
  }

  heka::plugin { 'elasticsearch':
    content => template('heka/etc/heka/elasticsearch.toml.erb'),
  }
}
