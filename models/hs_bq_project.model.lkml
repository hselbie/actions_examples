connection: "biquery_publicdata_standard_sql"

include: "/views/*.view"
include: "/**/*.dashboard"

datagroup: hs_bq_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hs_bq_project_default_datagroup

explore: order_items {
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
  join: users {
    fields: []
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }
}
# Place in `hs_bq_project` model
explore: +order_items {
  aggregate_table: rollup__delivered_at {
    query: {
      dimensions: [delivered_at]
      measures: [total_sale_price]
      timezone: "America/New_York"
    }

    materialization: {
      datagroup_trigger: hs_bq_project_default_datagroup
    }
  }
}
