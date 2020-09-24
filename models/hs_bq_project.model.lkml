connection: "biquery_publicdata_standard_sql"

include: "/views/*.view"
include: "/**/*.dashboard"
include: "/refinements.lkml"
datagroup: hs_bq_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

#ocmmenc
persist_with: hs_bq_project_default_datagroup

explore: order_items {
  aggregate_table: parameter_test {
    query: {
      dimensions: [order_items.delivered_at_date]
      measures: [order_items.count_distinct_users
        , order_items.total_sale_price
        , order_items.dynamic]
#       filters: [order_items.selector: "sum"]
    }
    materialization: {
      persist_for: "1 hour"
    }
  }
#   sql_always_where: ({{_user_attributes['testsql']}})
#  ;;
  join: top_10_simple_item_names {
    type: inner
    relationship: many_to_one
    sql_on:
        ${order_items.user_id} = ${top_10_simple_item_names.user_id};;
  }
}

explore: order_items_2 {
  view_name: order_items
  # join: users {
  #   fields: []
  #   sql_on: ${users.id} = ${order_items.user_id} ;;
  # }
}
