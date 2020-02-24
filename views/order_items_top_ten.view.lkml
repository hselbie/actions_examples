view: top_10_simple_item_names {
  view_label: "Top 10s"
  derived_table: {
    sql: select
          o.user_id
          {% if order_items.id._is_selected %} , o.id as grouper
          {% elsif order_items.created_at._is_selected %} , o.created_at as grouper
          {% elsif order_items.delivered_at._is_selected %} , o.delivered_at as grouper
          {% elsif order_items.inventory_item_id._is_selected %} , o.inventory_item_id as grouper
          {% elsif order_items.order_id._is_selected %} , o.order_id as grouper
          {% elsif order_items.returned_at._is_selected %} , o.returned_at as grouper
          {% elsif order_items.sale_price._is_selected %} , o.sale_price as grouper
          {% elsif order_items.shipped_at._is_selected %} , o.shipped_at as grouper
          {% elsif order_items.status._is_selected %} , o.status as grouper
          {% elsif order_items.user_id._is_selected %} , o.user_id as grouper
          {% endif %}

          , sum(sale_price)
          , RANK() OVER (ORDER BY COALESCE(SUM(o.sale_price ), 0) DESC) rank
          from `lookerdata.thelook_web_analytics.order_items` o
          group by 1,2
--          limit 10

;;
  }
  dimension: grouper { group_label: "Simple Example"  }
  dimension: rank { type: number group_label: "Simple Example" }
  dimension: user_id {}
}
