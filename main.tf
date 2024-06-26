locals {
  regions = concat(var.additional_regions, [
    "asia-east1",
    "asia-east2",
    "asia-northeast1",
    "asia-northeast2",
    "asia-northeast3",
    "asia-south1",
    "asia-south2",
    "asia-southeast1",
    "asia-southeast2",
    "australia-southeast1",
    "australia-southeast2",
    "europe-central2",
    "europe-north1",
    "europe-southwest1",
    "europe-west1",
    "europe-west2",
    "europe-west3",
    "europe-west4",
    "europe-west6",
    "europe-west8",
    "europe-west9",
    "europe-west12",
    "northamerica-northeast1",
    "northamerica-northeast2",
    "southamerica-east1",
    "southamerica-west1",
    "us-central1",
    "us-east1",
    "us-east4",
    "us-east5",
    "us-south1",
    "us-west1",
    "us-west2",
    "us-west3",
    "us-west4",
  ])

  # Compute the regional shortname from component parts
  continent_short_name = {
    asia         = "az"
    australia    = "au"
    europe       = "eu"
    northamerica = "na"
    southamerica = "sa"
    us           = "us"
  }

  parts = var.region == null ? [] : split("-", var.region)
  region_short_name = var.region == null ? "" : join("", [
    local.continent_short_name[local.parts[0]],
    replace(local.parts[1], "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/", "$1$2$3$4$5")
  ])

  # Same computation but kick back a map
  region_short_name_map = { for full_region in local.regions : full_region =>
    join(
      "", [
        local.continent_short_name[split(
          "-",
          full_region
        )[0]],
        replace(
          split(
          "-", full_region)[1],
          "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/",
          "$1$2$3$4$5"
        )
      ]
    )
  }
}
