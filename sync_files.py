import os

def read_sections(file_path):
    """读取文件并按井号键分割成段落"""
    sections = {}
    current_key = None
    current_content = []
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                if line.strip().startswith('#'):
                    if current_key is not None:
                        sections[current_key] = ''.join(current_content)
                    current_key = line.strip()
                    current_content = [line]
                else:
                    current_content.append(line)
            
            # 添加最后一个段落
            if current_key is not None:
                sections[current_key] = ''.join(current_content)
                
    except FileNotFoundError:
        print(f"错误：找不到文件 {file_path}")
        return {}
    except Exception as e:
        print(f"读取文件 {file_path} 时发生错误：{str(e)}")
        return {}
        
    return sections

def sync_files(file_a_path, file_b_path):
    """同步文件内容"""
    # 读取两个文件的内容
    sections_a = read_sections(file_a_path)
    sections_b = read_sections(file_b_path)
    
    # 找出需要同步的内容
    new_sections = []
    for key, content in sections_a.items():
        if key not in sections_b:
            new_sections.append(content)
    
    # 如果有新内容，追加到文件B
    if new_sections:
        try:
            with open(file_b_path, 'a', encoding='utf-8') as f:
                for section in new_sections:
                    f.write('\n' + section)
            print(f"成功同步了 {len(new_sections)} 个新段落到文件 {file_b_path}")
        except Exception as e:
            print(f"写入文件 {file_b_path} 时发生错误：{str(e)}")
    else:
        print("没有需要同步的新内容")

if __name__ == "__main__":
    # 设置文件路径（相对路径）
    file_a = r"cheatengine-x86_64.po"  # 源文件
    file_b = r"zh_cn/cheatengine-x86_64.po"  # 目标文件
    
    # 执行同步
    sync_files(file_a, file_b) 