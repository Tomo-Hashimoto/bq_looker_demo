view: sales_mp_from_sql {
  derived_table: {
    sql: with a as
      (SELECT
          (FORMAT_DATE('%Y-%m', hashimoto_sales_mp_us.date )) AS hashimoto_sales_mp_us_date_month
        , sum(hashimoto_sales_mp_us.mp) as mp
       FROM `ds-sandbox-360805.ds_internalkpi_test_us.sales_mp_us`
         as hashimoto_sales_mp_us
       group by 1
      )

      , b as
      (SELECT
      (FORMAT_DATE('%Y-%m', forecast_c.month_c )) AS forecast_c_month_c_month
      , sum(forecast_c.amount_c) as amount
      FROM `ds-sandbox-360805.salesforce.forecast_c`
      as forecast_c
      where
      forecast_c.is_deleted is false
      group by 1
      )

      , c as
      (SELECT
      (FORMAT_DATE('%Y-%m', c_forecast_c.month_c )) AS c_forecast_c_month_c_month
      , sum(c_forecast_c.amount_c) as c_amount
      FROM `ds-sandbox-360805.salesforce.c_forecast_c`
      as c_forecast_c
      where
      c_forecast_c.is_deleted is false
      group by 1
      )

      , forecast_sum as (
      select
      forecast_c_month_c_month
      , amount + c_amount as forecast_amount
      from b
      left join c
      on forecast_c_month_c_month = c_forecast_c_month_c_month
      )

      select
      hashimoto_sales_mp_us_date_month
      , forecast_amount
      , mp
      from a
      left join forecast_sum
      on hashimoto_sales_mp_us_date_month = forecast_c_month_c_month
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: hashimoto_sales_mp_us_date_month {
    type: string
    sql: ${TABLE}.hashimoto_sales_mp_us_date_month ;;
  }

  dimension: forecast_amount {
    type: number
    sql: ${TABLE}.forecast_amount ;;
  }

  dimension: mp {
    type: number
    sql: ${TABLE}.mp ;;
  }

  set: detail {
    fields: [hashimoto_sales_mp_us_date_month, forecast_amount, mp]
  }
}
