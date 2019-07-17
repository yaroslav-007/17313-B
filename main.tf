 terraform {
   backend "remote" {
     organization = "yaroslav-org"

     workspaces {
       name = "Workspace-B"
     }
   }
 }



data "terraform_remote_state" "workspace-a" {
  backend = "remote"

  config = {
    organization = "yaroslav-org"
    workspaces = {
      name = "Workspace-A"
    }
  }

}





resource "null_resource" "HelloString" {
  provisioner "local-exec" {
    command = "echo Hello ${data.terraform_remote_state.workspace-a.outputs.sluchaen_string}"
  }
}

