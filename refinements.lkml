include: "/models/**.lkml"

explore: +order_items {
  aggregate_table: rollup__dynamic {
    query: {
      measures: [dynamic]
      filters: [order_items.selector: "count"]
      timezone: "America/New_York"
    }

    materialization: {
      datagroup_trigger: hs_bq_project_default_datagroup
    }
  }
}
