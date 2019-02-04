FROM centos:6

LABEL org.label-schema.vcs-url="https://github.com/hpcdevops/docker-centos6-rocksbuilder.git" \
      org.label-schema.docker.cmd="docker run -it -h rocksbuild hpcdevops/docker-centos6-rocksbuilder:latest" \
      org.label-schema.name="docker-centos6-rocksbuilder" \
      org.label-schema.description="Rocks 6 Roll Build Host on CentOS 6" \
      maintainer="HPCDevOps <hpcdevops@gmail.com>"

ARG ROCKS_TAG=ROCKS_6_2

COPY rocks-forge-6.repo /etc/yum.repos.d/rocks-forge-6.repo

RUN yum makecache fast \
    && yum -y update \
    && yum -y install \
        alsa-lib-devel \
        anaconda \
        apr \
        apr-devel \
        apr-util-devel \
        atk-devel \
        audit-libs-devel \
        autoconf \
        autofs \
        automake \
        bash-completion \
        binutils-devel \
        bison \
        bzip2 \
        bzip2-devel \
        cairo-devel \
        cdrecord \
        compat-libf2c-34 \
        createrepo \
        cups-libs \
        curl-devel \
        cvs \
        device-mapper-devel \
        dhclient \
        docbook-dtds \
        docbook-style-dsssl \
        docbook-style-xsl \
        docbook-utils \
        docbook-utils-pdf \
        e2fsprogs-devel \
        elfutils \
        elfutils-devel \
        elfutils-libelf-devel \
        elinks \
        environment-modules \
        expat-devel \
        expect \
        fontconfig-devel \
        freetype-devel \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        gdb \
        ghostscript \
        ghostscript-fonts \
        git \
        glib2-devel \
        glibc-static \
        grub \
        gtk2 \
        gtk2-devel \
        httpd-devel \
        ImageMagick \
        intltool \
        iscsi-initiator-utils \
        iscsi-initiator-utils-devel \
        isomd5sum-devel \
        kernel-devel \
        kernel-doc \
        libarchive-devel \
        libblkid-devel \
        libcurl-devel \
        libgfortran \
        libglade2-devel \
        libIDL \
        libIDL-devel \
        libjpeg-devel \
        libnl-devel \
        libobjc \
        libotf \
        libpcap \
        libpng-devel \
        libstdc++-devel \
        libtool \
        libtool-ltdl \
        libXaw \
        libXaw-devel \
        libXxf86misc-devel \
        lsof \
        make \
        mkisofs \
        mysql \
        mysql-devel \
        MySQL-python \
        mysql-server \
        ncurses-devel \
        netpbm \
        netpbm-progs \
        net-snmp \
        net-snmp-utils \
        NetworkManager-devel \
        NetworkManager-glib-devel \
        newt-devel \
        nspr-devel \
        ntp \
        OpenIPMI \
        OpenIPMI-devel \
        OpenIPMI-libs \
        OpenIPMI-perl \
        OpenIPMI-python \
        OpenIPMI-tools \
        openssh-askpass \
        openssh-server \
        pam-devel \
        pango-devel \
        pciutils-devel \
        pcre-devel \
        perl \
        perl-DBI \
        perl-ExtUtils-ParseXS \
        perl-SGMLSpm \
        php-mysql \
        portmap \
        postfix \
        psmisc \
        pycairo-devel \
        pygobject2-devel \
        python-devel \
        python-pip \
        PyXML \
        rcs \
        rdate \
        redhat-lsb \
        redhat-rpm-config \
        readline-devel \
        rpm-build \
        rpm-devel \
        screen \
        sharutils \
        slang-devel \
        sqlite-devel \
        squashfs-tools \
        swig \
        syslinux-perl \
        sysstat \
        tcl \
        tcl-devel \
        tcpdump \
        tcsh \
        tk-devel \
        unzip \
        urw-fonts \
        usermode \
        vim-enhanced \
        wget \
        wodim \
        xorg-x11-xauth

RUN yum -y install \
    foundation-ant \
    foundation-coreutils \
    foundation-gawk \
    foundation-git \
    foundation-graphviz \
    foundation-libxml2 \
    foundation-mercurial \
    foundation-mysql \
    foundation-python \
    foundation-python-extras \
    foundation-python-setuptools \
    foundation-python-xml \
    foundation-rcs \
    foundation-redhat \
    foundation-tidy \
    foundation-wget \
    librocks

RUN yum -y install \
    rocks-411 \
    rocks-admin \
    rocks-bittorrent \
    rocks-boot \
    rocks-boot-auto \
    rocks-boot-xen \
    rocks-channel \
    rocks-config \
    rocks-devel \
    rocks-java \
    rocks-kickstart \
    rocks-pylib \
    rocks-restore-roll \
    rocks-sec-channel-client \
    rocks-snmp-status \
    rocks-sql \
    rocks-ssl \
    rocks-upstart \
    tentakel \
    && yum -y clean all \
    && rm -rf /var/cache/yum

RUN groupadd -g 403 -r rocksdb && useradd -d /var/opt/rocks/mysql -g rocksdb -r -s /bin/false -u 403 rocksdb

VOLUME ["/var/opt/rocks/mysql", "/export/rocks/install", "/export/rocks/src"]

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
