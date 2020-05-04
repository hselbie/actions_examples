explore: user_base {
  hidden: yes
}
view: user_base {
  sql_table_name: 1=1 ;;
#   sql_table_name: {{ _user_attributes['dataset_prefix_bigquery'] }}_Google_Ads.all_funnel_data_view
  dimension: test {}
}
