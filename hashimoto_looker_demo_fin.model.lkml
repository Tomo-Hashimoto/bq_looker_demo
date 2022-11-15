connection: "hashimoto_looker_demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "*.dashboard.lookml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: sales_mp_from {
  from: sales_mp_from_sql
  }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
