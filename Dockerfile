FROM centos:8.2.2004

RUN cd /usr/local/bin && \
    yum -y install python36 python36-devel python3-setuptools python3-pip && \
    pip3 install awscli --upgrade && \
    curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin && \
    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl --silent --location "https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin && \
    curl --silent --location "https://s3.amazonaws.com/cloudbees-core-cli/master/cloudbees-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/cloudbees /usr/local/bin