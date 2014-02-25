# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Page.create([
  {title: "Test Page 1", slug: "test-page-1", body: "test 1", user_id: 1},
  {title: "Test Page 2", slug: "test-page-2", body: "test 1", user_id: 1},
  {title: "Test Page 3", slug: "test-page-3", body: "test 1", user_id: 1},
  {title: "Test Page 4", slug: "test-page-4", body: "test 1", user_id: 1},
  {title: "Test Page 1 2", slug: "test-page-1 2", body: "test 1", user_id: 2},
  {title: "Test Page 2 2", slug: "test-page-2 2", body: "test 2", user_id: 2},
  {title: "Test Page 3 2", slug: "test-page-3 2", body: "test 3", user_id: 2},
  {title: "Test Page 4 2", slug: "test-page-4 2", body: "test 4", user_id: 2},
  {title: "Test Page 1 3", slug: "test-page-1 3", body: "test 1", user_id: 3},
  {title: "Test Page 2 3", slug: "test-page-2 3", body: "test 2", user_id: 3},
  {title: "Test Page 3 3", slug: "test-page-3 3", body: "test 3", user_id: 3},
  {title: "Test Page 4 3", slug: "test-page-4 3", body: "test 4", user_id: 3}
])

User.create([
  {name: "Client 1", api_key: "client_0_api_key"},
  {name: "Client 2", api_key: "client_1_api_key"},
  {name: "Client 3", api_key: "client_2_api_key"}
])

MetricVariable.create([
  {name: "bounce_rate", metric_abr: "c", sample_rate: 1},
  {name: "conversion_rate", metric_abr: "c", sample_rate: 1},
  {name: "render_time", metric_abr: "ms", sample_rate: 1},
  {name: "repeat_visitors", metric_abr: "g", sample_rate: 1},
  {name: "visitor_gauge", metric_abr: "g", sample_rate: 1}
])

