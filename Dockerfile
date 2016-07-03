#FROM manastech/crystal
FROM greyltc/archlinux
MAINTAINER Arthur Poulet <arthur.poulet@mailoo.org>

# Install crystal
RUN pacman -Syu --noprogressbar --noconfirm crystal shards llvm35 llvm35-libs clang35 base-devel libxml2

# Add this directory to container as /app
ADD . /app
WORKDIR /app

# Install dependencies
RUN shards install update

# Build our app
RUN crystal compile --release src/*.cr -o app

# Run the tests
RUN crystal spec

# Start
EXPOSE 3000
ENTRYPOINT ./app --port 3000
