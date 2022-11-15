- dashboard: bq_looker_demo
  title: BQ_Looker_Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: BS86W29q0gFPpx59ZcXaS7
  elements:
  - title: BQ_Looker_Demo
    name: BQ_Looker_Demo
    model: hashimoto_looker_demo_fin
    explore: sales_mp_from
    type: looker_column
    fields: [forecast_amount, mp, sales_mp_from.hashimoto_sales_mp_us_date_month]
    sorts: [sales_mp_from.hashimoto_sales_mp_us_date_month]
    limit: 500
    dynamic_fields: [{measure: forecast_amount, based_on: sales_mp_from.forecast_amount,
        expression: '', label: Forecast Amountの最大, type: max, _kind_hint: measure,
        _type_hint: number}, {measure: mp, based_on: sales_mp_from.mp, expression: '',
        label: Mpの最大, type: max, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      mp: line
    series_colors:
      forecast_amount: "#E8710A"
      mp: "#1A73E8"
    series_labels:
      mp: MP
      forecast_amount: Forecast Amount
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
