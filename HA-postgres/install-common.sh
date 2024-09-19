# Install Percona Distribution for PostgreSQL
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
sudo apt update
sudo percona-release setup ppg-15
sudo apt install percona-ppg-server-15 -y

# Install some Python and auxiliary packages to help with Patroni and etcd
sudo apt install python3-pip python3-dev binutils -y

# Install etcd, Patroni, pgBackRest packages
sudo apt install percona-patroni etcd etcd-server etcd-client percona-pgbackrest -y

# Stop and disable all installed services
sudo systemctl stop {etcd,patroni,postgresql}
sudo systemctl disable {etcd,patroni,postgresql}
sudo rm -rf /var/lib/postgresql/15/main