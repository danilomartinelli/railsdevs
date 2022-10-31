FROM gitpod/workspace-postgresql
USER gitpod

# Install Ruby version 2.7.6 and set it as default
RUN _ruby_version=ruby-2.7.6 \
    && printf "rvm_gems_path=/home/gitpod/.rvm\n" > ~/.rvmrc \
    && bash -lc "rvm reinstall ${_ruby_version} && \
    rvm use ${_ruby_version} --default" \
    && printf "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc \
    && printf "{ rvm use \$(rvm current); } >/dev/null 2>&1\n" >> "$HOME/.bashrc.d/70-ruby"

RUN sudo apt-get update \
    && sudo apt-get install -y \
    redis-server \
    && sudo rm -rf /var/lib/apt/lists/*