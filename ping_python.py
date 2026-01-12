# PING WITH PYTHON : automate ping use with python for Windows

# platform = Allows to check what platform are we on
# subprocess = Standard tool to execute commands for OS (replaces os.system())
# datetime = updates the actual date
import os
import platform
import subprocess
from datetime import date

# Get the actual date for reference
hoy = date.today()
hoy_txt = hoy.isoformat()
name = f"ping_{hoy_txt}.txt"

# Input of the DNS or IP address and count of the pings
host = input("Input IP address or DNS: ").strip()
if not host:
    print("No host provided. Exiting.")
    raise SystemExit(1)
count = 3

# Identifies the OS and proceeds with the ping
if platform.system() == "Windows":
    args = ["ping", "-n", str(count), host]
else:
    args = ["ping", "-c", str(count), host]

try:
    ping = subprocess.run(args, capture_output=True, text=True, check=False)
    output = ping.stdout or ping.stderr or ""
except FileNotFoundError:
    print("The 'ping' command was not found on this system.")
    raise SystemExit(1)
except Exception as e:
    print("Error running ping:", e)
    raise

# Saves and creates and .txt file with the results then shows the path for the file
with open(name, "w", encoding="utf-8") as archivo:
    archivo.write(output)

path_ping = os.path.abspath(name)
print(f"The ping archive is saved on : {path_ping}")
