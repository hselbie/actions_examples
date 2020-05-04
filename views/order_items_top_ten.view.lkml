view: top_10_simple_item_names {
  view_label: "Top 10s"
  derived_table: {
    sql: select
          o.user_id

          {% if order_items.id._in_query %} , o.id as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.created_at._in_query %} , o.created_at as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.delivered_at._in_query %} , o.delivered_at as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.inventory_item_id._in_query %} , o.inventory_item_id as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.order_id._in_query %} , o.order_id as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.returned_at._in_query %} , o.returned_at as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.sale_price._in_query %} , o.sale_price as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.shipped_at._in_query %} , o.shipped_at as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.status._in_query %} , o.status as grouper {% else %} , 1=1 {% endif %}
          {% if order_items.user_id._in_query %} , o.user_id as grouper {% else %} , 1=1 {% endif %}

          , sum(sale_price)
          , RANK() OVER (ORDER BY COALESCE(SUM(o.sale_price ), 0) DESC) rank
          from `lookerdata.thelook_web_analytics.order_items` o
          group by 1,2,3,4,5,6,7,8,9,10,11

;;
  }
  dimension: grouper { group_label: "Simple Example"  }
  dimension: rank { type: number group_label: "Simple Example" }
  dimension: user_id {}
}

# view: top_10_simple_item_names {
#   view_label: "Top 10s"
#   derived_table: {
#     sql: select
#           o.user_id
#           {% if order_items.id._is_selected %} , o.id as grouper
#           {% elsif order_items.created_at._is_selected %} , o.created_at as grouper
#           {% elsif order_items.delivered_at._is_selected %} , o.delivered_at as grouper
#           {% elsif order_items.inventory_item_id._is_selected %} , o.inventory_item_id as grouper
#           {% elsif order_items.order_id._is_selected %} , o.order_id as grouper
#           {% elsif order_items.returned_at._is_selected %} , o.returned_at as grouper
#           {% elsif order_items.sale_price._is_selected %} , o.sale_price as grouper
#           {% elsif order_items.shipped_at._is_selected %} , o.shipped_at as grouper
#           {% elsif order_items.status._is_selected %} , o.status as grouper
#           {% elsif order_items.user_id._is_selected %} , o.user_id as grouper
#           {% endif %}
#
#           , sum(sale_price)
#           , RANK() OVER (ORDER BY COALESCE(SUM(o.sale_price ), 0) DESC) rank
#           from `lookerdata.thelook_web_analytics.order_items` o
#           group by 1,2
# --          limit 10
#
# ;;
#   }
#   dimension: grouper { group_label: "Simple Example"  }
#   dimension: rank { type: number group_label: "Simple Example" }
#   dimension: user_id {}
# }

# view: top_10_simple_item_names {
#   derived_table: {
#     explore_source: order_items_2 {
#       bind_all_filters: yes
#       column: user_id {field: order_items_2.user_id}
#       derived_column: order_id {
#         sql: {% if order_items.id._in_query %} o.id as grouper {% else %} , 1=1 {% endif %} ;;
#       }
#     }
#   }
#   dimension: user_id {
#     type: number
#   }
#   dimension: order_id {
#     type: number
#   }
#   dimension: returned_at {}
#   dimension: sale_price {
#     type: number
#   }
# }

# explore: top_10_simple_item_names {}
# view: top_10_simple_item_names {
#   derived_table: {
#     explore_source: order_items_2 {
#       column: order_id {}
#       column: total_sale_price {}
#       column: status {}
#       filters: {
#         field: order_items_2.delivered_at
#         value: "last 2 weeks"
#       }
#       sort: {
#         field: order_items_2.total_sale_price
#         desc: no
#       }
#       limit: 20
#     }
#   }
#   dimension: order_id {
#     type: number
#   }
#   dimension: total_sale_price {
#     type: number
#   }
#   dimension: status {}
# }
