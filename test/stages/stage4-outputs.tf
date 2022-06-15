
resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.cp-datastage.name
        inst_name   = module.cp-datastage.inst_name
        sub_chart   = module.cp-datastage.sub_chart
        sub_name   = module.cp-datastage.sub_name 
        operator_namespace = module.cp-datastage.operator_namespace
        cpd_namespace= module.cp-datastage.cpd_namespace
        branch      = module.cp-datastage.branch
        namespace   = module.cp-datastage.namespace
        server_name = module.cp-datastage.server_name
        layer       = module.cp-datastage.layer
        layer_dir   = module.cp-datastage.layer == "infrastructure" ? "1-infrastructure" : (module.cp-datastage.layer == "services" ? "2-services" : "3-applications")
        type        = module.cp-datastage.type
      })
    }
  }
}