# Create null resource and provisioners 
resource "null" "null_copy_ssh_key_to_bastion" {
  depends_on = [ azurerm_linux_virtual_machine.bastion_host_linuxvm ]
  # Connection block for provisioner to connect to azure VM Instance
  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }

  provisioner "file" {
    source = "ssh-keys/terraform-azure.pem"
    destination = "/tmp/terraform-azure.pem"
    on_failure = continue
    when = create
  }

  # remote exec provisioner
  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /tmp/terraform-azure.pem"
     ]
  }
}


