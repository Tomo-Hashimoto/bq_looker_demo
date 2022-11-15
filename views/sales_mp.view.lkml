view: sales_mp {
  sql_table_name: `ds-sandbox-360805.ds_internalkpi_test.sales_mp`
    ;;

  dimension: ac_fo {
    type: number
    sql: ${TABLE}.AC_FO ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: mp {
    type: number
    sql: ${TABLE}.MP ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_of_ac_fo {
    type: sum
    sql: ${TABLE}.AC_FO ;;
  }

  measure: sum_of_mp {
    type: sum
    sql: ${TABLE}.MP ;;
  }
}
