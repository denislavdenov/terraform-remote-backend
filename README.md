# Sample repo showing how to store your Terraform state file on a remote backend on Terrraform Enterprise Atlas backend

1. Create Terraform Enterprise account.
2. Create a main.tf file with a null resource or any other
   ```
   resource "null_resource" "helloWorld" {
     provisioner "local-exec" {
       command = "echo hello world"
     }
   }
   ```
3. Run `terraform init` and `terraform apply` so you create a local state file first.
4. Add `.terraform` folder and `terraform.tfstate*` to `.gitignore` if you are going to use this code within GH repo
5. Go to Terraform Enterprise and create and organization and a new workspace choosing None as a source.

<img src="https://cvws.icloud-content.com/B/AfBM9Hv1BjYXE13GYHMyp7fqHgsUAfQBidMKNEw35dv4KgnM580JbFaj/Screen+Shot+2018-10-25+at+17.48.07.png?o=AgvjtcvwmhJMd399jcFXO_pLiKNi63KcAI-XhZaQKr11&v=1&x=3&a=B6wPcZ5dOdjLNf7NZEXKDiWcNWZdAzXTRgEAAAMm00Y&e=1540799301&k=GLffb64sfqBat30-78eqAw&fl=&r=15d57656-3863-4cbb-9641-560f504c9070-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=74S9J3LJJ8saUXM0N0PWhZxCxEw&cd=i" width="160" height="160" /> 
<img src="https://cvws.icloud-content.com/B/AYJEBHDxuM81b1k7i9H79CMRYhJ7ATCUIrCIp98DSQkQxmWdomkS4HmC/Screen+Shot+2018-10-25+at+17.48.55.png?o=Au8moGmYk-B2PAJeGvda-OPa6tS-iUcGgMOWVy4bIlk0&v=1&x=3&a=Bw827OvszWoYq7IZOpBkR0-Vi9iNAzvTRgEAAAMs00Y&e=1540799678&k=LEOVNJe9CvuhGUgj0dddCA&fl=&r=c9f690b2-fa4a-4f3a-8941-4bf3e84a8828-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=wOM_EvziMTUH7oN99b1J6DAoO1I&cd=i" width="160" height="160" /> 
<img src="https://cvws.icloud-content.com/B/Af_lUV2LSdpANlfFC5eVacAf5az6Aa9NjCW4AJglkXzT_ZNpD0YaEoji/Screen+Shot+2018-10-25+at+17.48.22.png?o=AkDzAUeMIaMXJTOSBOCJ9gMAELLF_ADds18NRI3yqr7l&v=1&x=3&a=B-AIrHD_h80uc0jExJtXtosLLj3FAzvTRgEAAAMs00Y&e=1540799675&k=wyhrnCEk5ZtjlhJ0bH9yWg&fl=&r=12c4362a-656f-4043-8a2e-788aac4d43eb-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=7qv6SedH9inUzRRH6nYoouB_YJw&cd=i" width="55%" height="100" />

6. Add the following code to your main.tf file
   ```
   terraform {
     backend "atlas" {
       name    = "org/workspace"
     }
   }
   ```
7. You need to go to your user's settings in TFE and create a new Token and copy it somewere.

<img src="https://cvws.icloud-content.com/B/AW6txU9PvIrXo9HLYa81WGqk0C9bActWXI4hXCnVLUHL35IgpThM2CDj/Screen+Shot+2018-10-25+at+17.49.23.png?o=AnHSTzK2Mea972bdX56C7YCTbDPVOJMTsJE-RW1i-eLD&v=1&x=3&a=B2b8aYbeN4JHBYzS2FgCOVJIf6LrA0LTRgEAAAMz00Y&e=1540800070&k=Yzt-LuAZ4ShK3QeQv7x_2g&fl=&r=f59a2158-dd6d-4abd-a4a6-5843bcf880a4-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=TTzeR_3wFslUVEcUQaPfrWFOkTE&cd=i" width="65%" height="65%" />

8. Run `terraform init` in order initialize Terraform with the new backend that is going to be used.
   You are going to be asked for your access token that you just created.
   You have to confirm that you want to copy your current local state file to the new backend.

**You can do multiple terraform destroy and apply and check the State section of your workspace to see the changes.**
