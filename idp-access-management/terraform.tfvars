environment = "env-5wn6dz"

cluster = "lkc-w5v91g"

identity_provider = "op-q0G"

identity_pools = [
  {
    identity_pool = {
      display_name   = "teama_adm"
      description    = "Team A ADM Pool"
      identity_claim = "claims.sub"
      filter         = "claims.aud=='1326f8fe-6d30-456b-a34c-93f13cac0da1'"
    }
    roles = [
      {
        role            = "ResourceOwner"
        resource        = "topic"
        resource_prefix = "teama_common*"
      },
      {
        role            = "ResourceOwner"
        resource        = "group"
        resource_prefix = "teama_common*"
      }
    ]
  }
]


