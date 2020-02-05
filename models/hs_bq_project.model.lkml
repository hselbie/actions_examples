connection: "biquery_publicdata_standard_sql"

include: "/views/*.view"

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
       {% if order_items.user_id._in_query %}
            ${top_10_simple_item_names.grouper} = ${order_items.user_id}
       {% elsif order_items.inventory_item_id._in_query %}
            ${top_10_simple_item_names.grouper} = ${order_items.inventory_item_id}
       {% endif %};;
  }
}
