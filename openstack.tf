# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "user_painel"
  tenant_name = "Nome_do_Tenant"
  password    = var.senhas_acesso_openstack["senha_region1"]
  auth_url    = "URL_do_Keystone_region1"
  region      = "código_da_region1"
}

provider "openstack" {
  alias = "region2"
  user_name   = "user_painel"
  tenant_name = "Nome_do_Tenant"
  password    = var.senhas_acesso_openstack["senha_region2"]
  auth_url    = "URL_do_Keystone_region2"
  region      = "código_da_region2"
}

#Criando um Cluster de 3 Instâncias
resource "openstack_compute_instance_v2" "instance_by_terraform" {
  count = 3
  name      = "instace_by_terraform${count.index}"
  image_id  = "coloque_aqui_o_id_da_imagem"
  flavor_id = "coloque_aqui_o_id_do_flavor"
  security_groups = ["Coloque_aqui_o_nome_do_Grupo_de_Segurança"]
  key_pair = "Coloque_aqui_o_nome_da_key_par_a_ser_utilizada"
  network {
    name = "Coloque_aqui_o_nome_da_Rede_que_será_utilizada"
  }
}

#Criando um cluster de 3 Instâncias
resource "openstack_compute_instance_v2" "instance_by_terraform-tb" {
  provider = openstack.region2
  count = 3
  name      = "instace_by_terraform${count.index}"
  image_id  = "coloque_aqui_o_id_da_imagem"
  flavor_id = "coloque_aqui_o_id_do_flavor"
  security_groups = ["Coloque_aqui_o_nome_do_Grupo_de_Segurança"]
  key_pair = "Coloque_aqui_o_nome_da_key_par_a_ser_utilizada"
  network {
  name = "Coloque_aqui_o_nome_da_Rede_que_será_utilizada"
  }   
}

