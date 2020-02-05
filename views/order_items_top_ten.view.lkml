view: top_10_simple_item_names {
  view_label: "Top 10s"
  derived_table: {
    sql: select
          {% if order_items.user_id._in_query %} o.user_id as grouper {% else %} 1=1  {% endif %}
          , {% if order_items.inventory_item_id._in_query %} o.inventory_item_id as grouper {% else %} 1=1 {% endif %}
          , sum(sale_price)
          , RANK() OVER (ORDER BY COALESCE(SUM(o.sale_price ), 0) DESC) rank
          from `lookerdata.thelook_web_analytics.order_items` o
          group by 1,2
          limit 10

;;
  }
  dimension: grouper { group_label: "Simple Example"  }
  dimension: rank { type: number group_label: "Simple Example" }

}
