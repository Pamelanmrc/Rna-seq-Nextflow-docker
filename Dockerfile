FROM mambaorg/micromamba:1.5.8

ENV DEBIAN_FRONTEND=noninteractive \
    MAMBA_NO_BANNER=1

USER root

RUN set -eux; \
    mkdir -p /var/lib/apt/lists/partial; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      bash coreutils findutils gawk tar unzip bzip2 pigz procps \
      ca-certificates curl wget git; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    micromamba install -y -n base -c conda-forge -c bioconda \
      openjdk=17 \
      fastqc=0.12.1 \
      star=2.7.11b \
      rsem=1.3.3 \
      samtools=1.20; \
    micromamba clean -a -y

RUN set -eux; \
    curl -fsSL https://get.nextflow.io -o /usr/local/bin/nextflow; \
    chmod +x /usr/local/bin/nextflow

# Just put /opt/conda/bin first on PATH:
ENV PATH=/opt/conda/bin:$PATH

WORKDIR /workspace
SHELL ["/bin/bash","-lc"]
CMD ["bash"]

