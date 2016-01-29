# ------------ input -------------------
variable "bob" {
    description = "Some description."
    default = "some value"
}

# ------------ resources -------------------

resource "aws_iam_group" "docker-registry-administrator" {
    name = "docker-registry-administrator"
    path = "/"
}

resource "aws_iam_policy_attachment" "docker-registry-administrator-policy-attachment" {
    name = "docker-registry-administrator-policy-attachment"
    groups = ["${aws_iam_group.docker-registry-administrator.id}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

# ------------ outputs ----------------------

output "bob" {
    value = "bob"
}
