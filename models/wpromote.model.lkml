connection: "biquery_publicdata_standard_sql"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project

explore: +user_base {}
