constant: drill_link_listener {
  # hidden drill link to listen to current filters
  value: "order_items.drill_link_listener._link"
}

constant: find_filters {
  value: "
  {% assign query_array = @{drill_link_listener} | split: '&' %}
  {% assign filters = '' %}
  {% for qs in query_array %}
  {% assign qs_check = qs | slice: 0,2 %}
  {% if qs_check contains 'f[' %}
  {% assign filters = filters | append: '&' | append: qs %}
  {% endif %}
  {% endfor %}
  {{ filters }}"
}

constant: per_user_drilling {
  value: "/explore/{{_model._name}}/{{_explore._name}}?fields=order_items.order_id,order_items.returned_date,order_items.total_sale_price_drill&@{find_filters}"
}



constant: button_padding { value: "padding: 15px 32px;" }
constant: border_radius { value: "border-radius: 10px;" }
constant: border {  value: "border: none;" }
constant: fontsize { value: "font-size:1vw;" }
constant: width { value: "width:100%;" }
constant: background_color { value: "background-color: #36C5F0;" }
constant: text_color { value:"color: white;" }
constant: text_decoration { value: "text-decoration:none;" }
constant: text_align { value: "text-align: center;" }
constant: display { value: "display: inline-block;" }
constant: button_margin { value: "margin: 4px 2px;" }
constant: button_overlay { value: "cursor: pointer;
  -webkit-transition-duration: 0.4s;
transition-duration: 0.4s;" }
constant: button_shadow { value: "box-shadow: 0 8px 16px 0 rgba(0,0,0,0.24);" }
constant: lookml_navbar_glossary {
  value:
  "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '></div>"
}

constant: lookml_navbar_helpchannel {
  value:
  "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '></div>"
}

constant: button_start {
  value:   "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '>"
}

constant: dashboard_data_success {
  value: "<div style='
  @{width}
  background-color:#2EB67D;
  border-radius: 2px;
  @{border}
  @{text_align}
  @{text_color}
  @{fontsize}
  @{button_padding}
  @{text_decoration}
  @{button_overlay}'>You have the latest data!</div>"
}

constant: dashboard_data_fail {
  value: "<div style='
  @{width}
  background-color:red;
  border-radius: 2px;
  @{border}
  display:inline-block;
  @{text_align}
  @{text_color}
  @{fontsize}
  @{button_padding}
  @{button_overlay}
  text-decoration:none;'>You do not have the latest data :(</div>"
}

constant: button_end {
  value: "</div>"
}

constant: up_down_arrow_html {
  value: "
  {% if value > 0 %} {% assign indicator = 'green,▲' | split: ',' %} {% elsif value < 0 %} {% assign indicator = 'red,▼' | split: ',' %} {% else %}{% assign indicator = 'black,▬' | split: ',' %}  {% endif %}"
}
