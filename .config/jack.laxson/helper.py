import sys
import subprocess
from pathlib import Path
import toml

if __name__ == "__main__":
    t = toml.load(Path(__file__).with_name("docker-base-images.toml"))
    for x in t['images']:
        prog = sys.argv[1:]
        prog.append(x)
        subprocess.run(prog)
