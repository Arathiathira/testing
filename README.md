# testing
## Explanation
##Main:
##Create CI pipeline:
 Go to pipelines-> New Pipeline-> Select the git repository(select correct branch)-> 
 Take Starter pipeline. 
 Add 1.Copy files(delete last 2 line)
     2.Publish build artifacts (leave only PathtoPublish )
     Like:
     - task: CopyFiles@2
  inputs:
    TargetFolder: '$(build.artifactstagingdirectory)'
- task: PublishBuildArtifacts@1
  inputs:
    PathtoPublish: '$(Build.ArtifactStagingDirectory)'
Run the pipeline- check it by looking the artifacts build 

##Create CD pipeline:
 Go to Release in pipeline. Select empty job. Select the artifact(ie the repo with our code). 
 After that we will set the stage1
 Create 1 job with 6 tasks
   1.Azure CLI
     Script Type= Poweshell
     Script Location = Inline script
     Inline Script=
     # this will create Azure resource group
     az group create --location southindia --name $(resourcegroupname)      
     az storage account create --name $(storagename) --resource-group $(resourcegroupname) --location southindia --sku Standard_LRS
     az storage container create --name $(container_name) --account-name $(storagename)
     //In variables provide:
     container_name=c1234567abc
     resourcegroupname=r1234567abc
     storagename=s1234567abc
     
   2.Replace tokens in **/*.config
     
     Root directory =select till drop file 
     Target files =**/*.tf
     
     
   3.Install Terraform
   4.Terraform init
         Select correct command.
         Configuration directory= select till drop file
         container_name=c1234567abc
         resourcegroupname=r1234567abc
         storagename=s1234567abc
         key=terraform.tfstate
   
   5.Terraform plan
    Select correct command.
   6.Terraform apply
    Select correct command.
  
 ## Result:
 In r1234567abc: s1234567abc is created and c1234567abc is created inside it
 In arsrg: Both appserice plan and appservice is created
     
 


##Branch1:
 was a failure
