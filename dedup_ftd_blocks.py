import glob
import os

START_PREFIX = "[FTD] Producer block:"
END_PREFIX_1 = "fSupDP"
END_PREFIX_2 = "fSupmin"

orig_cwd = os.getcwd()
os.chdir("TempOutputs")

for path in glob.glob("*.txt"):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    seen_blocks = set()
    output = []

    i = 0
    n = len(lines)

    while i < n:
        line = lines[i]

        if line.startswith(START_PREFIX):
            block_lines = [line]
            i += 1
            
            last_fsupmin_idx = -1
            found_fSupDP = False

            while i < n:
                curr_line = lines[i]

                if curr_line.startswith(START_PREFIX):
                    break

                block_lines.append(curr_line)

                if curr_line.lstrip().startswith(END_PREFIX_2):
                    last_fsupmin_idx = len(block_lines) - 1
                
                elif curr_line.lstrip().startswith(END_PREFIX_1):
                    found_fSupDP = True
                    i += 1
                    break

                i += 1

            if found_fSupDP:
                block = "".join(block_lines)
                if block not in seen_blocks:
                    seen_blocks.add(block)
                    output.append(block)
            else:
                if last_fsupmin_idx != -1:
                    actual_block = "".join(block_lines[:last_fsupmin_idx + 1])
                    if actual_block not in seen_blocks:
                        seen_blocks.add(actual_block)
                        output.append(actual_block)

                    over_read_count = len(block_lines) - 1 - last_fsupmin_idx
                    i -= over_read_count
                else:
                    block = "".join(block_lines)
                    if block not in seen_blocks:
                        seen_blocks.add(block)
                        output.append(block)

        else:
            if line.strip() == "":
                if len(output) > 0 and output[-1].strip() == "":
                    i += 1
                    continue
            
            output.append(line)
            i += 1

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(output)

    print(f"[OK] Deduplicated: {path}")

os.chdir(orig_cwd)