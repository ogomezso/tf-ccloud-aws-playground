environment                = "env-5wn6dz"
cluster                    = "lkc-w5v91g"
topics = [
  {
    name       = "teama_common_topic"
    partitions = 4
    config = {
      "delete.retention.ms" = "10000"
    }
  },
  {
    name       = "teama_restricted_topic"
    partitions = 4
    config = {
      "delete.retention.ms" = "10000"
    }
  },
  {
    name       = "teamb_common_topic"
    partitions = 4
    config = {
      "delete.retention.ms" = "10000"
    }
  },
  {
    name       = "teamb_restricted_topic"
    partitions = 4
    config = {
      "delete.retention.ms" = "10000"
    }
  }
]
