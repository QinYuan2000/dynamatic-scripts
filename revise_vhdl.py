import re

def process_file(file_path):

    with open(file_path, 'r') as file:
        content = file.read()

    transpFifo_pattern = re.compile(r'entity work\.transpFifo\(arch\) generic map \((\d+,\d+,\d+,\d+),(2\d{3}|1\d{3})\)')
    nontranspFifo_pattern = re.compile(r'entity work\.nontranspFifo\(arch\) generic map \((\d+,\d+,\d+,\d+),(2\d{3}|1\d{3})\)')

    def transpFifo_repl(match):
        first_four = match.group(1) 
        fifth_number = int(match.group(2)) 

        if fifth_number >= 2000:
            new_number = fifth_number - 2000
            return f'entity work.Pipeline(arch) generic map ({first_four},{new_number})'
        else:
            new_number = fifth_number - 1000
            return f'entity work.TEHB_Chain(arch) generic map ({first_four},{new_number})'

    def nontranspFifo_repl(match):
        first_four = match.group(1) 
        fifth_number = int(match.group(2)) 

        if fifth_number >= 2000:
            new_number = fifth_number - 2000
            return f'entity work.elasticFifoInner(arch) generic map ({first_four},{new_number})'
        else:
            new_number = fifth_number - 1000
            return f'entity work.OEHB_Chain(arch) generic map ({first_four},{new_number})'

    content = transpFifo_pattern.sub(transpFifo_repl, content)
    content = nontranspFifo_pattern.sub(nontranspFifo_repl, content)

    with open(file_path, 'w') as file:
        file.write(content)

benchmark = "if_loop_2"
process_file("dynamatic/integration-test/" + benchmark + "/out/hdl/" + benchmark + ".vhd")
