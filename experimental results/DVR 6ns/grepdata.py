import re
from collections import defaultdict
import os

def analyze_slots(benchmark, index, output_filename):
    file_path = f"{benchmark}/out{index}/hdl/{benchmark}.vhd"
    
    if not os.path.exists(file_path):
        print(f"Error: The file {file_path} does not exist.")
        return
    
    data = {
        'OEHB': defaultdict(int),
        'OEHB_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'TEHB': defaultdict(int),
        'TEHB_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'transpFifo': {'bitwidth': defaultdict(int), 'total_slots': 0},
        # 'nontranspFifo': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'Pipeline': {'bitwidth': defaultdict(int), 'total_slots': 0},
        'DVR': defaultdict(int),
        'DVR_Chain': {'bitwidth': defaultdict(int), 'total_slots': 0},
    }

    pattern = r"work\.(OEHB|TEHB|transpFifo|nontranspFifo|Pipeline|DVR|DVR_Chain|OEHB_Chain|TEHB_Chain)\([^)]*?\)\s*generic\s*map\s*\([^)]*?(\d+)\s*,\s*(\d+)\s*\)"
    
    total_bitwidth_sum = 0
    total_slot_count = 0
    with open(file_path, 'r') as file:
        for line in file:
            matches = re.finditer(pattern, line)
            for match in matches:
                slot_type = match.group(1)
                if slot_type in ['OEHB', 'TEHB', 'DVR']:
                    bitwidth = int(match.group(3)) 
                    data[slot_type][bitwidth] += 1
                    total_bitwidth_sum += bitwidth
                    total_slot_count += 1

                elif slot_type in ['nontranspFifo']:
                    bitwidth = int(match.group(2)) 
                    slots = int(match.group(3)) - 1
                    data['transpFifo']['bitwidth'][bitwidth] += slots
                    data['transpFifo']['total_slots'] += slots
                    total_bitwidth_sum += bitwidth * slots
                    total_slot_count += slots

                    data['OEHB'][bitwidth] += 1
                    data['TEHB'][bitwidth] += 1

                    total_bitwidth_sum += 2 * bitwidth
                    total_slot_count += 2

                else:
                    bitwidth = int(match.group(2)) 
                    slots = int(match.group(3)) 
                    data[slot_type]['bitwidth'][bitwidth] += slots
                    data[slot_type]['total_slots'] += slots
                    total_bitwidth_sum += bitwidth * slots
                    total_slot_count += slots

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

for index in ["fir", "iir", "if_loop_1", "if_loop_2", "sumi3_mem", "video_filter", "matvec", "image_resize", "matrix"]:
    for i in [1,2,3]:
        analyze_slots(index, i, 'slot_bitwidth.txt')
