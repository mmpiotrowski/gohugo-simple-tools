#!/usr/bin/python3

import subprocess
import os

# git repo workdir
repo_dir = subprocess.check_output(['git rev-parse --show-toplevel'],shell=True, cwd=os.getcwd()).decode('utf-8').strip("\n")

# get latest version from tags
version_from_tags = int(subprocess.check_output(
    [f'git fetch -t && git tag -l | grep version | sort -r | head -n 1'],
    shell=True
).decode('utf-8').strip("\n").split('_')[1])

print(f'Current version:{version_from_tags}')
bump_version = version_from_tags + 1
print(f'Bump to version:{bump_version}')
# bump version
subprocess.check_output([f'git tag -a version_{bump_version} -m "Bump version to {bump_version}" && git push --tags '],shell=True)
