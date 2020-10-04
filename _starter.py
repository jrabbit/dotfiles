#!/usr/bin/env python3
import sys
import logging
import subprocess

from pathlib import Path
from pprint import pformat

import toml

p = Path("~/.config/jack.laxson", "packages.toml")
pkgs = toml.load(p.expanduser())


def check_pkg_exists(pkg) -> bool:
    try:
        r = subprocess.run(["apt-cache",  "show",  pkg] , check=True, capture_output=True, text=True)
        if len(r.stdout) < 60:
            logging.debug(r)
            logging.debug(r.stdout)
            logging.debug(r.stderr)
            return False
        return True
    except subprocess.CalledProcessError:
        return False

def to_string() -> None:
    print(f"sudo apt install {' '.join(pkgs['packages'])}")
    print(f"sudo apt install {' '.join(pkgs['gui_packages'])}")

if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    logging.debug(pformat(pkgs))
    if len(sys.argv) <2 :
        to_string()
    elif "check" in sys.argv:
        for name, plist in pkgs.items():
            for p in plist:
                check_pkg_exists(p)
