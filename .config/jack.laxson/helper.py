import sys
import subprocess
import toml

if __name__ == "__main__":
    t = toml.load("docker-base-images.toml")
    for x in t['images']:
        prog = sys.argv[1:]
        prog.append(x)
        subprocess.run(prog)
