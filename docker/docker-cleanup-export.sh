# 1. Make the script executable:
chmod +x docker_cleanup.sh

# 2. Move the script to a system directory in your PATH.  /usr/local/bin is a common choice:
sudo mv docker_cleanup.sh /usr/local/bin/

# 3. Create a symbolic link (optional but recommended for easier updates):
sudo ln -s /usr/local/bin/docker_cleanup.sh /usr/bin/docker_cleanup

# 4. (Optional but good practice) Create a man page (if you want to be fancy):
# You can use a tool like `help2man` for this.  Install it (e.g., `sudo apt-get install help2man` on Debian/Ubuntu), then:
# help2man -m docker_cleanup.sh > docker_cleanup.1
# sudo mv docker_cleanup.1 /usr/share/man/man1/

# Now you can run the script from anywhere:
docker_cleanup
