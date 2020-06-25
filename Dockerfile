FROM registry.access.redhat.com/ubi8/python-36:1-102

RUN cd /opt/app-root/bin && \
    pip3 install awscli --upgrade && \
    curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /opt/app-root/bin && \
    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl && \
    chmod +x /opt/app-root/bin/kubectl && \
    curl --silent --location "https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/linux-amd64/helm /opt/app-root/bin && \
    curl --silent --location "https://s3.amazonaws.com/cloudbees-core-cli/master/cloudbees-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/cloudbees /opt/app-root/bin