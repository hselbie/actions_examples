#
## Helzberg Diamonds - C67251922
#
include: "/wpromote_example/user_base.view"

access_grant: can_view_customer_C67251922 {
  user_attribute: client_id
  allowed_values: [ "C67251922" ]
}

view: +user_base {
#   extends: [user_base]
  dimension: conversion_name_C67251922 {
    required_access_grants: [can_view_customer_C67251922]
    type: string
    sql: ${TABLE}.Conversion_name__AdWords ;;
  }

  dimension: segment_C67251922 {
    sql: 1=1 ;;
    required_access_grants: [can_view_customer_C67251922]
}
#     alpha_sort: no
#     case: {
#       when: {
#         sql: ${conversion_name} LIKE '%WP - Purchase%’ ;;
#         label: "Online Revenue"
#       }
#       when: {
#         sql: ${conversion_name} LIKE '%In Store Sales%’ ;;
#         label: "Offline Revenue"
#       }
#       when: {
#         sql: ${campaign} = ‘Local' ;;
#         label: "Competitor"
#       }
#       else:"Unknown"
#     }
#   }
}
