targetScope  = 'managementGroup'
//naming
param managementGroupIdentifier string
param initiativeName string          = 'Non-Prod-Naming'
//allowed vm skus
var policyDeployment          = '${assignmentName}-${guid(time)}'
var assignmentName            = 'Allowed-VM-SKU'
param time string             = utcNow('d')
//modules
module name 'initiative-dev-naming.bicep' = {
  scope: managementGroup(managementGroupIdentifier)
  name: initiativeName
}

module vm 'policy-dev-vm-skus.bicep' = {
  name: policyDeployment
}
