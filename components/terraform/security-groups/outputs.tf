output "mysql_ami_build_sg_id" {
    value = aws_security_group.mysql_main_ami.id
}
