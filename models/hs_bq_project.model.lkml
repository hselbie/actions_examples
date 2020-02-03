connection: "biquery_publicdata_standard_sql"

datagroup: hs_bq_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hs_bq_project_default_datagroup
