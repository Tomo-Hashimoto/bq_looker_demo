view: sales_mp_us {
  sql_table_name: `ds-sandbox-360805.ds_internalkpi_test_us.sales_mp_us`
    ;;

  dimension: ac_fo {
    type: number
    sql: ${TABLE}.AC_FO ;;
  }

  dimension_group: date {
    type: time
    description: "%E4Y-%m-%d"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
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
}
