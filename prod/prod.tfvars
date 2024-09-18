environment = "prod"


instances_names = {
    mysql-prod = "t2.micro"
    frontend-prod = "t2.micro"
    backend-prod = "t2.micro"
}

tags = {
    Environment = "prod"
}