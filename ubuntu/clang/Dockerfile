ARG ubuntu_version
FROM ghcr.io/rse-radiuss/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version

# Use the autamus build cache for maybe faster install?
RUN apt-get update && apt-get install -y gnupg2 python3-dev python3-pip && \
    pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

RUN spack install llvm@${llvm_version}
RUN spack view symlink /opt/view llvm@${llvm_version}
