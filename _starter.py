#!/usr/bin/env python3
import sys
import logging
from pathlib import Path
from pprint import pformat

import toml

p = Path("~/.config/jack.laxson", "packages.toml")
pkgs = toml.load(p.expanduser())

def to_string():
    print(f"sudo apt install {' '.join(pkgs['packages'])}")
    print(f"sudo apt install {' '.join(pkgs['gui_packages'])}")

if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    logging.debug(pformat(pkgs))
    to_string()
