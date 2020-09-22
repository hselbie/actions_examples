# #
# ## Target Stores - C646468461
# #
# include: "/wpromote_example/user_base.view"

# access_grant: can_view_customer_C646468461 {
#   user_attribute: client_id
#   allowed_values: [ "C646468461" ]
# }

# view: +user_base {
# #   extends: [user_base]
# dimension: conversion_name_C646468461 {
#   required_access_grants: [can_view_customer_C646468461]
#   type: string
#   sql: ${TABLE}.Conversion_name__AdWords ;;
# }

# dimension: segment_C646468461 {
#   sql: 1=1 ;;
#   required_access_grants: [can_view_customer_C646468461]
# }
# #   alpha_sort: no
# #   case: {
# #     when: {
# #       sql: ${conversion_name} LIKE '%Testy - Purchase%’ ;;
# #       label: "Online Revenue"
# #     }
# #     when: {
# #       sql: ${conversion_name} LIKE '%Marky Sales%’ ;;
# #       label: "Offline Revenue"
# #     }
# #     when: {
# #       sql: ${campaign} = ‘Local' ;;
# #       label: "Competitor"
# #     }
# #     else:"Unknown"
# #   }
# # }
# }
