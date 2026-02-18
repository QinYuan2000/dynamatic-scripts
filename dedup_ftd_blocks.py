import glob
import os

START_PREFIX = "[FTD] Producer block:"
END_PREFIX = "fSupmin"

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

            while i < n:
                block_lines.append(lines[i])
                if lines[i].lstrip().startswith(END_PREFIX):
                    break
                i += 1

            block = "".join(block_lines)

            if block not in seen_blocks:
                seen_blocks.add(block)
                output.append(block)

            i += 1
        else:
            output.append(line)
            i += 1

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(output)

    print(f"[OK] Deduplicated: {path}")

os.chdir(orig_cwd)