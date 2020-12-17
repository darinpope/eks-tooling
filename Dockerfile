FROM centos:centos8

COPY greeting.sh /etc/profile.d/greeting.sh
COPY bashrc /root/.bashrc

RUN cd /usr/local/bin && \
    yum -y install unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/0.34.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin && \
    curl -o kubectl "https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl" && \
    chmod +x /usr/local/bin/kubectl && \
    curl --silent --location "https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin && \
    curl --silent --location "https://s3.amazonaws.com/cloudbees-core-cli/master/cloudbees-linux-amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/cloudbees /usr/local/bin && \
    curl --silent --location "https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx_v0.9.1_linux_x86_64.tar.gz"  | tar xz -C /tmp && \
    mv /tmp/kubectx /usr/local/bin && \
    curl --silent --location "https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens_v0.9.1_linux_x86_64.tar.gz"  | tar xz -C /tmp && \
    mv /tmp/kubens /usr/local/bin && \
    chown -R root:root /usr/local/bin