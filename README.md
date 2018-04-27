# Ohai plugin for Windows Licencing Information

This plugin pulls the information from `slmgr.vbs` and stores it in attributes. Some potential use cases could be re-activating systems onto the proper product key or fixing systems that might have an incorrect KMS server by adjusting the server's DNS settings.

## Sample data

``` JSON
"mslicense": {
  "windowslicense": {
    "keyManagementService": {
      "registeredKmsMachineName": "kms.domain.tld:1688",
      "MachineIpAddress": "123.123.123.123",
      "machineExtendedPid": "12345-67890-123-123456-78-9012-3456.0000-7890123",
      "activationInterval": "120 minutes",
      "renewalInterval": "10080 minutes",
      "hostCaching": "enabled"
    },
    "serviceVersion": "6.3.9600.18376",
    "activationId": "ae9ee916-c5cb-4e4a-816b-7d06143f7426",
    "applicationId": "d63523ff-e60c-477f-ac0d-5a79ffe3c62e",
    "extendedPid": "12345-67890-123-123456-78-9012-3456.0000-7890123",
    "productKeyChannel": "Volume",
    "installationId": "123456789012345678901234567890123456789012345678901234567890123",
    "partialProductKey": "Q1W2E",
    "licenseStatus": "Licensed",
    "volumeActiviationExpiration": "259192 minute(s) (180 day(s))",
    "windowsRearmCount": "997",
    "skuRearmCount": "1001",
    "trustedTime": "4/27/2018 6:14:49 PM"
  }
}
```