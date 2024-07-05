import re

def process_file(file_path):
    # 读取文件内容
    with open(file_path, 'r') as file:
        content = file.read()

    # 定义正则表达式模式
    transpFifo_pattern = re.compile(r'entity work\.transpFifo\(arch\) generic map \((\d+,\d+,\d+,\d+),(2\d{3}|1\d{3})\)')
    nontranspFifo_pattern = re.compile(r'entity work\.nontranspFifo\(arch\) generic map \((\d+,\d+,\d+,\d+),(2\d{3}|1\d{3})\)')

    # 替换 transpFifo 匹配
    def transpFifo_repl(match):
        first_four = match.group(1)  # 获取前四个数字
        fifth_number = int(match.group(2))  # 第五个数字

        if fifth_number >= 2000:
            new_number = fifth_number - 2000
            return f'entity work.Pipeline(arch) generic map ({first_four},{new_number})'
        else:
            new_number = fifth_number - 1000
            return f'entity work.TEHB_Chain(arch) generic map ({first_four},{new_number})'

    # 替换 nontranspFifo 匹配
    def nontranspFifo_repl(match):
        first_four = match.group(1)  # 获取前四个数字
        fifth_number = int(match.group(2))  # 第五个数字

        if fifth_number >= 2000:
            new_number = fifth_number - 2000
            return f'entity work.elasticFifoInner(arch) generic map ({first_four},{new_number})'
        else:
            new_number = fifth_number - 1000
            return f'entity work.OEHB_Chain(arch) generic map ({first_four},{new_number})'

    # 执行替换
    content = transpFifo_pattern.sub(transpFifo_repl, content)
    content = nontranspFifo_pattern.sub(nontranspFifo_repl, content)

    # 将修改后的内容写回文件
    with open(file_path, 'w') as file:
        file.write(content)

# 调用函数处理文件
benchmark = "fir"
process_file("dynamatic/integration-test/" + benchmark + "/out/hdl/" + benchmark + ".vhd")
