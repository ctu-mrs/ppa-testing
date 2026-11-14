#!/bin/bash

curl -s --compressed --retry 4 --retry-connrefused "https://ctu-mrs.github.io/ppa-testing/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg > /dev/null
sudo curl -s --compressed --retry 4 --retry-connrefused -o /etc/apt/sources.list.d/ctu-mrs-testing.list "https://ctu-mrs.github.io/ppa-testing/ctu-mrs-apt.list"
sudo curl -s --compressed --retry 4 --retry-connrefused -o /etc/apt/preferences.d/ctu-mrs-testing-preferences "https://ctu-mrs.github.io/ppa-testing/ctu-mrs-ppa-preferences.txt"

sudo apt-get -o Acquire::Retries=4 update
