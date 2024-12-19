## Folder for Bicep & PowerShell files 

Use to pre-install Microsoft Sentinel and Content Hub Solutions from WIN1.

### Instructions

1. Create a *Resource Group* for the deployment.

    ```azurecli
     az group create --location eastus --resource-group Defender-RG
    ```

1. Deploy the Bicep template.

    ```azurecli
    az deployment group create --name testDeploy --template-file .\sentinel.bicep --parameters .\sentinelParams.bicepparam --resource-group Defender-RG
    ```

### Additional Information

See the following *Microsoft Tech Community* blog post for more information: [Deploy Microsoft Sentinel using Bicep](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/deploy-microsoft-sentinel-using-bicep/4270970)
