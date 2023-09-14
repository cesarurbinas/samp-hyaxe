import psutil
import platform
from datetime import datetime
from flask import Flask

app = Flask(__name__)

## UTILS ##
def to_gb(bytes):
    return round(bytes / 1024 ** 3, 2)

def to_mb(bytes):
    return round(bytes / 1024 ** 2, 2)

def get_size(bytes, suffix="B"):
    """
    Scale bytes to its proper format
    e.g:
        1253656 => '1.20MB'
        1253656678 => '1.17GB'
    """
    factor = 1024
    for unit in ["", "K", "M", "G", "T", "P"]:
        if bytes < factor:
            return f"{bytes:.2f}{unit}{suffix}"
        bytes /= factor

## BASIC INFO ##
@app.route('/cpu')
def cpu():
    return f'{psutil.cpu_percent()}'

@app.route('/ram')
def ram():
    return f'{psutil.virtual_memory()[2]}'

@app.route('/net')
def net():
    backlog = 0

    data = psutil.net_io_counters().bytes_recv
    data_up = psutil.net_io_counters().bytes_sent

    gb = round(to_gb(data) - backlog / 1024, 2)
    mb = round(to_mb(data) - backlog, 2)

    gb_up = to_gb(data_up)
    mb_up = to_mb(data_up)

    return f'{str(gb)} GB | {str(mb)} MB[{str(gb_up)} GB | {str(mb_up)} MB'


## ADVANCED INFO ##
@app.route('/system')
def system():
    uname = platform.uname()
    return f"System: {uname.system}\nNode Name: {uname.node}\nRelease: {uname.release}\nVersion: {uname.version}\nMachine: {uname.machine}\nProcessor: {uname.processor}"

@app.route('/boot')
def boot():
    boot_time_timestamp = psutil.boot_time()
    bt = datetime.fromtimestamp(boot_time_timestamp)
    return f"Boot Time: {bt.year}/{bt.month}/{bt.day} {bt.hour}:{bt.minute}:{bt.second}"

@app.route('/core')
def core():
    result = ""
    result += "Physical cores:" + str(psutil.cpu_count(logical=False)) + "\n"
    result += "Total cores:" + str(psutil.cpu_count(logical=True)) + "\n"
    # CPU frequencies
    cpufreq = psutil.cpu_freq()
    result += f"Max Frequency: {cpufreq.max:.2f}Mhz" + "\n"
    result += f"Min Frequency: {cpufreq.min:.2f}Mhz" + "\n"
    result += f"Current Frequency: {cpufreq.current:.2f}Mhz" + "\n"
    # CPU usage
    result += ("CPU Usage Per Core:") + "\n"
    for i, percentage in enumerate(psutil.cpu_percent(percpu=True, interval=1)):
        result += (f"Core {i}: {percentage}%") + "\n"
    result += (f"Total CPU Usage: {psutil.cpu_percent()}%")

    return result

@app.route('/memory')
def memory():
    result = ""
    svmem = psutil.virtual_memory()
    result += f"Total: {get_size(svmem.total)}" + "\n"
    result += f"Available: {get_size(svmem.available)}" + "\n"
    result += f"Used: {get_size(svmem.used)}" + "\n"
    result += f"Percentage: {svmem.percent}%" + "\n\n"

    # get the swap memory details (if exists)
    swap = psutil.swap_memory()
    result += f"Total: {get_size(swap.total)}" + "\n"
    result += f"Free: {get_size(swap.free)}" + "\n"
    result += f"Used: {get_size(swap.used)}" + "\n"
    result += f"Percentage: {swap.percent}%"

    return result

@app.route('/disk')
def disk():
    result = ""
    result += ("Partitions and Usage:") + "\n"
    # get all disk partitions
    partitions = psutil.disk_partitions()
    for partition in partitions:
        result += (f"=== Device: {partition.device} ===") + "\n"
        result += (f"  Mountpoint: {partition.mountpoint}") + "\n"
        result += (f"  File system type: {partition.fstype}") + "\n"
        try:
            partition_usage = psutil.disk_usage(partition.mountpoint)
        except PermissionError:
            # this can be catched due to the disk that
            # isn't ready
            continue
        result += (f"  Total Size: {get_size(partition_usage.total)}") + "\n"
        result += (f"  Used: {get_size(partition_usage.used)}") + "\n"
        result += (f"  Free: {get_size(partition_usage.free)}") + "\n"
        result += (f"  Percentage: {partition_usage.percent}%") + "\n"

    return result

@app.route('/network')
def network():
    result = ""

    if_addrs = psutil.net_if_addrs()
    for interface_name, interface_addresses in if_addrs.items():
        for address in interface_addresses:
            result += (f"=== Interface: {interface_name} ===") + "\n"
            if str(address.family) == 'AddressFamily.AF_INET':
                result += (f"  IP Address: {address.address}") + "\n"
                result += (f"  Netmask: {address.netmask}") + "\n"
                result += (f"  Broadcast IP: {address.broadcast}") + "\n"
            elif str(address.family) == 'AddressFamily.AF_PACKET':
                result += (f"  MAC Address: {address.address}") + "\n"
                result += (f"  Netmask: {address.netmask}") + "\n"
                result += (f"  Broadcast MAC: {address.broadcast}") + "\n"
    # get IO statistics since boot
    net_io = psutil.net_io_counters()
    result += (f"Total Bytes Sent: {get_size(net_io.bytes_sent)}") + "\n"
    result += (f"Total Bytes Received: {get_size(net_io.bytes_recv)}")

    return result

if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 1338, debug = True)