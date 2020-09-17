view: order_items {
  sql_table_name: thelook_web_analytics.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered_at {
    type: time
    sql: cast(${TABLE}.delivered_at as timestamp) ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: shipped_at {
    type: string
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  parameter: selector {
    type: unquoted
    suggestions: ["sum", "count"]
  }

  measure: dynamic {
    type: number
    sql: {% if order_items.selector._parameter_value == 'sum' %}
          ${total_sale_price}
         {% else %}
          ${count_distinct_users}
         {% endif %};;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: count_distinct_users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: drill_link_listener {
    hidden: yes
    type: sum
    sql: 1 ;;
    drill_fields: []
  }

  measure: total_sale_price_drill {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
    link: {
      label: "{{ _user_attributes['first_name'] }}'s Custom Drill"
      url: "@{per_user_drilling}"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}

view: +order_items {
  dimension: hugo_test {}
}
