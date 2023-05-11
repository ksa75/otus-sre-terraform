
name_of_ns = "my-first-tf-namespace"

resource_quotas = {
  quote1 = {
    metadata = {
      name = "pods-high"
    }
    spec = {
      hard = {
        cpu    = "1000"
        memory = "200Gi"
        pods   = "10"
      }
      scopes        = []
      scopeSelector = { matchExpressions = [{ operator = "In", scopeName = "PriorityClass", values = ["high"] }] }
    }
  }

  quote2 = {
    metadata = {
      name = "pods-medium"
    }
    spec = {
      hard = {
        cpu    = "10"
        memory = "20Gi"
        pods   = "10"
      }
      scopes        = []
      scopeSelector = { matchExpressions = [{ operator = "In", scopeName = "PriorityClass", values = ["medium"] }] }
    }
  }

  quote3 = {
    metadata = {
      name = "pods-low"
    }
    spec = {
      hard = {
        cpu    = "5"
        memory = "10Gi"
        pods   = "10"
      }
      scopes        = []
      scopeSelector = { matchExpressions = [{ operator = "In", scopeName = "PriorityClass", values = ["low"] }] }
    }
  }

  quote4 = {
    metadata = {
      name = "test"
    }
    spec = {
      hard = {
        pods = "10"
      }
      scopes        = ["BestEffort"]
      scopeSelector = { matchExpressions = [{ operator = "NotIn", scopeName = "PriorityClass", values = ["NotExistingClass"] }] }
    }
  }

  quote5 = {
    metadata = {
      name = "reqsandlims"
    }
    spec = {
      hard = {
        "requests.cpu"    = "1"
        "requests.memory" = "1Gi"
        "limits.cpu"      = "2"
        "limits.memory"   = "2Gi"
      }
      scopes        = []
      scopeSelector = { matchExpressions = [{ operator = "NotIn", scopeName = "PriorityClass", values = ["NotExistingClass"] }] }
    }
  }

}


roles = {
  role1 = {
    metadata = {
      name   = "role1"
      labels = { mode = "tf" }
    }
    rules = [{
      api_groups     = [""]
      resources      = ["pods"]
      resource_names = ["foo"]
      verbs          = ["get", "list", "watch"]
      },
      {
        api_groups     = ["apps"]
        resources      = ["deployments"]
        resource_names = [""]
        verbs          = ["get", "list"]
    }]
  }
  role2 = {
    metadata = {
      name   = "role2"
      labels = { mode = "tf" }
    }
    rules = [{
      api_groups     = ["apps"]
      resources      = ["deployments"]
      resource_names = []
      verbs          = ["get", "list"]
    }, ]
  }
}

rolebinds = {
  rolebind1 = {
    metadata = {
      name = "rolebind1"
    }
    role_ref = {
      api_group = "rbac.authorization.k8s.io"
      kind      = "Role"
      name      = "admin"
    }
    subjects = [{
      kind      = "User"
      name      = "admin"
      api_group = "rbac.authorization.k8s.io"
      namespace = ""
      },
      {
        kind      = "ServiceAccount"
        name      = "default"
        api_group = ""            #!4sa
        namespace = "kube-system" #only4sa
      },
      {
        kind      = "Group"
        name      = "system:masters"
        api_group = "rbac.authorization.k8s.io"
        namespace = ""
    }, ]
  }
}   