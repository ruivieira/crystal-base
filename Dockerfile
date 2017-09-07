FROM centos:latest

USER root

RUN yum install -y curl wget sqlite3

ADD crystal.repo /etc/yum.repos.d/crystal.repo

RUN rpm --import https://dist.crystal-lang.org/rpm/RPM-GPG-KEY \
	&& yum install -y crystal

CMD ["/bin/bash"]