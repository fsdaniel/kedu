package main


deny[msg] {
  input.kind = "Deployment"
  input.spec.template.spec.containers[i] = container
  not container.securityContext.runAsNonRoot = true
  msg = "Containers must not run as root"
}

deny[msg] {
  input.kind = "Deployment"
  not input.spec.selector.matchLabels.app
  msg = "Containers must provide app label for pod selectors"
}

  # always desire resource limit
deny[msg] {
  input.kind = "Deployment"
  input.spec.template.spec.containers[i] = container
  not container.resources.limits.cpu
  msg = "Containers must have cpu limit set"
}

deny[msg] {
  input.kind = "Deployment"
  input.spec.template.spec.containers[i] = container
  not container.resources.limits.memory
  msg = "Containers must have memory limit set"
}

warn[msg] {
  input.kind = "Deployment"
  input.spec.template.spec.containers[i] = container
  not container.resources.requests.cpu
  msg = "Containers should have cpu request set"
}

warn[msg] {
  input.kind = "Deployment"
  input.spec.template.spec.containers[i] = container
  not container.resources.requests.memory
  msg = "Containers should have memory request set"
}

# Don't allow container images with no version tag, or a version tag that doesn't contain at least one digit

missingImageVersion(imageName) {
  not re_match(`.*:.*\d.*$`, imageName)
}

warn[msg] {
  input.kind = "Deployment"
  badImages = {image |
  image = input.spec.template.spec.containers[_].image
  missingImageVersion(image, true)
  }

  count(badImages) > 0
  names = concat(", ", badImages)
  msg = sprintf("Container images must specify a version (%s)", [names])
}