
#
#    Debian 8 (jessie) VestaCP0 System (dockerfile)
#    Copyright (C) 2016-2017 Stafli
#    Luís Pedro Algarvio
#    This file is part of the Stafli Application Stack.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#
# Build
#

# Base image to use
FROM stafli/stafli.system.base:base10_debian8

# Labels to apply
LABEL description="Stafli VestaCP Application (stafli/stafli.app.vestacp), Based on Stafli Base System (stafli/stafli.system.base" \
      maintainer="lp@algarvio.org" \
      org.label-schema.schema-version="1.0.0-rc.1" \
      org.label-schema.name="Stafli VestaCP Application (stafli/stafli.app.vestacp)" \
      org.label-schema.description="Based on Stafli Base System (stafli/stafli.system.base" \
      org.label-schema.keywords="stafli, vestacp, app, debian, centos" \
      org.label-schema.url="https://stafli.org/" \
      org.label-schema.license="GPLv3" \
      org.label-schema.vendor-name="Stafli" \
      org.label-schema.vendor-email="info@stafli.org" \
      org.label-schema.vendor-website="https://www.stafli.org" \
      org.label-schema.authors.lpalgarvio.name="Luis Pedro Algarvio" \
      org.label-schema.authors.lpalgarvio.email="lp@algarvio.org" \
      org.label-schema.authors.lpalgarvio.homepage="https://lp.algarvio.org" \
      org.label-schema.authors.lpalgarvio.role="Maintainer" \
      org.label-schema.registry-url="https://hub.docker.com/r/stafli/stafli.app.vestacp" \
      org.label-schema.vcs-url="https://github.com/stafli-org/stafli.app.vestacp" \
      org.label-schema.vcs-branch="master" \
      org.label-schema.os-id="debian" \
      org.label-schema.os-version-id="jessie" \
      org.label-schema.os-architecture="amd64" \
      org.label-schema.version="1.0"

#
# Arguments
#

#
# Environment
#

# Working directory to use when executing build and run instructions
# Defaults to /.
#WORKDIR /

# User and group to use when executing build and run instructions
# Defaults to root.
#USER root:root

#
# Packages
#

# Custom script
RUN printf "Running custom script...\n" && \
    \
    git clone -b patch-2 https://github.com/lpalgarvio/vesta.git && \
    bash -c "cd vesta/install && ./vst-install.sh"; \
    bash -c "cd vesta/install && ./vst-install-debian.sh --interactive=no"; \
    \
    printf "Finished running custom script...\n";

#
# Configuration
#

#
# Run
#

# Command to execute
# Defaults to /bin/bash.
#CMD ["/bin/bash"]

# Ports to expose
# Defaults to none.
#EXPOSE ...

