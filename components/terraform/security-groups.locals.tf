locals {
    private_beta_sg_name        = "private-beta-sg"
    private_beta_sg_description = "allowing access from private subnets"

    private_beta_ingress_cidr = {
        "priv_a_sub" = {
            "sg"       = "private_beta_sg"
            "from_port"   = 5432
            "to_port"     = 5432
            "ip_protocol" = "tcp"
            "description" = "private subnet a"
            "cidr_blocks" = data.aws_ssm_parameter.private_subnet_a_cidr.value
        }
        "priv_b_sub" = {
            "sg"       = "private_beta_sg"
            "from_port"   = 5432
            "to_port"     = 5432
            "ip_protocol" = "tcp"
            "description" = "private subnet b"
            "cidr_blocks" = data.aws_ssm_parameter.private_subnet_b_cidr.value
        }
        "client_vpn" = {
            "sg"       = "private_beta_sg"
            "from_port"   = 5432
            "to_port"     = 5432
            "ip_protocol" = "tcp"
            "description" = "client-vpn"
            "cidr_blocks" = data.aws_ssm_parameter.client_vpc_cidr.value
        }
    }

    private_beta_ingress_self = {
        "self" = {
            "sg"       = "private_beta_sg"
            "from_port"   = 5432
            "to_port"     = 5432
            "ip_protocol" = "tcp"
            "description" = "group members"
        }
    }

    # outbound CIDR
    #
    private_beta_egress_cidr = {
        "egress" = {
            "sg"       = "private_beta_sg"
            "from_port"   = 1024
            "to_port"     = 65535
            "ip_protocol" = "tcp"
            "description" = "to everywhere"
            "cidr_blocks" = [
                "0.0.0.0/0"
            ]
        }
    }
}
