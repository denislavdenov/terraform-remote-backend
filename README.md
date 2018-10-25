# Sample repo showing how to store your Terraform state file on a remote backend on Terrraform Enterprise Atlas backend

1. Create a free tier Terraform Enterprise account.
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

![enter image description here](https://cvws.icloud-content.com/B/AfBM9Hv1BjYXE13GYHMyp7fqHgsUAfQBidMKNEw35dv4KgnM580JbFaj/Screen+Shot+2018-10-25+at+17.48.07.png?o=AgfydEVijmUq2awAe6bJhLAM6xKe4FbbozEvluxR5nnn&v=1&x=3&a=B9m8_w-zSbbE286hfP-1I4Fo92g4A2y-RgEAAANdvkY&e=1540480079&k=GLffb64sfqBat30-78eqAw&fl=&r=bf7207c6-d2e6-450a-8daf-dfb3b70a098e-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=lFNhxlfFRVRNFFABQH8XbfkWsS8&cd=i)

![enter image description here](https://cvws.icloud-content.com/B/AYJEBHDxuM81b1k7i9H79CMRYhJ7ATCUIrCIp98DSQkQxmWdomkS4HmC/Screen+Shot+2018-10-25+at+17.48.55.png?o=AhjKTrpAiTwqBcVfta3y07e9eJNxWCL-BlsRYcB4GH0y&v=1&x=3&a=B33C3bZrf5rIkGvRah39Ro50lwFIA2--RgEAAANgvkY&e=1540480228&k=LEOVNJe9CvuhGUgj0dddCA&fl=&r=1c65b038-8ad6-455e-a4b8-0fda26429062-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=FMVvgWmqtpMsxiEHWKTxEFRXgFI&cd=i)

![enter image description here](https://cvws.icloud-content.com/B/Af_lUV2LSdpANlfFC5eVacAf5az6Aa9NjCW4AJglkXzT_ZNpD0YaEoji/Screen+Shot+2018-10-25+at+17.48.22.png?o=AgGnqEV1dx6ao8d38mE6BZRGuPdihveX97-cDvN0p34d&v=1&x=3&a=B8_jr7IEC6x2uOW5O56VIOYzsSoLA26-RgEAAANfvkY&e=1540480180&k=wyhrnCEk5ZtjlhJ0bH9yWg&fl=&r=a47f9826-67d1-4c8f-b856-9e996beaa71b-1&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=22&s=LKnRSVdnKdsN0ZIZVl-riMLK5j0&cd=i)

6. Add the following code to your main.tf file
   ```
   terraform {
     backend "atlas" {
       name    = "org/workspace"
     }
   }
   ```
7. You need to go to your user's settings in TFE and create a new Token and copy it somewere.
8. Run `terraform init` in order initialize Terraform with the new backend that is going to be used.
   You are going to be asked for your access token that you just created.
   You have to confirm that you want to copy your current local state file to the new backend.

**You can do multiple terraform destroy and apply and check the State section of your workspace to see the changes.**
