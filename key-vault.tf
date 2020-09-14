data "azurerm_client_config" "current" {}

module "key_vault" {
  source                  = "git@github.com:hmcts/cnp-module-key-vault?ref=azurermv2"
  name                    = "${var.product}-${var.env}"
  product                 = var.product
  env                     = var.env
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.jenkins_AAD_objectId
  resource_group_name     = azurerm_resource_group.rg.name
  product_group_object_id = ""
  common_tags             = var.common_tags
}

output "vaultName" {
  value = module.key_vault.key_vault_name
}
