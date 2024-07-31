import re
from collections import defaultdict
import os

def analyze_slots(benchmark, index, output_filename):
    # 定义文件路径
    file_path = f"dynamatic/integration-test/{benchmark}/out{index}/hdl/{benchmark}.vhd"
    
    # 确保文件存在
    if not os.path.exists(file_path):
        print(f"Error: The file {file_path} does not exist.")
        return
    
    # 初始化存储结构
    data = {
        'OEHB': defaultdict(int),
        'TEHB': defaultdict(int),
        'DVR': defaultdict(int),
        'transpFifo': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'nontranspFifo': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'Pipeline': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'DVR_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'OEHB_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'TEHB_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
    }

    # 正则表达式模式，匹配到最后两个数字
    pattern = r"work\.(OEHB|TEHB|transpFifo|nontranspFifo|Pipeline|DVR|DVR_Chain|OEHB_Chain|TEHB_Chain)\([^)]*?\)\s*generic\s*map\s*\([^)]*?(\d+)\s*,\s*(\d+)\s*\)"
    
    # 读取和处理文件
    total_bitwidth_sum = 0
    total_slot_count = 0
    with open(file_path, 'r') as file:
        for line in file:
            matches = re.finditer(pattern, line)
            for match in matches:
                slot_type = match.group(1)
                if slot_type in ['OEHB', 'TEHB', 'DVR']:
                    bitwidth = int(match.group(3))  # 最后一个数字是bitwidth
                    data[slot_type][bitwidth] += 1
                    total_bitwidth_sum += bitwidth
                    total_slot_count += 1
                else:
                    bitwidth = int(match.group(2))  # 倒数第二个数字是bitwidth
                    slots = int(match.group(3))  # 最后一个数字是slot number
                    data[slot_type]['bitwidth'][bitwidth] += slots
                    data[slot_type]['total_slots'] += slots
                    total_bitwidth_sum += bitwidth * slots
                    total_slot_count += slots

    # 输出结果到文件
    with open(output_filename, 'a') as output_file:
        output_file.write(f"---------- Start of {benchmark} Index {index} ---------------------------------------\n")
        for slot_type, slots in data.items():
            if slot_type in ['OEHB', 'TEHB', 'DVR']:
                total_slots = sum(slots.values())
                bitwidth_sum = sum(bw * count for bw, count in slots.items())
            else:
                total_slots = slots['total_slots']
                bitwidth_sum = sum(bw * count for bw, count in slots['bitwidth'].items())
            
            if total_slots > 0:
                output_file.write(f"For {benchmark}, Index {index}, Slot Type {slot_type}:\n")
                output_file.write(f"  Total slots: {total_slots}\n")
                for bw, count in (slots['bitwidth'].items() if slot_type not in ['OEHB', 'TEHB', 'DVR'] else slots.items()):
                    output_file.write(f"  Bitwidth {bw}: {count} slots\n")
                output_file.write(f"  Total Bitwidth Sum: {bitwidth_sum}\n\n")

        output_file.write(f"Total slot count across all types: {total_slot_count}\n")
        output_file.write(f"Total bitwidth sum across all types: {total_bitwidth_sum}\n")
        output_file.write(f"----------------------------------------------------------------------\n\n")

    print(f"Analysis completed for {benchmark} Index {index}. Results appended to {output_filename}")

# 示例调用
analyze_slots('if_loop_2', 3, 'slot_bitwidth.txt')
