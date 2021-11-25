//general
//targetScope = 'managementGroup'
targetScope = 'subscription'
//param managementGroupIdentifier string
param subscriptionId string

//naming
//param resourceType string
//param nameMatch array
//param description string
//param policyName string


//resourcegroup
param resourceGroupName string
param location string

//storage
param storageName string
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param sku string


//modules
//module name 'modules/policy-naming.bicep' = {
  //scope: managementGroup(managementGroupIdentifier)
  //name: policyName
  //params: {
    //description: description
    //nameMatch: nameMatch
    //policyName: policyName
    //resourceType: resourceType
  //}
//}



module rg 'modules/resource-group.bicep' = {
  scope: subscription(subscriptionId)
  name: resourceGroupName
  params: {
    location: location
    resourceGroupName:resourceGroupName 
  }
}

module stg 'modules/storage.bicep' = {
  scope: resourceGroup(subscriptionId,resourceGroupName)
  name: storageName
  params: {
    sku: sku
    storageName: storageName
  }
}
