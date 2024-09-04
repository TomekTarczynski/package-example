from mypackage.example import print_tree_structure, print_file_contents
import os

def main():
    start_directory = os.getcwd()  # You can change this to any directory
    print(f"Starting from directory: {os.path.basename(start_directory)}/")
    
    # Step 1: Print the directory tree structure (relative to the main directory)
    print("\n--- Directory Tree Structure ---")
    print_tree_structure(start_directory, omit_dirs=['.venv', '__pycache__'])

    # Step 2: Print the content of the files, with a maximum file length limit (relative to the main directory)
    print("\n--- File Contents ---")
    print_file_contents(start_directory, omit_dirs=['.venv', '__pycache__'], max_file_length=1024)

if __name__ == "__main__":
    main()
