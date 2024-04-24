include: "/views/*.view"

explore: mobility {
  from: mobility_data
  group_label: "Community Mobility Reports"
  description: "This Explore uses data from Google's COVID-19 Community Mobility Reports. Full information about these are available at: https://www.google.com/covid19/mobility/"
  sql_always_where: ${geo_level_output} = ${geo_level};;
  # always_filter: {
  #   filters: [geography_level: "country"]
  # }

  join: max_date_mobility {
    sql_on: ${mobility.country_region_code} = ${max_date_mobility.country_region_code}
            AND IFNULL(${mobility.sub_region_1}, '') = ${max_date_mobility.province_state}
            AND IFNULL(${mobility.sub_region_2}, '') = ${max_date_mobility.county};;
    relationship: many_to_one
  }
}
