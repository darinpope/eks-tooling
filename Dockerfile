FROM centos:centos8

COPY greeting.sh /etc/profile.d/greeting.sh
COPY bashrc /root/.bashrc

RUN cd /usr/local/bin && \
    yum -y install python36 python36-devel python3-setuptools python3-pip && \
    pip3 install awscli --upgrade && \
    curl -o aws-iam-authenticator "https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator" && \
    chmod +x /usr/local/bin/aws-iam-authenticator && \
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/0.26.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin && \
    curl -o kubectl "https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl" && \
    chmod +x /usr/local/bin/kubectl && \
    curl --silent --location "https://get.helm.sh/helm-v3.3.0-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin && \
    curl --silent --location "https://s3.amazonaws.com/cloudbees-core-cli/master/cloudbees-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/cloudbees /usr/local/bin && \
    curl --silent --location "https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx_v0.9.1_linux_x86_64.tar.gz"  | tar xz -C /tmp && \
    mv /tmp/kubectx /usr/local/bin && \
    curl --silent --location "https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens_v0.9.1_linux_x86_64.tar.gz"  | tar xz -C /tmp && \
    mv /tmp/kubens /usr/local/bin && \
    chown -R root:root /usr/local/bin