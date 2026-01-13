# Recolect PC name, CPU, RAM & disc space total/available.
# Helps support teams with automatized and effective PC reports.
import psutil
import os
import platform
from datetime import date

name = f"Hardware_report_from_{date.today().isoformat()}.txt"


def audit():
    cpu_usage = psutil.cpu_percent(interval=1)
    processor = platform.processor()
    ram = psutil.virtual_memory()
    disk = psutil.disk_usage('C:/')
    os_name = platform.system()
    version = platform.release()

    ram_total_gb = round(ram.total / (1024**3), 2)
    ram_used_gb = round(ram.used / (1024**3), 2)
    ram_avaible_gb = round(ram.free / (1024**3), 2)

    disk_total_gb = round(disk.total/(1024**3), 2)
    disk_used_gb = round(disk.used/(1024**3), 2)
    disk_free_gb = round(disk.free/(1024**3), 2)
    return (
        f"CPU usage: {cpu_usage}%\n"
        f"Processor: {processor}\n"
        f"RAM: total={ram_total_gb} used={ram_used_gb} available={ram_avaible_gb}\n"
        f"Disk C:: total={disk_total_gb} used={disk_used_gb} free={disk_free_gb}\n"
        f"OS: {os_name} {version}"
    )


if __name__ == "__main__":
    with open(name, "w", encoding="utf-8")as archivo:
        archivo.write(audit())

path_report = os.path.abspath(name)
print(f"The hardward report is saved on: {path_report}")

