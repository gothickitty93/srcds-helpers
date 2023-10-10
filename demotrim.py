import os
import glob

def get_folder_size(folder_path):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(folder_path):
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            total_size += os.path.getsize(filepath)
    return total_size

def main(demo_folder_path):
    max_size_bytes = 1024 * 1024 * 1024  # 1024MB in bytes
    target_size_bytes = 768 * 1024 * 1024  # 768MB in bytes

    while get_folder_size(demo_folder_path) > max_size_bytes:
        demo_files = glob.glob(os.path.join(demo_folder_path, "*.dem"))
        if not demo_files:
            break

        demo_files.sort(key=lambda x: os.path.getctime(x))  # Sort by creation time (oldest first)
        oldest_demo_file = demo_files[0]

        os.remove(oldest_demo_file)
        print(f"Deleted {oldest_demo_file}")

    print("Folder size is now within the acceptable range.")

if __name__ == "__main__":
    demos_folder = "/path/to/demos"
    main(demos_folder)
