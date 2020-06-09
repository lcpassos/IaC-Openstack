#Este arquivo irá conter a senha do usuário no Painel do Openstack.
variable "senhas_acesso_openstack" {
	type = map

	default = {
		"senha_region1" = "coloque aqui a senha"
		"senha_region2" = "coloque aqui a senha"
	}
}
