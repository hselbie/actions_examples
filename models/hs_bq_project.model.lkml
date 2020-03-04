connection: "biquery_publicdata_standard_sql"

include: "/views/*.view"
include: "/**/*.dashboard"

datagroup: hs_bq_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hs_bq_project_default_datagroup

explore: order_items {
  join: top_10_simple_item_names {
    type: inner
    relationship: many_to_one
    sql_on:
        ${order_items.order_id} = ${top_10_simple_item_names.order_id};;
  }
}

explore: order_items_2 {
  from: order_items
}
