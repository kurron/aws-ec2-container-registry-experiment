# ------------ input -------------------
variable "bob" {
    description = "Some description."
    default = "some value"
}

# ------------ resources -------------------

resource "aws_iam_group" "docker-registry-administrator" {
    name = "DockerRegistryAdministrator"
    path = "/"
}

resource "aws_iam_policy_attachment" "docker-registry-administrator-policy-attachment" {
    name = "docker-registry-administrator-policy-attachment"
    groups = ["${aws_iam_group.docker-registry-administrator.id}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group" "docker-registry-writer" {
    name = "DockerRegistryWriter"
    path = "/"
}

resource "aws_iam_policy_attachment" "docker-registry-writer-policy-attachment" {
    name = "docker-registry-writer-policy-attachment"
    groups = ["${aws_iam_group.docker-registry-writer.id}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_group" "docker-registry-reader" {
    name = "DockerRegistryReader"
    path = "/"
}

resource "aws_iam_policy_attachment" "docker-registry-reader-policy-attachment" {
    name = "docker-registry-reader-policy-attachment"
    groups = ["${aws_iam_group.docker-registry-reader.id}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# ------------ outputs ----------------------

output "bob" {
    value = "bob"
}
