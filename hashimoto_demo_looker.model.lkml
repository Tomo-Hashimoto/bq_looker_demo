connection: "hashimoto_looker_demo"
label: "hashimoto_sales_mp_us"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore:  hashimoto_sales_mp_us{
  label: "hashimoto_demo"
  from:  sales_mp_us
    join: forecast_c {
      relationship: many_to_many
      sql_on: ${hashimoto_sales_mp_us.date_month} = ${forecast_c.month_c_month}  ;;
    }
    join: c_forecast_c {
      relationship: many_to_many
      sql_on: ${hashimoto_sales_mp_us.date_month} = ${c_forecast_c.month_c_month}  ;;
    }
}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
